# include <stdio.h>
# include <stdlib.h>

int main(int argc, char *argv[]) {
    int lower = 0;
    int upper = 150;

    int i;

    if (argc < 4) {
        if (argc == 2) {
            upper = atoi(argv[1]);
        }

        if (argc == 3) {
            lower = atoi(argv[1]);
            upper = atoi(argv[2]);

            for (i = lower; (i % 10) > 0; i--) {
                printf("    ");
            }
        }

        for (i = lower; i < upper; i++) {
            printf("\e[%dm%3d\e[m ", i, i);

            if (i % 10 == 9) {
                printf("\n");
            }
        }
    } else {
        fprintf(stderr, "Expected 0, 1, or 2 args, got %d\n", argc - 1);
        return 1;
    }

    return 0;
}
