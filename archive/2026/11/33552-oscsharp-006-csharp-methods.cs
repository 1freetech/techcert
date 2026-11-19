using System;

internal static class MethodLab
{
    private static int checks;

    private static int Add(int left, int right) => checked(left + right);
    private static double Add(double left, double right) => left + right;

    private static string Label(string kind, int count = 1)
        => $"{kind}: {count}";

    private static void Increment(ref int value)
    {
        value++;
    }

    private static bool TryReadWattage(string text, out int watts)
    {
        if (!int.TryParse(text, out watts))
            return false;
        return watts is >= 0 and <= 10000;
    }

    private static int Sum(params int[] values)
    {
        ArgumentNullException.ThrowIfNull(values);
        int total = 0;
        foreach (int value in values)
            total = checked(total + value);
        return total;
    }

    private static void Check(bool condition, string label)
    {
        if (!condition)
            throw new InvalidOperationException(label);
        checks++;
    }

    public static void Main()
    {
        Check(Add(3, 5) == 8, "integer overload");
        Check(Add(2.5, 1.5) == 4.0, "double overload");
        Check(Label("rack") == "rack: 1", "default argument");
        Check(Label("rack", 2) == "rack: 2", "explicit argument");
        Check(Label(count: 3, kind: "switch") == "switch: 3", "named arguments");

        int number = 7;
        Increment(ref number);
        Check(number == 8, "ref updates caller variable");

        Check(TryReadWattage("650", out int watts) && watts == 650, "valid out");
        Check(!TryReadWattage("bad", out int invalid) && invalid == 0, "invalid text");
        Check(!TryReadWattage("-1", out int negative) && negative == -1, "negative");
        Check(!TryReadWattage("10001", out int above) && above == 10001, "over range");

        Check(Sum() == 0, "empty params");
        Check(Sum(1, 2, 3) == 6, "several params");
        Check(Sum(new[] { 4, 5 }) == 9, "array params");
        Check(Add(0, 0) == 0, "zero addition");

        bool nullRejected = false;
        try { Sum(null!); }
        catch (ArgumentNullException) { nullRejected = true; }
        Check(nullRejected, "null array rejected");

        bool overflowCaught = false;
        try { Add(int.MaxValue, 1); }
        catch (OverflowException) { overflowCaught = true; }
        Check(overflowCaught, "checked overflow");

        Check(Label("rack", 0) == "rack: 0", "zero count");
        Check(Label(kind: "router", count: 2) == "router: 2", "named order");

        Console.WriteLine($"{checks} method checks passed");
        Console.WriteLine(Label("devices", 3));
    }
}
