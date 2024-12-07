protocol Day { 
    associatedtype Input
    associatedtype Output
    func readInputForDay(_ day: String, part: String) -> Input
    func part1(input: Input) -> Output
    func part2(input: Input) -> Output
}