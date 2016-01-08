//
//  main.swift
//  osxcmd
//
//  Created by 凌佳 on 15/5/21.
//  Copyright (c) 2015年 凌佳. All rights reserved.
//

import SwiftStudy
import Alamofire

let swift = Study()

swift
    .chapter(newTitle: "基础")
    .paragraph("基础", {
        func averge(numbers: Int...) -> Float {
            var sum = 0
            var length = 0
            for number in numbers {
                sum += number
                length += 1
            }
            return Float(sum)/Float(length)
        }
        let interestingNumbers = [
            "Prime": [2, 3, 5, 7, 11, 13],
            "Fibonacci": [1, 1, 2, 3, 5, 8],
            "Square": [1, 4, 9, 16, 25],
        ]
        var largest = 0
        for (kind, numbers) in interestingNumbers {
            for number in numbers {
                if number > largest {
                    largest = number
                }
            }
        }
        //largest
        print(largest)
        print(averge(1,2,3,4)) })
    .paragraph("... 与 .. ", {
        // 区间 [1, 5]
        for index in 1...5 {
            print("\(index) * 5 = \(index * 5)")
        }
        // 半区间 [0, 4)
        let names = ["Anna", "Alex", "Brian", "Jack"]
        let count = names.count
        for i in 0..<count {
            print("第\(i + 1) 个人叫 \(names[i])")
        }

    })
    .paragraph("中文变量", {
        var 中文变量 = "这是个中文变量"
        print(中文变量)
    })
    .chapter(newTitle: "数据结构")
    .paragraph("数组", {
        var shoppingList:[String] = ["Eggs", "Milk"]
        var threeDoubles = Array(count:3, repeatedValue: 2.5)
        var three = [Float](count: 4, repeatedValue: 2.5)
        var six = threeDoubles + [2.4, 2.4, 2.4]

        six.append(3.3)
        print(six[1...4])

        six.insert(3.3, atIndex: 0)
        print(six)
        let kk = six.removeAtIndex(0)
        print(kk)
        print(six)
    })
    .paragraph("set", {
        var favoriteGenres: Set<String> = ["Rock", "Classical", "hip pop"]
        var dim: Set<Set<String>> = [
            ["Rock"], ["bk"]
        ]
        favoriteGenres.insert("Jazz")
        let removedGenre = favoriteGenres.remove("Rock")
        print(favoriteGenres.contains("Rock"))
        let array = favoriteGenres.sort()

        let oddDigits:Set = [1, 3, 5, 7, 9]
        let evenDigits:Set = [0, 2, 4, 6, 8]
        let singleDigitPrimeNumbers:Set = [2, 3, 5, 7]
        // 合集
        print(oddDigits.union(evenDigits).sort())
        // 交集
        print(oddDigits.intersect(evenDigits).sort())

        print(oddDigits.subtract(singleDigitPrimeNumbers).sort())

        print(oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort())

        let houseAnimals: Set = ["🐶", "🐱"]
        let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
        let cityAnimals: Set = ["🐦", "🐭"]

        print(houseAnimals.isSubsetOf(farmAnimals))
        print(farmAnimals.isSupersetOf(houseAnimals))
        print(farmAnimals.isDisjointWith(cityAnimals))
    })
    .paragraph("dict", {
        var airports: [String:String] = ["TYO": "Tokyo", "DUB": "Dublin"]
        var namesOfIntegers = [Int: String]()
        namesOfIntegers[16] = "sixteen"
        // 删除一个
        airports["TYO"] = nil
        print(airports)
    })
    .paragraph("tuples", {
        let somePoint = (1, 1)
        switch somePoint {
        case (0, 0):
            print("0 0")
        case (_, 0):
            print("x 0")
        case (0, _):
            print("0 x")
        case (-2...2, -2...2):
            print("2, 2")
        default:
            print("kk")
        }

    })
    .chapter(newTitle: "协议")
    .paragraph("协议", {
        let simonTheHamster = Hamster(name: "Simon")
        let somethingTextRepresentalbe: TextRepresentable = simonTheHamster
        print(somethingTextRepresentalbe.textualDescription)
        let birthdayPerson = Person(name: "Malcolm", age: 21)
        wishHappyBirthday(birthdayPerson)
        let objects: [AnyObject] = [
            Circle(radius: 2.0),
            Country(area: 243_610),
            Animal(legs: 4)
        ]
        for object in objects {
            if let objectWithArea = object as? HasArea {
                print("Area is \(objectWithArea.area)")
            } else {
                print("not have area")
            }
        }

        var counter = Counter()
        counter.dataSource = ThreeSource()
        for _ in 1...4 {
            counter.increment()
            print(counter.count)
        }
        counter.count = -4
        counter.dataSource = TowardsZeroSource()
        for _ in 1...5 {
            counter.increment()
            print(counter.count)
        }

        let murrayTheHamster = Hamster(name: "MUrray")
        let morganTheHamster = Hamster(name: "Morgan")
        let mauriceTheHamster = Hamster(name: "Maurice")
        let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]
        print(hamsters.textualDescription) })
    .chapter(newTitle: "泛型")
    .paragraph("泛型", {
        var someInt = 3
        var anotherInt = 107
        swapTwoValues(&someInt, &anotherInt)
        var someString = "hello"
        var anotherString = "world"
        swapTwoValues(&someString, &anotherString) })
    .chapter(newTitle: "访问权限")
    .paragraph("访问权限", {
        var stringToEdit = TrackedString()
        stringToEdit.value = "This string will be tracked."
        stringToEdit.value += " This edit will increment numberOfEdits."
        stringToEdit.value += " So will this one."
        print("The number of edits is \(stringToEdit.numberOfEdits)")
        // try acess numberOfEdits will compile fail
        //stringToEdit.numberOfEdits = 4
    })
    .chapter(newTitle: "Operator")
    .paragraph("Operator", {
        let initalBits: UInt8 = 0b00001111
        let invertedBits = ~initalBits
        print(String(invertedBits, radix:2))
        let firstSixBits: UInt8 = 0b11111100
        let lastSixBits: UInt8 = 0b00111111
        let middleFourBits = firstSixBits & lastSixBits
        print(String(middleFourBits, radix:2))
        let someBits: UInt8 = 0b10110010
        let moreBits: UInt8 = 0b01011110
        let combineBits = someBits | moreBits
        print(String(combineBits, radix:2))
        let firstBits: UInt8 = 0b00010100
        let otherBits: UInt8 = 0b00000101
        let outputBits = firstBits ^ otherBits
        var unsinedOverflow = UInt8.max
        // overflow
        unsinedOverflow = unsinedOverflow &+ 1
        print(unsinedOverflow) })
    .chapter(newTitle: "with C")
    .paragraph("with C", {
        // 暂时并不能编译C
        // testC();
        //    var output: CInt = 0
        //    getInput(&output)
        //    print(output)
    })
    .run("Operator")
