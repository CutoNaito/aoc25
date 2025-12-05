def part1():
    ranges = []
    ids = []
    in_range = []

    with open("./input", "r") as file:
        for line in file:
            if "-" in line:
                ranges.append(line.strip('\n'))
            elif any(c.isdigit() for c in line):
                ids.append(int(line.strip('\n')))

    for n in ids:
        for r in ranges:
            range_lr = r.split('-')
            if int(range_lr[0]) <= n <= int(range_lr[1]):
                in_range.append(n)
                break

    return len(in_range)


print(part1())
