<?php
declare(strict_types=1);

// Educational only: validates and displays a result. No email or storage.
function validateContact(array $input): array
{
    $errors = [];
    $values = [];
    foreach (['name', 'email', 'message'] as $key) {
        if (!isset($input[$key]) || !is_string($input[$key])) {
            $errors[$key] = 'Enter a text value.';
            $values[$key] = '';
            continue;
        }
        $values[$key] = trim($input[$key]);
    }
    if (!isset($errors['name']) && ($values['name'] === '' || strlen($values['name']) > 80)) {
        $errors['name'] = 'Name must contain 1 to 80 bytes.';
    }
    if (!isset($errors['email']) &&
        (strlen($values['email']) > 254 || filter_var($values['email'], FILTER_VALIDATE_EMAIL) === false)) {
        $errors['email'] = 'Enter a valid email address of at most 254 bytes.';
    }
    if (!isset($errors['message']) && ($values['message'] === '' || strlen($values['message']) > 500)) {
        $errors['message'] = 'Message must contain 1 to 500 bytes.';
    }
    return [$values, $errors];
}

function htmlText(string $value): string
{
    return htmlspecialchars($value, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
}

function inputValue(array $values, string $key): string
{
    return isset($values[$key]) && is_string($values[$key]) ? $values[$key] : '';
}

if (PHP_SAPI === 'cli' && in_array('--self-test', $argv ?? [], true)) {
    $checks = 0;
    $check = function (bool $condition, string $message) use (&$checks): void {
        if (!$condition) {
            throw new RuntimeException('FAIL: ' . $message);
        }
        $checks++;
    };
    $sample = ['name' => ' Ada ', 'email' => 'ada@example.org', 'message' => ' Hello '];
    [$valid, $errors] = validateContact($sample);
    $check($errors === [], 'valid fields');
    $check($valid['name'] === 'Ada', 'trim name');
    $check($valid['message'] === 'Hello', 'trim message');
    [, $errors] = validateContact(['email' => 'a@b.org', 'message' => 'ok']);
    $check(isset($errors['name']), 'missing name');
    [, $errors] = validateContact(['name' => '', 'email' => 'a@b.org', 'message' => 'ok']);
    $check(isset($errors['name']), 'empty name');
    [, $errors] = validateContact(['name' => str_repeat('a', 81), 'email' => 'a@b.org', 'message' => 'ok']);
    $check(isset($errors['name']), 'long name');
    [, $errors] = validateContact(['name' => 'Ada', 'email' => 'not-an-email', 'message' => 'ok']);
    $check(isset($errors['email']), 'malformed email');
    [, $errors] = validateContact(['name' => 'Ada', 'message' => 'ok']);
    $check(isset($errors['email']), 'missing email');
    [, $errors] = validateContact(['name' => 'Ada', 'email' => str_repeat('a', 251) . '@x.org', 'message' => 'ok']);
    $check(isset($errors['email']), 'oversized email');
    [, $errors] = validateContact(['name' => 'Ada', 'email' => 'a@b.org', 'message' => '']);
    $check(isset($errors['message']), 'empty message');
    [, $errors] = validateContact(['name' => 'Ada', 'email' => 'a@b.org', 'message' => str_repeat('x', 501)]);
    $check(isset($errors['message']), 'long message');
    [, $errors] = validateContact(['name' => ['bad'], 'email' => 'a@b.org', 'message' => 'ok']);
    $check(isset($errors['name']), 'array injection');
    $escaped = htmlText('<script>alert("x")</script>');
    $check(str_contains($escaped, '&lt;script&gt;'), 'HTML escaping');
    $check(!str_contains($escaped, '<script>'), 'no raw script markup');
    $check(inputValue(['name' => ['not text']], 'name') === '', 'array redisplay guard');
    echo $checks . " PHP form checks passed\n";
    exit;
}

$submitted = ($_SERVER['REQUEST_METHOD'] ?? 'GET') === 'POST';
[$values, $errors] = $submitted ? validateContact($_POST) : [[], []];
$success = $submitted && $errors === [];
?>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Contact form validation lab</title>
</head>
<body>
  <main>
    <h1>Contact form validation lab</h1>
    <?php if ($success): ?>
      <p role="status">Input accepted for demonstration only; nothing was saved or sent.</p>
    <?php endif; ?>
    <form method="post">
      <p>
        <label for="name">Name</label>
        <input id="name" name="name" required maxlength="80"
          value="<?= htmlText(inputValue($values, 'name')) ?>">
        <?php if (isset($errors['name'])): ?>
          <span role="alert"><?= htmlText($errors['name']) ?></span>
        <?php endif; ?>
      </p>
      <p>
        <label for="email">Email</label>
        <input id="email" name="email" type="email" required maxlength="254"
          value="<?= htmlText(inputValue($values, 'email')) ?>">
        <?php if (isset($errors['email'])): ?>
          <span role="alert"><?= htmlText($errors['email']) ?></span>
        <?php endif; ?>
      </p>
      <p>
        <label for="message">Message</label>
        <textarea id="message" name="message" required maxlength="500"><?= htmlText(inputValue($values, 'message')) ?></textarea>
        <?php if (isset($errors['message'])): ?>
          <span role="alert"><?= htmlText($errors['message']) ?></span>
        <?php endif; ?>
      </p>
      <button type="submit">Check input</button>
    </form>
  </main>
</body>
</html>