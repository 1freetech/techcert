// Open CERT / TechCert OSC#.005 — C# Control Flow
// All sample readings and thresholds are fictional, not equipment specifications.
using System;
using System.Collections.Generic;
using System.Linq;

if (args.Length == 1 && args[0] == "--test")
{
    return SelfTests.Run();
}
if (args.Length != 0)
{
    Console.Error.WriteLine("Usage: dotnet run -- [--test]");
    return 2;
}

int?[] samples = [35, 70, null, 92, 80];
foreach (int? value in samples)
{
    Console.WriteLine($"Reading: {value?.ToString() ?? "missing"}, status: {ControlFlow.Classify(value)}");
}
ScanResult result = ControlFlow.ScanUntilAlert(samples);
Console.WriteLine($"Accepted before stop: {result.ValidCount}");
Console.WriteLine($"Skipped before stop: {result.SkippedCount}");
Console.WriteLine($"Sum before stop: {result.SumWatts} W (illustrative)");
Console.WriteLine($"First alert index: {result.FirstAlertIndex}");
Console.WriteLine($"Polling attempts: {ControlFlow.CountAttempts(2, 5)}");
Console.WriteLine($"Do-while count for limit 0: {ControlFlow.DoAtLeastOnce(0)}");
return 0;

public readonly record struct ScanResult(
    int ValidCount, int SkippedCount, int SumWatts, int FirstAlertIndex);

public static class ControlFlow
{
    public static string Classify(int? watts)
    {
        if (watts is null) return "MISSING";
        if (watts.Value is < 0 or > 1000) return "INVALID";
        if (watts.Value >= 90) return "ALERT";
        if (watts.Value >= 70) return "WATCH";
        return "NORMAL";
    }

    public static int Priority(string status)
    {
        switch (status)
        {
            case "ALERT": return 3;
            case "WATCH": return 2;
            case "NORMAL": return 1;
            default: throw new ArgumentException("Unknown status.", nameof(status));
        }
    }

    public static List<string> ClassifyAll(IReadOnlyList<int?> values)
    {
        ArgumentNullException.ThrowIfNull(values);
        List<string> labels = new();
        foreach (int? value in values)
        {
            labels.Add(Classify(value));
        }
        return labels;
    }

    public static ScanResult ScanUntilAlert(IReadOnlyList<int?> values)
    {
        ArgumentNullException.ThrowIfNull(values);
        int valid = 0;
        int skipped = 0;
        int sum = 0;
        int alertIndex = -1;

        for (int index = 0; index < values.Count; index++)
        {
            int? reading = values[index];
            if (reading is null || reading.Value is < 0 or > 1000)
            {
                skipped++;
                continue;
            }

            valid++;
            checked { sum += reading.Value; }
            if (reading.Value >= 90)
            {
                alertIndex = index;
                break;
            }
        }
        return new ScanResult(valid, skipped, sum, alertIndex);
    }

    public static int SumOdd(IReadOnlyList<int> values)
    {
        ArgumentNullException.ThrowIfNull(values);
        int sum = 0;
        foreach (int value in values)
        {
            if (value % 2 == 0) continue;
            checked { sum += value; }
        }
        return sum;
    }

    public static int CountAttempts(int readyAfter, int maxAttempts)
    {
        if (readyAfter < 1 || maxAttempts < 0 || maxAttempts > 10000)
            throw new ArgumentOutOfRangeException(nameof(maxAttempts));
        int attempts = 0;
        while (attempts < maxAttempts)
        {
            attempts++;
            if (attempts >= readyAfter) break;
        }
        return attempts;
    }

    public static int DoAtLeastOnce(int limit)
    {
        if (limit < 0 || limit > 10000)
            throw new ArgumentOutOfRangeException(nameof(limit));
        int count = 0;
        do { count++; } while (count < limit);
        return count;
    }
}

public static class SelfTests
{
    public static int Run()
    {
        int passed = 0;
        void Check(string description, bool condition)
        {
            if (!condition) throw new InvalidOperationException($"FAIL: {description}");
            passed++;
        }
        bool Throws<T>(Action action) where T : Exception
        {
            try { action(); return false; }
            catch (T) { return true; }
        }

        Check("missing input", ControlFlow.Classify(null) == "MISSING");
        Check("negative reading", ControlFlow.Classify(-1) == "INVALID");
        Check("over limit reading", ControlFlow.Classify(1001) == "INVALID");
        Check("zero", ControlFlow.Classify(0) == "NORMAL");
        Check("normal upper boundary", ControlFlow.Classify(69) == "NORMAL");
        Check("watch lower boundary", ControlFlow.Classify(70) == "WATCH");
        Check("watch upper boundary", ControlFlow.Classify(89) == "WATCH");
        Check("alert lower boundary", ControlFlow.Classify(90) == "ALERT");
        Check("alert upper boundary", ControlFlow.Classify(1000) == "ALERT");
        Check("priority normal", ControlFlow.Priority("NORMAL") == 1);
        Check("priority watch", ControlFlow.Priority("WATCH") == 2);
        Check("priority alert", ControlFlow.Priority("ALERT") == 3);
        Check("priority unknown", Throws<ArgumentException>(() => ControlFlow.Priority("OFF")));
        int?[] data = [35, 70, null, 92, 80];
        ScanResult scan = ControlFlow.ScanUntilAlert(data);
        Check("scan count", scan.ValidCount == 3);
        Check("scan skipped", scan.SkippedCount == 1);
        Check("scan sum", scan.SumWatts == 197);
        Check("first alert position", scan.FirstAlertIndex == 3);
        Check("unvisited final reading", scan.SumWatts != 277);
        Check("no alert", ControlFlow.ScanUntilAlert(new int?[] { 2, 3 }).FirstAlertIndex == -1);
        Check("empty scan", ControlFlow.ScanUntilAlert(Array.Empty<int?>()).ValidCount == 0);
        List<string> statuses = ControlFlow.ClassifyAll(data);
        Check("foreach count", statuses.Count == 5);
        Check("foreach missing status", statuses[2] == "MISSING");
        Check("foreach final alert", statuses[4] == "WATCH");
        Check("continue for even", ControlFlow.SumOdd(new int[] { 2, 3, 4, 5 }) == 8);
        Check("while stops when ready", ControlFlow.CountAttempts(2, 5) == 2);
        Check("while obeys cap", ControlFlow.CountAttempts(10, 3) == 3);
        Check("while zero cap", ControlFlow.CountAttempts(3, 0) == 0);
        Check("do while executes once", ControlFlow.DoAtLeastOnce(0) == 1);
        Check("do while three times", ControlFlow.DoAtLeastOnce(3) == 3);
        Check("invalid poll attempt", Throws<ArgumentOutOfRangeException>(() => ControlFlow.CountAttempts(0, 2)));
        Check("negative do while limit", Throws<ArgumentOutOfRangeException>(() => ControlFlow.DoAtLeastOnce(-1)));
        Check("null scan rejected", Throws<ArgumentNullException>(() => ControlFlow.ScanUntilAlert(null!)));
        Console.WriteLine($"PASS: {passed} C# checks");
        return 0;
    }
}
