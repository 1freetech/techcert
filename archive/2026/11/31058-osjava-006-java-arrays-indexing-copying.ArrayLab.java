import java.util.Arrays;
import java.util.Objects;

/** Beginner exercise: fixed-length arrays, copies, and safe index access. */
public class ArrayLab {
    static int readAt(int[] values, int index) {
        Objects.requireNonNull(values, "values");
        if (index < 0 || index >= values.length) {
            throw new IndexOutOfBoundsException("index " + index + ", length " + values.length);
        }
        return values[index];
    }

    static int sum(int[] values) {
        Objects.requireNonNull(values, "values");
        int total = 0;
        for (int value : values) {
            total = Math.addExact(total, value); // report overflow instead of wrapping
        }
        return total;
    }

    public static void main(String[] args) {
        int[] original = {4, 7, 9, 12};
        int[] alias = original;
        int[] copy = Arrays.copyOf(original, original.length);
        copy[1] = 20;

        System.out.println("original: " + Arrays.toString(original));
        System.out.println("copy: " + Arrays.toString(copy));
        System.out.println("alias shares array: " + (alias == original));
        System.out.println("index 2: " + readAt(original, 2));
        System.out.println("sum: " + sum(original));
        System.out.println("range [1, 3): " + Arrays.toString(Arrays.copyOfRange(original, 1, 3)));

        int[][] rows = {{4, 7}, {9}, {12, 15, 18}};
        System.out.println("row lengths: " + Arrays.toString(new int[] {
            rows[0].length, rows[1].length, rows[2].length
        }));

        int[] sorted = Arrays.copyOf(original, original.length);
        Arrays.sort(sorted);
        System.out.println("sorted index of 9: " + Arrays.binarySearch(sorted, 9));
    }
}
