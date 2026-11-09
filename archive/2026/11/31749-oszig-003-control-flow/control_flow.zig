const std = @import("std");

const PowerState = enum {
    running,
    standby,
    offline,
};

fn classify(watts: u32) []const u8 {
    return if (watts >= 90)
        "ALERT"
    else if (watts >= 70)
        "WATCH"
    else
        "NORMAL";
}

fn powerStateName(state: PowerState) []const u8 {
    return switch (state) {
        .running => "RUNNING",
        .standby => "STANDBY",
        .offline => "OFFLINE",
    };
}

fn classifyReading(reading: ?u32) []const u8 {
    return if (reading) |watts| classify(watts) else "MISSING";
}

pub fn main() void {
    std.debug.print("80 watts: {s}\n", .{classifyReading(80)});
    std.debug.print("State: {s}\n", .{powerStateName(.running)});
    std.debug.print("No reading: {s}\n", .{classifyReading(null)});
}

test "classification boundaries" {
    try std.testing.expectEqualStrings("NORMAL", classify(0));
    try std.testing.expectEqualStrings("NORMAL", classify(69));
    try std.testing.expectEqualStrings("WATCH", classify(70));
    try std.testing.expectEqualStrings("WATCH", classify(89));
    try std.testing.expectEqualStrings("ALERT", classify(90));
    try std.testing.expectEqualStrings("ALERT", classify(120));
}

test "every enum case" {
    try std.testing.expectEqualStrings("RUNNING", powerStateName(.running));
    try std.testing.expectEqualStrings("STANDBY", powerStateName(.standby));
    try std.testing.expectEqualStrings("OFFLINE", powerStateName(.offline));
}

test "missing and zero readings differ" {
    try std.testing.expectEqualStrings("MISSING", classifyReading(null));
    try std.testing.expectEqualStrings("NORMAL", classifyReading(0));
}
