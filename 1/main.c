#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int part1()
{
    int result = 0;
    char buf[256];
    int current = 50;
    int seq;
    char dir;

    FILE *fp = fopen("./input", "r");
    if (!fp) return 1;

    while (fgets(buf, sizeof(buf), fp)) {
        dir = buf[0];
        char *num = strdup(&buf[1]);
        if (!num) return 1;

        seq = strtol(num, NULL, 10);
        
        if (dir == 'L') {
            if (current - (seq % 100) < 0)
                current = 100 - abs(current - (seq % 100));
            else
                current -= (seq % 100);
        } else {
            if (current + (seq % 100) > 99)
                current = (current + seq) % 100;
            else
                current += (seq % 100);
        }

        if (current == 0)
            result++;
    }

    fclose(fp);

    return result;
}

int part2()
{
    int result = 0;
    char buf[256];
    int current = 50;
    int seq;
    char dir;

    FILE *fp = fopen("./input", "r");
    if (!fp) return 1;

    while (fgets(buf, sizeof(buf), fp)) {
        dir = buf[0];
        char *num = strdup(&buf[1]);
        if (!num) return 1;

        seq = strtol(num, NULL, 10);

        for (int i = 0; i < seq; i++) {
            if (dir == 'L') {
                current -= 1;

                if (current == 0)
                    result++;
                
                if (current == -1)
                    current = 99;
            } else {
                current += 1;

                if (current == 100) {
                    current = 0;
                    result++;
                }
            }
        }
    }

    fclose(fp);

    return result;
}

int main()
{
    printf("%d\n", part1());
    printf("%d\n", part2());
}
