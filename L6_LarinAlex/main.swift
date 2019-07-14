//
//  main.swift
//  L6_LarinAlex
//
//  Created by пользователь on 13/07/2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation

struct Journal{
    var name:String
    var professional:String
}
extension Journal:CustomStringConvertible{
    var description: String {
        return "Name: \(name), Professional: \(professional)"
    }
}

struct queue<T> {
    var elements:[T] = []
    var isEmpty:Bool{
        return elements.count == 0
    }
    mutating func unqueue(_ element: T){
       return elements.append(element)
    }
    mutating func dequeue() -> T? {
        return elements.removeLast()
    }

    var last:T?{
        if isEmpty {
            print("Пустой массив")
            return nil
        }else{
            print("Последний элемент:\(elements.last!)")
            return elements.last
        }
    }
    public var first:T?{
        if isEmpty {
            print("Пустой массив")
            return nil
        }else{
            print("Первый элемент:\(elements.first!)")
            return elements.first
        }
    }
    func printAllQueue() {
        print(elements)
    }
    var count:Int{
        return elements.count
    }
    subscript(index:Int) ->T?{
        get{
            return index<count ? elements[index]:nil
        }
    }
}
extension queue {
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if predicate(i)  {
                result.append(i)
            }
        }
        return result
    }
    
    mutating func my(predicate:(T) -> Bool) -> [T]  {
        
        var a: [T] = []
        
        for i in elements {
            if predicate(i) {
                a.append(contentsOf: elements)
            }
        }
        return a
    }
}

var people = queue<Journal>()
people.unqueue(Journal(name: "Alex", professional: "programmer"))
people.unqueue(Journal(name: "Ivan", professional: "engineer"))
people.unqueue(Journal(name: "Elena", professional: "manager"))
people.unqueue(Journal(name: "Masha", professional: "engineer"))
people.printAllQueue()
people.first
people.last

let smartPeople = people.myFilter(predicate: {$0.professional == "engineer"})
print(smartPeople)
print(smartPeople.count)
print(people[1]!)




