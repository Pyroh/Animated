

import Foundation

let code_A: UInt8 = 0x41
func typeLabel(_ index: Int) -> String {
    String(UnicodeScalar(code_A.advanced(by: index)))
}

let code_a: UInt8 = 0x61
func varLabel(_ index: Int) -> String {
    String(UnicodeScalar(code_a.advanced(by: index)))
}

func p2(_ value: Int) -> Int {
    Int(pow(Double(2), Double(value)))
}

func tabIt(_ str: String) -> String {
    str.split(separator: "\n").map { "\t\($0)" }.joined(separator: "\n")
}

func type(_ flag: Bool, _ index: Int) -> String { flag ?  "\(typeLabel(index)): VectorArithmetic" : "\(typeLabel(index)): Animatable" }
func kind(_ flag: Bool, _ index: Int) -> String { flag ? "Binding<\(typeLabel(index))>" : typeLabel(index) }
func variable(_ flag: Bool, _ index: Int) -> String { flag ? "binding\(typeLabel(index))" : "value\(typeLabel(index))" }

func generateTypes(count: Int, pointer: Int) -> [Bool] {
    let bitRange = count..<count*2
    return bitRange.reversed().lazy.map { pointer & p2($0) == p2($0) }
}

func generateKinds(count: Int, pointer: Int) -> [Bool] {
    let bitRange = 0..<count
    return bitRange.reversed().map { pointer & p2($0) == p2($0) }
}

func generateRequirement(_ types: [Bool]) -> String {
    let types = types.enumerated().map { type($0.element, $0.offset) }.joined(separator: ", ")
    return "<\(types), Content: View>"
}

func generateClosureSign(_ kinds: [Bool]) -> String {
    let args = kinds.enumerated().map { kind($0.element, $0.offset) }.joined(separator: ", ")
    return "@escaping (\(args)) -> Content"
}

func generateFuncArgs(_ kinds: [Bool]) -> String {
    let args = kinds.enumerated().map { "_ \(variable($0.element, $0.offset)): \(kind($0.element, $0.offset))" }.joined(separator: ", ")
    return "(\(args), @ViewBuilder content: \(generateClosureSign(kinds))) -> some View"
}

func generateClosureCall(_ count: Int) -> String {
    "content(\((0..<count).map { varLabel($0) }.joined(separator: ", ")))"
}

func generateFuncSign(_ types: [Bool], _ kinds: [Bool]) -> String {
    let reqs = generateRequirement(types)
    let args = generateFuncArgs(kinds)
    return "public func Animated\(reqs)\(args)"
}

func generateThePyramidOfDoom(_ kinds: [Bool]) -> String {
    let content = generateClosureCall(kinds.count)
    func addStage(to buffer: String, index: Int, kindFlag: Bool) -> String {
        """
        Animated(\(variable(kindFlag, index))) { \(varLabel(index)) in
        \(tabIt(buffer))
        }
        """
    }

    return kinds.enumerated().reversed().reduce(content) { (pyramid, item) -> String in
        addStage(to: pyramid, index: item.offset, kindFlag: item.element)
    }
}

func generateEntry(_ types: [Bool], kinds: [Bool]) -> String {
    """
    \(generateDocumentation(kinds: kinds))
    @available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
    \(generateFuncSign(types, kinds)) {
    \(tabIt(generateThePyramidOfDoom(kinds)))
    }
    """
}

func generateDocumentation(kinds: [Bool]) -> String {
    """
    /// A container that animates any view based on the given animatable data.
    /// - Parameters:
    \(kinds.enumerated().map { "///   - \(variable($0.element, $0.offset)): Data that animate." }.joined(separator: "\n"))
    ///   - content: A view builder that creates the content to animate.
    """
}

func generate(_ count: Int) -> String {
    let range = 0..<p2(count * 2)
    let funcs = range.map {
        let types = generateTypes(count: count, pointer: $0)
        let kinds = generateKinds(count: count, pointer: $0)

        return generateEntry(types, kinds: kinds)
    }.joined(separator: "\n\n")
    return  """
    import SwiftUI

    \(funcs)
    """
}

let count: Int

if CommandLine.arguments.count == 1 {
    count = 2
} else {
    let arg = CommandLine.arguments[1]
    guard let passedCount = Int(arg, radix: 10) else { fatalError() }
    count = passedCount
}

print(generate(count))
