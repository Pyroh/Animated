//
//  AnimatedTwoArgs.swift
//
//  Animated
//
//  MIT License
//
//  Copyright (c) 2020 Pierre Tacchi
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//


import SwiftUI

/// A container that animates any view based on the given animatable data.
/// - Parameters:
///   - valueA: Data that animate.
///   - valueB: Data that animate.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func Animated<A: Animatable, B: Animatable, Content: View>(_ valueA: A, _ valueB: B, @ViewBuilder content: @escaping (A, B) -> Content) -> some View {
	Animated(valueA) { a in
		Animated(valueB) { b in
			content(a, b)
		}
	}
}

/// A container that animates any view based on the given animatable data.
/// - Parameters:
///   - valueA: Data that animate.
///   - bindingB: Data that animate.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func Animated<A: Animatable, B: Animatable, Content: View>(_ valueA: A, _ bindingB: Binding<B>, @ViewBuilder content: @escaping (A, Binding<B>) -> Content) -> some View {
	Animated(valueA) { a in
		Animated(bindingB) { b in
			content(a, b)
		}
	}
}

/// A container that animates any view based on the given animatable data.
/// - Parameters:
///   - bindingA: Data that animate.
///   - valueB: Data that animate.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func Animated<A: Animatable, B: Animatable, Content: View>(_ bindingA: Binding<A>, _ valueB: B, @ViewBuilder content: @escaping (Binding<A>, B) -> Content) -> some View {
	Animated(bindingA) { a in
		Animated(valueB) { b in
			content(a, b)
		}
	}
}

/// A container that animates any view based on the given animatable data.
/// - Parameters:
///   - bindingA: Data that animate.
///   - bindingB: Data that animate.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func Animated<A: Animatable, B: Animatable, Content: View>(_ bindingA: Binding<A>, _ bindingB: Binding<B>, @ViewBuilder content: @escaping (Binding<A>, Binding<B>) -> Content) -> some View {
	Animated(bindingA) { a in
		Animated(bindingB) { b in
			content(a, b)
		}
	}
}

/// A container that animates any view based on the given animatable data.
/// - Parameters:
///   - valueA: Data that animate.
///   - valueB: Data that animate.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func Animated<A: Animatable, B: VectorArithmetic, Content: View>(_ valueA: A, _ valueB: B, @ViewBuilder content: @escaping (A, B) -> Content) -> some View {
	Animated(valueA) { a in
		Animated(valueB) { b in
			content(a, b)
		}
	}
}

/// A container that animates any view based on the given animatable data.
/// - Parameters:
///   - valueA: Data that animate.
///   - bindingB: Data that animate.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func Animated<A: Animatable, B: VectorArithmetic, Content: View>(_ valueA: A, _ bindingB: Binding<B>, @ViewBuilder content: @escaping (A, Binding<B>) -> Content) -> some View {
	Animated(valueA) { a in
		Animated(bindingB) { b in
			content(a, b)
		}
	}
}

/// A container that animates any view based on the given animatable data.
/// - Parameters:
///   - bindingA: Data that animate.
///   - valueB: Data that animate.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func Animated<A: Animatable, B: VectorArithmetic, Content: View>(_ bindingA: Binding<A>, _ valueB: B, @ViewBuilder content: @escaping (Binding<A>, B) -> Content) -> some View {
	Animated(bindingA) { a in
		Animated(valueB) { b in
			content(a, b)
		}
	}
}

/// A container that animates any view based on the given animatable data.
/// - Parameters:
///   - bindingA: Data that animate.
///   - bindingB: Data that animate.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func Animated<A: Animatable, B: VectorArithmetic, Content: View>(_ bindingA: Binding<A>, _ bindingB: Binding<B>, @ViewBuilder content: @escaping (Binding<A>, Binding<B>) -> Content) -> some View {
	Animated(bindingA) { a in
		Animated(bindingB) { b in
			content(a, b)
		}
	}
}

/// A container that animates any view based on the given animatable data.
/// - Parameters:
///   - valueA: Data that animate.
///   - valueB: Data that animate.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func Animated<A: VectorArithmetic, B: Animatable, Content: View>(_ valueA: A, _ valueB: B, @ViewBuilder content: @escaping (A, B) -> Content) -> some View {
	Animated(valueA) { a in
		Animated(valueB) { b in
			content(a, b)
		}
	}
}

/// A container that animates any view based on the given animatable data.
/// - Parameters:
///   - valueA: Data that animate.
///   - bindingB: Data that animate.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func Animated<A: VectorArithmetic, B: Animatable, Content: View>(_ valueA: A, _ bindingB: Binding<B>, @ViewBuilder content: @escaping (A, Binding<B>) -> Content) -> some View {
	Animated(valueA) { a in
		Animated(bindingB) { b in
			content(a, b)
		}
	}
}

/// A container that animates any view based on the given animatable data.
/// - Parameters:
///   - bindingA: Data that animate.
///   - valueB: Data that animate.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func Animated<A: VectorArithmetic, B: Animatable, Content: View>(_ bindingA: Binding<A>, _ valueB: B, @ViewBuilder content: @escaping (Binding<A>, B) -> Content) -> some View {
	Animated(bindingA) { a in
		Animated(valueB) { b in
			content(a, b)
		}
	}
}

/// A container that animates any view based on the given animatable data.
/// - Parameters:
///   - bindingA: Data that animate.
///   - bindingB: Data that animate.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func Animated<A: VectorArithmetic, B: Animatable, Content: View>(_ bindingA: Binding<A>, _ bindingB: Binding<B>, @ViewBuilder content: @escaping (Binding<A>, Binding<B>) -> Content) -> some View {
	Animated(bindingA) { a in
		Animated(bindingB) { b in
			content(a, b)
		}
	}
}

/// A container that animates any view based on the given animatable data.
/// - Parameters:
///   - valueA: Data that animate.
///   - valueB: Data that animate.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func Animated<A: VectorArithmetic, B: VectorArithmetic, Content: View>(_ valueA: A, _ valueB: B, @ViewBuilder content: @escaping (A, B) -> Content) -> some View {
	Animated(valueA) { a in
		Animated(valueB) { b in
			content(a, b)
		}
	}
}

/// A container that animates any view based on the given animatable data.
/// - Parameters:
///   - valueA: Data that animate.
///   - bindingB: Data that animate.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func Animated<A: VectorArithmetic, B: VectorArithmetic, Content: View>(_ valueA: A, _ bindingB: Binding<B>, @ViewBuilder content: @escaping (A, Binding<B>) -> Content) -> some View {
	Animated(valueA) { a in
		Animated(bindingB) { b in
			content(a, b)
		}
	}
}

/// A container that animates any view based on the given animatable data.
/// - Parameters:
///   - bindingA: Data that animate.
///   - valueB: Data that animate.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func Animated<A: VectorArithmetic, B: VectorArithmetic, Content: View>(_ bindingA: Binding<A>, _ valueB: B, @ViewBuilder content: @escaping (Binding<A>, B) -> Content) -> some View {
	Animated(bindingA) { a in
		Animated(valueB) { b in
			content(a, b)
		}
	}
}

/// A container that animates any view based on the given animatable data.
/// - Parameters:
///   - bindingA: Data that animate.
///   - bindingB: Data that animate.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func Animated<A: VectorArithmetic, B: VectorArithmetic, Content: View>(_ bindingA: Binding<A>, _ bindingB: Binding<B>, @ViewBuilder content: @escaping (Binding<A>, Binding<B>) -> Content) -> some View {
	Animated(bindingA) { a in
		Animated(bindingB) { b in
			content(a, b)
		}
	}
}
