//
//  main.swift
//  L3_LarinAlex
//
//  Created by пользователь on 25/06/2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation

enum EngineState{
    case start
    case stop
}
enum WindowsState{
    case open
    case close
}

enum LibraryBrand {
    case Audi
    case Man
}

enum LoadUnload{
    
    
    case load
    case unload
}

struct Audi {
    let brand:LibraryBrand
    let year:Int
    let carrying:Double
    var loadUnload:LoadUnload
    var engineState: EngineState
    var windowsState: WindowsState
    var cargoWeight: Double
    {
        didSet{
            if loadUnload == LoadUnload.load{
            let fillPlace = oldValue + cargoWeight
                 if fillPlace<carrying{
                 print("Всего загружено в авто \(fillPlace)")
                    cargoWeight = fillPlace
                 }else if fillPlace == Double(0){
                 print("загружена до максимума")
                    cargoWeight = fillPlace            }
                 else{
                 print("Перегруз. Отмена")
            }
            }else{
                let fillPlace = oldValue - cargoWeight
                if fillPlace>0{
                    print("остаток груза в авто \(fillPlace)")
                    cargoWeight = fillPlace
                }else if fillPlace == Double(0){
                    print("выгружен весь груз")
                     cargoWeight = fillPlace                }
                else{
                    print("ошибка. Вы хотите разгрузить больше чем имеется. Отмена")
                }
            }
        }
    
    }

    mutating func startEngine(){
        self.engineState = .start
    }
    mutating func stopEngine(){
        self.engineState = .stop
    }
}
struct Truck {
    let brand:LibraryBrand
    let year:Int
    let carrying:Double
    var loadUnload:LoadUnload
    var engineState: EngineState
    var windowsState: WindowsState
    var cargoWeight: Double
    mutating func startEngine(){
        self.engineState = .start
    }
    mutating func stopEngine(){
        self.engineState = .stop
    }
    
}

var car1 = Audi(brand: .Audi, year: 2012, carrying: 200, loadUnload: .load, engineState: .start, windowsState: .close, cargoWeight: 100)
var car2 = Truck(brand:.Man, year: 2011, carrying: 1000, loadUnload: .unload, engineState: .stop, windowsState: .close, cargoWeight: 500)
print(car1.brand)
print(car1.year)
//грузоподьемность:
print(car1.carrying)
// загрузка - выгрузка
print(car1.loadUnload)
// груз в машине:
print(car1.cargoWeight)
// загружаем еще 20:
car1.cargoWeight = 20
// загружаем еще 5
car1.cargoWeight = 5
// меняем режим на выгрузку:
car1.loadUnload = .unload
// выгружаем 25
car1.cargoWeight = 25
// выгружаем все оставшееся:
car1.cargoWeight = 100
// смотрим бренд грузовика:
print(car2.brand)
// двигатель запущен:
car2.engineState = .start
// окна открыты
// Поехали





