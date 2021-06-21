#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	int upper = 150;
	int lower = 0;
	int i;

	switch (argc) {
	case 3:
		lower = atoi(argv[1]);
		upper = atoi(argv[2]);
		for (i = lower; (i%10) > 0; i--)
			printf("    ");
		/* fall through */
	case 1:
		for (i = lower; i < upper; i++) {
			printf("\e[%dm%3d\e[m ", i, i);
			if (i%10 == 9)
				printf("\n");
		}
		return 0;
	default:
		fprintf(stderr, "Expected 0 or 2 args, got %d\n", argc-1);
		return 1;
	}
}
