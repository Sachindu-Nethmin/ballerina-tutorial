import ballerina/io;
import ballerina/regex;

public function main() {
    // Get input from user
    io:print("Enter calculation (format: number operation number): ");
    string input = io:readln();
    io:print(input);
    // Split the input by spaces
    string[] parts = regex:split(input.trim(), " ");
    
    // Check if we have exactly 3 parts
    if parts.length() != 3 {
        io:println("Error: Please enter exactly 3 values separated by spaces");
        return;
    }
    
    // Parse the input
    string num1Result = parts[0];
    string operation = parts[1];
    string num2Result = parts[2];
    
    // Convert strings to numbers
    float|error num1 = float:fromString(num1Result);
    float|error num2 = float:fromString(num2Result);
    
    // Check for parsing errors
    if num1 is error {
        io:println("Error: Invalid first number");
        return;
    }
    
    if num2 is error {
        io:println("Error: Invalid second number");
        return;
    }
    
    // Perform calculation
    float result = 0.0;
    match operation {
        "+" => {
            result = num1 + num2;
        }
        "-" => {
            result = num1 - num2;
        }
        "*" => {
            result = num1 * num2;
        }
        "/" => {
            if num2 == 0.0 {
                io:println("Error: Division by zero");
                return;
            }
            result = num1 / num2;
        }
        _ => {
            io:println("Error: Invalid operation. Use +, -, *, or /");
            return;
        }
    }
    
    io:println(string `${num1} ${operation} ${num2} = ${result}`);
}
