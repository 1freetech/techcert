package main

import (
    "errors"
    "fmt"
)

// average accepts zero or more float64 arguments and returns a value or error.
func average(values ...float64) (float64, error) {
    if len(values) == 0 {
        return 0, errors.New("at least one value is required")
    }
    var sum float64
    for _, value := range values {
        sum += value
    }
    return sum / float64(len(values)), nil
}

// minMax returns two results and an error; named results aid documentation.
func minMax(values []int) (minimum, maximum int, err error) {
    if len(values) == 0 {
        return 0, 0, errors.New("cannot inspect an empty slice")
    }
    minimum, maximum = values[0], values[0]
    for _, v := range values[1:] {
        if v < minimum {
            minimum = v
        }
        if v > maximum {
            maximum = v
        }
    }
    return minimum, maximum, nil
}

// countAbove places the variadic parameter last, as Go requires.
func countAbove(threshold int, values ...int) int {
    count := 0
    for _, v := range values {
        if v > threshold {
            count++
        }
    }
    return count
}

func main() {
    mean, err := average(10, 20, 30)
    if err != nil {
        fmt.Println("average error:", err)
        return
    }
    fmt.Printf("average: %.2f\n", mean)

    lo, hi, err := minMax([]int{9, 2, 15, 7})
    if err != nil {
        fmt.Println("range error:", err)
        return
    }
    fmt.Printf("minimum: %d, maximum: %d\n", lo, hi)
    fmt.Printf("above five: %d\n", countAbove(5, 2, 6, 8, 1))

    if _, err := average(); err != nil {
        fmt.Println("empty input:", err)
    }
}
