import Foundation

class Day1 : Day { 
    typealias Input = ([Int], [Int])
    typealias Output = Int

    func readInputForDay(_ day: String, part: String) -> ([Int], [Int]) {
        var list1: [Int]  = []
        var list2: [Int] = []
        do { 
            let fileContents = try String(contentsOfFile: "/Users/ahuabhis/Desktop/aoc/2024/inputs/\(day)/\(part).txt")
            let lines = fileContents.components(separatedBy: .newlines)
            for line in lines { 
                let strings = line.split(separator: " ")
                list1.append(Int(strings[0])!)
                list2.append(Int(strings[1])!)
            }
        }
        catch(let error) { 
            print("Error parsing file \(error)")
        }

        return (list1, list2)
    }

    func part1(input: Input) -> Output {
        var list1 = input.0
        var list2 = input.1
        list1.sort()
        list2.sort()
        var result = 0
        for i in 0..<list1.count { 
            if list1[i] > list2[i] { result += list1[i] - list2[i]}
            else { result += list2[i] - list1[i] }
        }

        return result

    }

    func part2(input: Input) -> Output { 
        let list1 = input.0
        let list2 = input.1
        var counter: [Int : Int] = [:]
        for i in 0..<list2.count { 
            let val = list2[i]
            counter[val] = counter[val] != nil ? counter[val]! + 1 : 1
        }
        var result = 0
        for j in 0..<list1.count{ 
            let val = list1[j]
            let occurences = counter[val]
            if let occurences { 
                result += val * occurences
            }
        }
        return result

    }
}