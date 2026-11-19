public final class MethodLab {
    private MethodLab() { }

    static int add(int a, int b) {
        return Math.addExact(a, b);
    }

    static double add(double a, double b) {
        return a + b;
    }

    static String describe(String name, int count) {
        return name + ": " + count;
    }

    static int sum(int[] values) {
        if (values == null) {
            throw new IllegalArgumentException("values must not be null");
        }
        int total = 0;
        for (int value : values) {
            total = Math.addExact(total, value);
        }
        return total;
    }

    static void changeNumber(int value) {
        value = 99;
    }

    static void changeFirst(int[] values) {
        values[0] = 99;
    }

    static void replaceArray(int[] values) {
        values = new int[] {500};
    }

    static int countPositive(int... values) {
        int count = 0;
        for (int value : values) {
            if (value > 0) {
                count++;
            }
        }
        return count;
    }

    static void verify(boolean ok, String label) {
        if (!ok) {
            throw new AssertionError(label);
        }
    }

    public static void main(String[] args) {
        verify(add(3, 4) == 7, "integer overload");
        verify(add(1.5, 2.25) == 3.75, "double overload");
        verify(describe("devices", 3).equals("devices: 3"), "return value");
        verify(sum(new int[] {2, 4, 6}) == 12, "array parameter");
        verify(countPositive(-2, 0, 3, 7) == 2, "variable arguments");

        int number = 7;
        changeNumber(number);
        verify(number == 7, "primitive passed by value");

        int[] readings = {1, 2, 3};
        changeFirst(readings);
        verify(readings[0] == 99, "shared array mutated");
        replaceArray(readings);
        verify(readings[0] == 99, "caller reference unchanged");
        verify(sum(readings) == 104, "array still accessible");

        try {
            sum(null);
            throw new AssertionError("null input was accepted");
        } catch (IllegalArgumentException expected) {
            verify(expected.getMessage().contains("null"), "null error");
        }
        System.out.println("10 method checks passed");
        System.out.println(describe("readings", readings.length));
    }
}