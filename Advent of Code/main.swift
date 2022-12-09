//
//  main.swift
//  No rights reserved.
//

import Foundation
import RegexHelper

func main() {
    let fileUrl = URL(fileURLWithPath: "./aoc-input")
    guard let inputString = try? String(contentsOf: fileUrl, encoding: .utf8) else { fatalError("Invalid input") }
    
    let lines = inputString.components(separatedBy: "\n")
        .filter { !$0.isEmpty }
    
    // Sample algorithm
    var scoreboard = [String: Int]()
    lines.forEach { line in
        let (name, score) = parseLine(line)
        scoreboard[name] = score
    }
    scoreboard
        .sorted { lhs, rhs in
            lhs.value > rhs.value
        }
        .forEach { name, score in
            print("\(name) \(score) pts")
        }
}

func parseLine(_ line: String) -> (name: String, score: Int) {
    let helper = RegexHelper(pattern: #"([\-\w]*)\s(\d+)"#)
    let result = helper.parse(line)
    let name = result[0]
    let score = Int(result[1])!
    return (name: name, score: score)
}

main()
