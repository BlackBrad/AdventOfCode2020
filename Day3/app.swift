#!/usr/bin/swift

import Foundation


// Load the file

func get_input() -> [[Character]]{
    var geographicArray : [[Character]] = []
    do {
        let filePath = "./AOC_Day3.txt"
        let fileContents = try String(contentsOfFile: filePath, encoding: .utf8) // Get the entire file as a single String
        let temp = fileContents.trimmingCharacters(in: .whitespacesAndNewlines) // Trim whitespace and new lines
                                                   .components(separatedBy: "\n") // Split the string by new lines
        for line in temp{
            geographicArray.append(Array(line))
        }
    } catch let error as NSError{
        print("Exception when loading file \(error)")
    }
    return geographicArray
}

func countTrees(dataArray: [[Character]]){
    var count = 0
    var current_x = 0

    for line in dataArray{
        if line == dataArray[0]{
            continue
        }

        current_x += 3
        if (current_x >= line.count){
            current_x = 0 + (current_x - line.count)
        }
        if line[current_x] == "#"{
            count += 1
        }
    }

    print("Tree count is \(count)")
}

let dataArray = get_input()
countTrees(dataArray: dataArray)
