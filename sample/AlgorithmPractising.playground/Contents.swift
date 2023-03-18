
import UIKit
//
//
//let array = [    ["name": "Apples, raw, with skin", "code": "0693", "category": "Fruits, raw", "searchString": "0693 apples raw with skin fruits raw"],
//    ["name": "Apples, raw, w/o skin", "code": "0311", "category": "Fruits, raw", "searchString": "0311 apples raw wo skin fruits raw"],
//    ["name": "Applesauce, canned, sweetened, w/o salt", "code": "0176", "category": "Fruits, canned or frozen", "searchString": "0176 applesauce canned sweetened wo salt fruits canned or frozen"],
//    ["name": "Apricots, canned, heavy syrup pack, w/o skin, solids & liquids", "code": "1568", "category": "Fruits, canned or frozen", "searchString": "1568 apricots canned heavy syrup pack wo skin solids liquids fruits canned or frozen"],
//    ["name": "Apricots, canned, juice pack, with skin, solids & liquids", "code": "0117", "category": "Fruits, canned or frozen", "searchString": "0117 apricots canned juice pack with skin solids liquids fruits canned or frozen"],
//
//
//
//
//]
//
//let data = [
//    FoodCodeDataModel( name: "Water, bottled", code: "1479", category: "Raw", searchString: "1479 water bottled beverages other", favorite: nil),FoodCodeDataModel( name: "Water, bottled", code: "1479", category: "Raw", searchString: "1479 water bottled beverages other", favorite: nil),
//
//    FoodCodeDataModel( name: "Water, bottled", code: "1479", category: "Beverages, other", searchString: "1479 water bottled beverages other", favorite: nil),FoodCodeDataModel( name: "Water, tap", code: "0909", category: "Beverages, other", searchString: "0909 water tap beverages other", favorite: nil),FoodCodeDataModel( name: "Wine, non-alcoholic", code: "1653", category: "Beverages, other", searchString: "1653 wine nonalcoholic beverages other", favorite: nil), FoodCodeDataModel(name: "Barbecue Sauce", code: "1342", category: "Condiments", searchString: "1342 barbecue sauce condiments", favorite: nil), FoodCodeDataModel( name: "Catsup", code: "0157", category: "Condiments", searchString: "0157 catsup condiments", favorite: nil)
//]




//Frequency Counter - sameFrequency
//Write a function called sameFrequency. Given two positive integers, find out if the two numbers have the same frequency of digits.
//
//Your solution MUST have the following complexities:
//
//Time: O(N)
//
//Sample Input:



func sameFrequency(number1: Int, number2: Int) -> Bool{
    
    var str1 = "\(number1)"
    var str2 = "\(number2)"
    var object1: [Character: Int] = [:]
    var object2: [Character: Int] = [:]
    
    for element in str1 {
        if object1[element] != nil {
            object1[element] =  object1[element]!  + 1
        }else{
            object1[element] = 1
        }
    }
    
    for element in str2{
        if object2[element] != nil {
            object2[element] =  object2[element]!  + 1
        }else{
            object2[element] = 1
        }
    }
    
    for (key,value) in object1 {
        if (object2[key] == nil) {
            return false
        }
        
        if (object2[key] != object1[key]){
            return false
        }
        
        
    }
    
    print(object1, object2)
    return true
    
}

//print(sameFrequency(number1: 182,number2: 281)) // true
//print(sameFrequency(number1: 34,number2: 14)) // false
//print(sameFrequency(number1: 3589578, number2: 5879385) )// true
//print(sameFrequency(number1: 22,number2: 222)) // false


func areThereDuplicates(array1: [String]) -> Bool{
 
    var array = array1.sorted(by: <)
    print(array)
    var i = 0
    var j = 1
    
    while (j < array.count) {
        
        if (array[i] == array[j]){
            return true
        }
        
        i = i + 1
        j = j + 1
    }
    return false
}

//print(areThereDuplicates(array: [1, 2, 3]) )// false
//print(areThereDuplicates(array: [1, 2, 2])) // true
//print(areThereDuplicates( array1: ["a", "b", "c", "a"]) )// true

func isSubsequence(str1: String, str2: String){
    
    var first = 0
    var second = 0
    
//    for i = 0; i< str1.count; i = i + 1 {
//        
//    }
    
}

isSubsequence(str1: "hello", str2: "hello world"); // true
isSubsequence(str1: "sing", str2: "sting"); // true
//isSubsequence('abc', 'abracadabra'); // true
//isSubsequence('abc', 'acb'); // false (order matters)

