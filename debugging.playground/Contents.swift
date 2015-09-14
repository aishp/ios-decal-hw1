//: # Homework 1 - Debugging and Swift Intro

//: To see markup format, go to Editor -> Show Rendered Markup


import UIKit


//: ## Q1: Optionals
//: The compiler is yelling at us. Why isn't this the correct way to unwrap optionals?

class Foo {
    
    var wordA : String!
    var wordB : String!
    
    init (words: [String?])
    {
        wordA = words[0]!
        wordB = words[1]!
    }
//: [EXPLAIN YOUR ANSWER TO Q1 HERE]
//In this case, wordA and wordB are implicitly unwrapped optionals, since there is an exclamation mark in their declaration statement. Hence, during initialization, it is compulsory for them to contain some value, and hence cannot be a normal optional value, marked by a question mark. If it is marked by a question mark, then there is no certainty that wordA and wordB will contain some value, as it could also contain nil. Hence since it has already been declared as an implicitly unwrapped optional, it has to remain that way even during initialization and cannot be changed to a normal optional variable.

//: ## Q2: Variable Types and Function Types
//: Why does the compiler dislike the for loop? Also, what should we return?
    
    
    static func arePalindromes(words: [String]) -> Bool! {
        let reversedWords = words.map() { String($0.characters.reverse()) }
        let numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        
        return true
    }

//: [EXPLAIN YOUR ANSWER TO Q2 HERE]
    // i has been decalred as a constant using "let", and hence the value cannot be changed in the for loop. To fix this, we need to change i to "var". Also, numElements is not changed throughout this code so it could optionally be changed to a constant using "let". Additionally, it should return true instead of nil.
        
//: ## Q3: More functions, and object initialization
//: The method should be returning true or false -- what's wrong?
//: Are we initializing the dictionary correctly?
    static func isAnagram(wordA: String, wordB: String) -> Bool? {
        var countLetters = [Character : Int]()
        let lenA = wordA.characters.count
        let lenB = wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        var arrA = Array(wordA.characters)
        var arrB = Array(wordB.characters)
        
        for i in 0...lenA - 1 {
            let letter = arrA[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB - 1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (_, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
}


//: [EXPLAIN YOUR ANSWER TO Q3 HERE]
//The dictionary needs to be initialized before usage. Return type needs to be true instead of nil, since a bool returns true or false (not nil or false). Also the function needs to be declared as static, since it is a type method (a method that is being called on the type itself and not on an instance). Since letter is not being used in the for loop, it can be replaced with _.

//: **Do not** change anything below.
//: You should be able to call the methods as is.

Foo.isAnagram("anagram", wordB: "managra")
Foo.isAnagram("hello", wordB: "what")

var palindromes = ["hih", "racecar", "mom", "wow"]
var notPalindromes = ["gene", "shawn", "hello"]
Foo.arePalindromes(palindromes)
Foo.arePalindromes(notPalindromes)

