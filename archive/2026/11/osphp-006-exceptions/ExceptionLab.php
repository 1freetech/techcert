<?php
declare(strict_types=1);

/**
 * Open CERT OSPHP.006 — exceptions and defensive error handling.
 * All readings and limits are illustrative, not equipment specifications.
 */
function parseWattReading(string $raw, float $upperLimit = 1000.0): float
{
    if (!is_finite($upperLimit) || $upperLimit <= 0.0) {
        throw new InvalidArgumentException('The limit must be finite and positive.');
    }

    $text = trim($raw);
    if (strlen($text) > 24 || preg_match('/\A(?:0|[1-9][0-9]*)(?:\.[0-9]{1,2})?\z/D', $text) !== 1) {
        throw new InvalidArgumentException('Expected an unsigned decimal with at most two fractional digits.');
    }

    $value = (float) $text;
    if (!is_finite($value) || $value > $upperLimit) {
        throw new DomainException('Reading exceeds the educational example limit.');
    }
    return $value;
}

/** @param list<string> $rawReadings */
function summarizeReadings(array $rawReadings, float $upperLimit = 1000.0): array
{
    if (!is_finite($upperLimit) || $upperLimit <= 0.0) {
        throw new InvalidArgumentException('The aggregate limit must be finite and positive.');
    }
    if (count($rawReadings) > 10000) {
        throw new LengthException('Too many sample readings.');
    }
    $summary = [
        'accepted' => 0,
        'rejected' => 0,
        'processed' => 0,
        'totalWatts' => 0.0,
        'decisions' => [],
    ];
    foreach ($rawReadings as $raw) {
        try {
            $watts = parseWattReading($raw, $upperLimit);
            $summary['accepted']++;
            $summary['totalWatts'] += $watts;
            $summary['decisions'][] = 'accepted';
        } catch (InvalidArgumentException | DomainException $e) {
            $summary['rejected']++;
            // In a real application, record a safe error code, not private input.
            $summary['decisions'][] = 'rejected';
        } finally {
            $summary['processed']++;
        }
    }
    if (!is_finite($summary['totalWatts'])) {
        throw new RuntimeException('The aggregate is not finite.');
    }
    return $summary;
}

function illustrateFinally(bool $fail): array
{
    $steps = [];
    try {
        $steps[] = 'try';
        if ($fail) {
            throw new RuntimeException('Illustrative failure');
        }
        $steps[] = 'success';
    } catch (RuntimeException $e) {
        $steps[] = 'catch';
    } finally {
        $steps[] = 'finally';
    }
    return $steps;
}

if (realpath($_SERVER['SCRIPT_FILENAME'] ?? '') === __FILE__) {
    $summary = summarizeReadings(['120', '35.50', 'oops', '1200', '0']);
    echo 'Accepted: ' . $summary['accepted'] . PHP_EOL;
    echo 'Rejected: ' . $summary['rejected'] . PHP_EOL;
    echo 'Processed: ' . $summary['processed'] . PHP_EOL;
    echo 'Total watts (illustrative): ' . number_format($summary['totalWatts'], 2, '.', '') . PHP_EOL;
    echo 'Finally on success: ' . implode(' > ', illustrateFinally(false)) . PHP_EOL;
    echo 'Finally on failure: ' . implode(' > ', illustrateFinally(true)) . PHP_EOL;
}
