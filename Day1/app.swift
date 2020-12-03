#!/usr/bin/swift

import Foundation

let file_path = "./AOC_Day1.txt"

// Load the file
func get_input() -> [Int]{
    do {
        let fileContents = try String(contentsOfFile: file_path, encoding: .utf8) // Get the entire file as a single String
        let numberArray = fileContents.trimmingCharacters(in: .whitespacesAndNewlines) // Trim whitespace and new lines
                                                          .components(separatedBy: "\n") // Split the string by new lines
                                                          .map({Int($0) ?? 0}) //Convert the array to an array of ints
        return numberArray
    } catch let error as NSError{
        print("Exception when loading file \(error)")
    }
    return [0]
}

let numberArray = get_input()

// Iterate through the file to find the matching integers
var valueA = 0
var valueB = 0
var foundValue = false

//print("Array is \(numberArray)")

for i in numberArray{
    for j in numberArray{
        if (i + j) == 2020{
            valueA = i
            valueB = j
            foundValue = true
            break
        }
    }
    if foundValue{
        break
    }
}

print("Values multiplied are: \(valueA * valueB)")
