import Foundation

/**
 * This program asks the user for the log size
 * and calculates the amount of logs that can be loaded into the truck.
 * @author Yoma Ozoh
 * @version 1.0
 * @since 2026-09-17
 */

// Custom error to replicate Java's NumberFormatException
enum InputError: Error {
    case numberFormatException
}

// Class-level constants
/**
 * This constant represent the weight of a log.
 */
private let LOG_WEIGHT: Double = 20.0

/**
 * This constant represent the truck capacity in kg.
 */
private let TRUCK_CAPACITY: Double = 1100.0

// Main logic execution
// Welcome the user
print("Welcome, we will be calculating how many logs can fit in a truck")
// tell user the truck capacity and log weight
print("The truck capacity is 1100 kg and each log weighs 20 kg.")

print("Enter the size of the log (0.25 m, 0.5 m, 1 m): ", terminator: "")

// Getting input from user
let radstring = readLine() ?? ""

do {
    // Convert the string to a double
    guard let radDouble = Double(radstring) else {
        throw InputError.numberFormatException
    }

    // If log size is invalid, tell the user to input
    // a valid log size of 0.25, 0.5, or 1
    if radDouble != 1.0 && radDouble != 0.5 && radDouble != 0.25 {
        print("Invalid log size. Please enter 0.25, 0.5, or 1.")
    } else {
        // Calculate the log weight
        let userLogWeight = radDouble * LOG_WEIGHT
        let logsInTruck = TRUCK_CAPACITY / userLogWeight

        // Display the amount of logs that can fit in the truck,
        // rounded to 2 decimal places
        print("The amount of " + radstring + "m logs that can fit in the truck ", terminator: "")
        print("is ", terminator: "")
        print(String(format: "%.2f", logsInTruck), terminator: "")
        print(" logs.")
    }
} catch {
    print("Invalid input. Please enter a valid input.")
}