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

func partOne(numberArray: [Int]){
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

    print("PartOne: Values multiplied are: \(valueA * valueB)")
}

func partTwo(numberArray: [Int]){
    var valueA = 0
    var valueB = 0
    var valueC = 0
    var foundValue = false

    for i in numberArray{
        for j in numberArray{
            for k in numberArray{
                if (i + j + k) == 2020{
                    valueA = i
                    valueB = j
                    valueC = k
                    foundValue = true
                    break
                }
            }
            if foundValue{
                break
            }
        }
        if foundValue{
            break
        }
    }
    print("PartTwo: Values multiplied are: \(valueA * valueB * valueC)")
}

let numberArray = get_input()
partOne(numberArray: numberArray)
partTwo(numberArray: numberArray)
