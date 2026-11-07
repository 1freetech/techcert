"""Host-only teaching model of two independent transactional record slots.
NOT a NOR flash driver, filesystem, or proof of hardware power-loss safety.
"""
import struct
import zlib

RECORD_SIZE = 13
COMMIT = 0xA5

def encode(sequence: int, value: int) -> bytes:
    data = struct.pack('<II', sequence, value)
    checksum = zlib.crc32(data) & 0xffffffff
    return data + struct.pack('<I', checksum)

def decode(slot: bytearray):
    if len(slot) < RECORD_SIZE or slot[12] != COMMIT:
        return None
    data = bytes(slot[:8])
    crc_stored = struct.unpack('<I', bytes(slot[8:12]))[0]
    if (zlib.crc32(data) & 0xffffffff) != crc_stored:
        return None
    return struct.unpack('<II', data)

def recover(slots):
    valid = [entry for slot in slots if (entry := decode(slot)) is not None]
    return max(valid, default=(0, 0), key=lambda entry: entry[0])

def write_record(slots, sequence: int, value: int, power_cut: bool = False):
    inactive = sequence % 2
    # Independently erasable slots are an EXPLICIT SIMULATION assumption.
    slots[inactive] = bytearray([0xff] * RECORD_SIZE)
    slots[inactive][:12] = encode(sequence, value)
    if not power_cut:
        slots[inactive][12] = COMMIT

def main():
    slots = [bytearray([0xff] * RECORD_SIZE) for _ in range(2)]
    write_record(slots, 1, 40)
    assert recover(slots) == (1, 40)
    print('initial recovery:', recover(slots))

    write_record(slots, 2, 99, power_cut=True)
    assert recover(slots) == (1, 40)
    print('interrupted write:', recover(slots))

    write_record(slots, 2, 99)
    assert recover(slots) == (2, 99)
    print('committed write:', recover(slots))

    slots[0][4] ^= 0x01  # Corrupt stored value; CRC invalidates new record.
    assert recover(slots) == (1, 40)
    print('corrupt latest:', recover(slots))

if __name__ == '__main__':
    main()
