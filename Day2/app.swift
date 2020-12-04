#!/usr/bin/swift

import Foundation

struct Entry{
    // For Part 1 this is the lower bounds for the range of how many
    // instances of character are in password
    // For Part 2 this is the lower index of password for the possible
    // occurance of character there.
    var lowerBound = 0
    // For Part 1 this is the upper bounds for the range of how many
    // instances of character are in password
    // For Part 2 this is the higher index of password for the possible
    // occurance of character there.
    var upperBound = 0
    var character = ""
    var password = ""
}

// Load the file
func get_input() -> [String]{
    do {
        let filePath = "./AOC_Day2.txt"
        let fileContents = try String(contentsOfFile: filePath, encoding: .utf8) // Get the entire file as a single String
        return fileContents.trimmingCharacters(in: .whitespacesAndNewlines) // Trim whitespace and new lines
                                                   .components(separatedBy: "\n") // Split the string by new lines
    } catch let error as NSError{
        print("Exception when loading file \(error)")
    }
    return [""]
}

func generate_entry_struct_array(database: [String]) -> [Entry]{
    var entryList : [Entry] = []

    for entry in databaseList{
        // Parse the range
        // Get the lower bound
        var rangeIndex = entry.firstIndex(of: "-") ?? entry.endIndex
        let lowerBound = Int(entry[..<rangeIndex]) ?? 0
        // Get the upper bound
        rangeIndex = entry.index(rangeIndex, offsetBy: 1)
        var firstSpaceIndex = entry.firstIndex(of: " ") ?? entry.endIndex
        let upperBound = Int(entry[rangeIndex..<firstSpaceIndex]) ?? 0
        // Get the character
        firstSpaceIndex = entry.index(firstSpaceIndex, offsetBy: 1)
        var colonIndex = entry.firstIndex(of: ":") ?? entry.endIndex
        let char = String(entry[firstSpaceIndex..<colonIndex])
        // Get the password
        // Offset by two so that we can skip over the space
        colonIndex = entry.index(colonIndex, offsetBy: 2)
        let lastIndex = entry.index(entry.endIndex, offsetBy:-1)
        let password = String(entry[colonIndex...lastIndex])

        entryList.append(Entry(lowerBound: lowerBound,
                               upperBound: upperBound,
                               character: char,
                               password: password))
    }

    return entryList
}

// For part 1
func count_valid_passwords_part_one(entryList: [Entry]){
    var count = 0

    for entry in entryList{
        let charListCount = entry.password.components(separatedBy: entry.character).count - 1
        if charListCount >= entry.lowerBound && charListCount <= entry.upperBound{
            count += 1
        }
    }
    print("Part 1: Valid password count is: \(count)")
}

// For part 2
func count_valid_passwords_part_two(entryList: [Entry]){
    var count = 0

    for entry in entryList{
        let charAIndex = entry.password.index(entry.password.startIndex,
                                              offsetBy: entry.lowerBound - 1)
        let charBIndex = entry.password.index(entry.password.startIndex,
                                              offsetBy: entry.upperBound - 1)
        let charA = String(entry.password[charAIndex])
        let charB = String(entry.password[charBIndex])

        if charA == entry.character || charB == entry.character{
            if charA != charB{
                count += 1
            }
        }
    }
    print("Part 2: Valid password count is: \(count)")
}

let databaseList = get_input()
let entryList = generate_entry_struct_array(database: databaseList)
count_valid_passwords_part_one(entryList: entryList)
count_valid_passwords_part_two(entryList: entryList)
