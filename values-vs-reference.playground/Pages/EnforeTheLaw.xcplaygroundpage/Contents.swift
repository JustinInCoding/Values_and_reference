//: [Previous](@previous)

import Foundation

func compute(_ a: inout Int, _ b: inout Int) {
	b = 100
	a = 10
}

var x = 0
var y = 0

compute(&x, &y)
dump((x, y))

// error: EnforeTheLaw.xcplaygroundpage:16:13: error: inout arguments are not allowed to alias each other
//compute(&x, &x)

extension MutableCollection {
	mutating func mutateEach(_ body: (inout Element) -> Void) {
		for index in indices {
			body(&self[index])
		}
	}
}

var array = [1, 2, 3]

array.mutateEach { element in
	element *= 2
}

// but previous to Swift 4, there was nothing that could stop us from modifying the array itself while in the closure You could do something like this

// Swift 3 had to make copies of the array to guarantee that the closure would not attempt to access uninitialized memory.

// Much of the time , copies could be optimized out (编译器已经把这些变量或代码段优化掉了), but not in all cases

// So swift 4, 5 and up this is an error

//array.mutateEach { element in
//	element *= 2
//	array.append(2)
//}

// so move append out of the loop

array.append(contentsOf: Array(repeating: 42, count: array.count))

// The law of exclusivity means easier to reason about the code that doesn't make extra copies in order to guarantee safety

// It can guarantee safety at compile time, and many cases runtime, where it's too costly or impossible to prove, such as in a multi-thread environment

// The overall result is easier to reason about faster code

//: [Next](@next)
