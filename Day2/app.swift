#!/usr/bin/swift

import Foundation

struct Entry{
    var lowerBound = 0
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

func count_valid_passwords(entryList: [Entry]){
    var count = 0

    for entry in entryList{
        let charListCount = entry.password.components(separatedBy: entry.character).count - 1
        if charListCount >= entry.lowerBound && charListCount <= entry.upperBound{
            count += 1
        }
    }
    print("Valid password count is: \(count)")
}

var databaseList = get_input()
var entryList = generate_entry_struct_array(database: databaseList)
count_valid_passwords(entryList: entryList)
