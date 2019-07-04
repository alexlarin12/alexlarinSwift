//
//  main.swift
//  L1_LarinAlex
//
//  Created by пользователь on 18/06/2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation



// Расчет суммы вклада

var money: Float = 100000
var year = 5
var interest: Float = 5
var n = year
print("Сумма вклада \(money) рублей")
print("Процент вклада \(interest)%")
print("Время вклада \(year) лет")
while year > 0 {
    year-=1
    money = money + money * interest/100
}
print("Ваш вклад через \(n) лет составит \(money) рублей")


// Расчет площади, периметра, гипотенузы прямоугольного треугольника
var side1:Float = 10
var side2:Float = 20
var square = (side1*side2)/2
var hypotenuse = (sqrt(pow(side1,2)+pow(side2, 2)))
var perimeter = side1+side2+hypotenuse
print("Исходные данные: Прямоугольный треугольник")
print("Катеты \(side1) мм и \(side2) мм")
print("Площадь треугольника составляет \(square) мм.кв")
print("Периметр треугольника составляет \(perimeter) мм")
print("Гипотенуза треугольника составляет \(hypotenuse) мм")

// Решение полных квадратных уравнений (где a,b,c не равны 0)
var a = 2
var b = 5
var c = -7
var d = pow(Float(b), 2) - 4*Float(a)*Float(c)
var x1:Float
var x2:Float
if d>0{
  x1 = (-Float(b) - sqrt(d))/(2*Float(a))
  x2 = (-Float(b) + sqrt(d))/(2*Float(a))
    print("Уравнение \(a)x^2+\(b)x+\(c)=0 имеет 2 корня: \(x1) , \(x2)")
}
else if d<0 {
    print("Уравнение \(a)x^2+\(b)x+\(c)=0 не имеет корней")
}
else{
    x1 = -Float(b)/(2*Float(a))
    print("Уравнение \(a)x^2+\(b)x+\(c)=0 имеет 1 корень: \(x1)")}
