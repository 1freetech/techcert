t1 = 1_000_000_000
t2 = 1_000_001_600
t3 = 1_000_020_000
t4 = 1_000_021_400
forward = t2 - t1
reverse = t4 - t3
offset_ns = (forward - reverse) / 2
delay_ns = (forward + reverse) / 2
assert offset_ns == 100
assert delay_ns == 1500
print(f"offset={offset_ns:.0f} ns delay={delay_ns:.0f} ns")
