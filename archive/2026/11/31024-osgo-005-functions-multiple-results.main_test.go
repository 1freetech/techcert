package main

import "testing"

func TestAverage(t *testing.T) {
    got, err := average(10, 20, 30)
    if err != nil || got != 20 {
        t.Fatalf("average = %v, %v; want 20, nil", got, err)
    }
    if _, err := average(); err == nil {
        t.Fatal("average without values should return an error")
    }
}

func TestMinMax(t *testing.T) {
    low, high, err := minMax([]int{9, 2, 15, 7})
    if err != nil || low != 2 || high != 15 {
        t.Fatalf("minMax = %d, %d, %v; want 2, 15, nil", low, high, err)
    }
    if _, _, err := minMax(nil); err == nil {
        t.Fatal("minMax empty input should return an error")
    }
}

func TestCountAbove(t *testing.T) {
    data := []int{2, 6, 8, 12, 18}
    for _, tc := range []struct{ threshold, want int }{
        {0, 5}, {5, 4}, {10, 2}, {15, 1}, {20, 0},
    } {
        got := countAbove(tc.threshold, data...)
        if got != tc.want {
            t.Errorf("countAbove(%d) = %d; want %d", tc.threshold, got, tc.want)
        }
    }
}
