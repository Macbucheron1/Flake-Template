#define _POSIX_C_SOURCE 200112L
#include "header.h"

int main(int argc, char **argv)
{
    const char *name = "World";
    
    if (argc > 1) {
        name = argv[1];
    }
    
    hello_world(name);
    return 0;
}