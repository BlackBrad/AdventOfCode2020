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

func countTrees(dataArray: [[Character]], x_speed: Int, y_speed: Int) -> Int{
    var count = 0
    var current_x = 0
    var skip_a_line = true

    for line in dataArray{
        if line == dataArray[0]{
            continue
        }
        if y_speed > 1 && skip_a_line{
            skip_a_line = false
            continue
        }

        current_x += x_speed
        if (current_x >= line.count){
            current_x = 0 + (current_x - line.count)
        }
        if line[current_x] == "#"{
            count += 1
        }
        skip_a_line = true
    }

    return count
}

let dataArray = get_input()
// Part One
let tree_count = countTrees(dataArray: dataArray, x_speed: 3, y_speed: 1)
print("Part One: Tree count is: \(tree_count)")

let countA = countTrees(dataArray: dataArray, x_speed: 1, y_speed: 1)
let countB = tree_count
let countC = countTrees(dataArray: dataArray, x_speed: 5, y_speed: 1)
let countD = countTrees(dataArray: dataArray, x_speed: 7, y_speed: 1)
let countE = countTrees(dataArray: dataArray, x_speed: 1, y_speed: 2)

let part_two_answer = countA * countB * countC * countD * countE
print("Part Two: Tree count is: \(part_two_answer)")

