#ifndef GREETER_HPP
#define GREETER_HPP

#include <string>
#include <iostream>

/**
 * @brief A simple greeter class that says hello.
 */
class Greeter {
private:
    std::string name_;

public:
    explicit Greeter(const std::string& name);
    void greet() const;
};

#endif /* GREETER_HPP */
