#include "greeter.hpp"

int main(int argc, char** argv) {
    std::string name = "World";
    
    if (argc > 1) {
        name = argv[1];
    }
    
    Greeter greeter(name);
    greeter.greet();
    
    return 0;
}
