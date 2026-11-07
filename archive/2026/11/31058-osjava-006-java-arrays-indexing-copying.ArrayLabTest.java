import java.util.Arrays;

/** Self-contained assertions: run with java -ea ArrayLabTest. */
public class ArrayLabTest {
    private static int passed = 0;

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
        passed++;
    }

    private static void expect(Class<? extends Throwable> kind, Runnable action) {
        try {
            action.run();
        } catch (Throwable thrown) {
            check(kind.isInstance(thrown), "Expected " + kind + " but got " + thrown);
            return;
        }
        throw new AssertionError("Expected " + kind + " but no exception occurred");
    }

    public static void main(String[] args) {
        int[] original = {4, 7, 9, 12};
        int[] copy = Arrays.copyOf(original, original.length);
        copy[1] = 20;
        check(Arrays.equals(original, new int[]{4, 7, 9, 12}), "copy changed original");
        check(Arrays.equals(copy, new int[]{4, 20, 9, 12}), "copy values");
        check(ArrayLab.readAt(original, 2) == 9, "readAt index 2");
        check(ArrayLab.sum(original) == 32, "sum");
        check(Arrays.equals(Arrays.copyOfRange(original, 1, 3), new int[]{7, 9}), "range");
        expect(IndexOutOfBoundsException.class, () -> ArrayLab.readAt(original, -1));
        expect(IndexOutOfBoundsException.class, () -> ArrayLab.readAt(original, 4));
        expect(NullPointerException.class, () -> ArrayLab.readAt(null, 0));
        expect(ArithmeticException.class, () -> ArrayLab.sum(new int[]{Integer.MAX_VALUE, 1}));
        System.out.println("PASS: " + passed + " array checks");
    }
}
