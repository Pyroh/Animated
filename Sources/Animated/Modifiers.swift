//
//  Modifiers.swift
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

// MARK: VectorArithmetic Value

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct ValueModifier<Value: VectorArithmetic, ContentView: View>: AnimatableModifier {
    private var value: Value
    private let content: (Value) -> ContentView

    var animatableData: Value {
        get { value }
        set { value = newValue }
    }

    init(value: Value, content: @escaping (Value) -> ContentView) {
        self.value = value
        self.content = content
    }

    func body(content: Content) -> ContentView {
        return self.content(value)
    }
}

// MARK: Animatable Value

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct AnimatableValueModifier<Value: Animatable, ContentView: View>: AnimatableModifier {
    private var value: Value
    private let content: (Value) -> ContentView

    var animatableData: Value.AnimatableData {
        get { value.animatableData }
        set { value.animatableData = newValue }
    }

    init(value: Value, content: @escaping (Value) -> ContentView) {
        self.value = value
        self.content = content
    }

    func body(content: Content) -> ContentView {
        return self.content(value)
    }
}

// MARK: Transformable Value

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct TransformableValueModifier<Value, A: VectorArithmetic, ContentView: View>: AnimatableModifier {
    private var value: Value
    private let content: (Value) -> ContentView

    private let aToV: (A, Value) -> Value
    private let vToA: (Value) -> A

    var animatableData: A {
        get { vToA(value) }
        set { value = aToV(newValue, value) }
    }

    init(value: Value, content: @escaping (Value) -> ContentView, aToV: @escaping (A, Value) -> Value, vToA: @escaping (Value) -> A) {
        self.value = value
        self.content = content
        self.aToV = aToV
        self.vToA = vToA
    }

    func body(content: Content) -> ContentView {
        return self.content(value)
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct TransformableAnimatableValueModifier<Value, A: Animatable, ContentView: View>: AnimatableModifier {
    private var value: Value
    private let content: (Value) -> ContentView

    private let aToV: (A, Value) -> Value
    private let vToA: (Value) -> A

    var animatableData: A {
        get { vToA(value) }
        set { value = aToV(newValue, value) }
    }

    init(value: Value, content: @escaping (Value) -> ContentView, aToV: @escaping (A, Value) -> Value, vToA: @escaping (Value) -> A) {
        self.value = value
        self.content = content
        self.aToV = aToV
        self.vToA = vToA
    }

    func body(content: Content) -> ContentView {
        return self.content(value)
    }
}

// MARK: VectorArithmetic Binding

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct BindingModifier<Value: VectorArithmetic, ContentView: View>: AnimatableModifier {
    private var binding: Binding<Value>
    private var shadowBinding: Binding<Value> {
        .init(get: {
            self.value
        }) { (newValue) in
            self.binding.wrappedValue = newValue
        }
    }

    private let content: (Binding<Value>) -> ContentView
    private var value: Value

    var animatableData: Value {
        get { value }
        set { value = newValue }
    }

    init(binding: Binding<Value>, content: @escaping (Binding<Value>) -> ContentView) {
        self.binding = binding
        self.content = content
        self.value = binding.wrappedValue
    }

    func body(content: Content) -> ContentView {
        return self.content(shadowBinding)
    }
}

// MARK: Animatable Binding

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct AnimatableBindingModifier<Value: Animatable, ContentView: View>: AnimatableModifier {
    private var binding: Binding<Value>
    private var shadowBinding: Binding<Value> {
        .init(get: {
            self.value
        }) { (newValue) in
            self.binding.wrappedValue = newValue
        }
    }

    private let content: (Binding<Value>) -> ContentView
    private var value: Value

    var animatableData: Value.AnimatableData {
        get { value.animatableData }
        set { value.animatableData = newValue }
    }

    init(binding: Binding<Value>, content: @escaping (Binding<Value>) -> ContentView) {
        self.binding = binding
        self.content = content
        self.value = binding.wrappedValue
    }

    func body(content: Content) -> ContentView {
        return self.content(shadowBinding)
    }
}

// MARK: Transformable Binding

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct TransformableBindingModifier<Value, A: VectorArithmetic, ContentView: View>: AnimatableModifier {
    private var binding: Binding<Value>
    private var shadowBinding: Binding<Value> {
        .init(get: {
            self.value
        }) { (newValue) in
            self.binding.wrappedValue = newValue
        }
    }

    private let content: (Binding<Value>) -> ContentView
    private var value: Value

    private let aToV: (A, Value) -> Value
    private let vToA: (Value) -> A

    var animatableData: A {
        get { vToA(value) }
        set { value = aToV(newValue, value) }
    }

    init(binding: Binding<Value>, content: @escaping (Binding<Value>) -> ContentView, aToV: @escaping (A, Value) -> Value, vToA: @escaping (Value) -> A) {
        self.binding = binding
        self.content = content
        self.value = binding.wrappedValue
        self.aToV = aToV
        self.vToA = vToA
    }

    func body(content: Content) -> ContentView {
        return self.content(shadowBinding)
    }
}

struct TransformableAnimatableBindingModifier<Value, A: Animatable, ContentView: View>: AnimatableModifier {
    private var binding: Binding<Value>
    private var shadowBinding: Binding<Value> {
        .init(get: {
            self.value
        }) { (newValue) in
            self.binding.wrappedValue = newValue
        }
    }

    private let content: (Binding<Value>) -> ContentView
    private var value: Value

    private let aToV: (A, Value) -> Value
    private let vToA: (Value) -> A

    var animatableData: A {
        get { vToA(value) }
        set { value = aToV(newValue, value) }
    }

    init(binding: Binding<Value>, content: @escaping (Binding<Value>) -> ContentView, aToV: @escaping (A, Value) -> Value, vToA: @escaping (Value) -> A) {
        self.binding = binding
        self.content = content
        self.value = binding.wrappedValue
        self.aToV = aToV
        self.vToA = vToA
    }

    func body(content: Content) -> ContentView {
        return self.content(shadowBinding)
    }
}
