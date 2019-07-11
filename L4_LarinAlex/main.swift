//
//  main.swift
//  L4_LarinAlex
//
//  Created by пользователь on 02/07/2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation
// перечисления
enum EngineState {
    case start
    case stop
}
enum WindowsState {
    case open
    case close
}
enum TurbineState {
    case start
    case stop
}
enum LoadUnload {
    case load
    case unload
}
enum SeatBeltState {
    case wear
    case unwear
}
// класс Car
class Car{
    let year:Int
    let fuelCapacity:Double
    let alarm:Bool
    var engineState: EngineState
    var windowsState: WindowsState
    var seatBeltState: SeatBeltState
    init(year:Int, fuelCapacity: Double, alarm:Bool, engineState:EngineState, windowsState:WindowsState, seatBeltState:SeatBeltState) {
        self.year = year
        self.fuelCapacity = fuelCapacity
        self.alarm = alarm
        self.engineState = engineState
        self.windowsState = windowsState
        self.seatBeltState = seatBeltState
    }
    // метод включения-выключения двигателя
    func startEngine(){
        self.engineState = .start
        print("ремни пристегнуты")
    }
    func stopEngine(){
        self.engineState = .stop
        print("ремни не пристегнуты")
    }
    // метод включения-выключения датчика ремней безопасности:
    func wearSeatBelt(){
        self.seatBeltState = .wear
    }
    func unwearSeatBelt(){
        self.seatBeltState = .unwear
    }
}
// SportCar - наследник Car
class SportCar: Car {
    var maxSpeed: Double
    var turbineState: TurbineState
    init(year: Int, fuelCapacity: Double, alarm: Bool, engineState: EngineState,windowsState: WindowsState,seatBeltState: SeatBeltState, maxSpeed:Double, turbineState:TurbineState) {
        self.maxSpeed = maxSpeed
        self.turbineState = turbineState
        super.init(year: year, fuelCapacity: fuelCapacity, alarm: alarm, engineState: engineState, windowsState: windowsState, seatBeltState: seatBeltState)
        }
    override func startEngine() {
        if seatBeltState == .unwear{
        print("Перед запуском двигателя - пристегни ремни безопасности")
        }else{
            super.startEngine()
            print("Двигатель запущен")
        }
    }
    override func stopEngine() {
        super.stopEngine()
        print("Теперь можно отстегнуть ремни безопасности")
    }
}
// TrunkCar - наследник Car
class TrunkCar: Car {
    var loadUnload:LoadUnload
    let carrying:Double
    var cargoWeight: Double
    {
        didSet{
            if loadUnload == LoadUnload.load{
                let fillPlace = oldValue + cargoWeight
                if fillPlace<carrying{
                    print("Всего загружено в авто \(fillPlace)")
                    cargoWeight = fillPlace
                }else if fillPlace == carrying{
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
    init(year: Int, fuelCapacity: Double, alarm: Bool, engineState: EngineState, windowsState: WindowsState,seatBeltState: SeatBeltState ,loadUnload:LoadUnload, carrying:Double, cargoWeight:Double) {
        self.loadUnload = loadUnload
        self.carrying = carrying
        self.cargoWeight = cargoWeight
        super.init(year: year, fuelCapacity: fuelCapacity, alarm: alarm, engineState: engineState, windowsState: windowsState, seatBeltState: seatBeltState)
    }
    
}
// создаем объект sportCar1:
var sportCar1 = SportCar(year: 2019, fuelCapacity: 60, alarm: true, engineState: .stop, windowsState: .close, seatBeltState: .unwear, maxSpeed: 250, turbineState: .stop)
// проверяем состояние двигателя
print(sportCar1.engineState)
// включаем двигатель:
sportCar1.startEngine()
// проверяем состояние - двигатель не включился:
print(sportCar1.engineState)
// пристегиваем ремни безопасности:
sportCar1.wearSeatBelt()
// запускаем двигатель:
sportCar1.startEngine()
// проверяем состояние - двигатель запущен:
print(sportCar1.engineState)

// создаем объект trunkCar1:
var trunkCar1 = TrunkCar(year: 2019, fuelCapacity: 120, alarm: false, engineState: .stop, windowsState: .close, seatBeltState: .unwear, loadUnload: .load, carrying: 2000, cargoWeight: 0)
// загружаем 200 кг в кузов
trunkCar1.cargoWeight = 200
// загружаем еще 1800 кг и получаем сообщение что машина загружена до максимума
trunkCar1.cargoWeight = 1800
// переходим в режим разгрузки авто:
trunkCar1.loadUnload = .unload
print(trunkCar1.loadUnload)
// выгружаем 500 кг:
trunkCar1.cargoWeight = 500
// видим остаток на консоле
// выгружаем 1500 кг:
trunkCar1.cargoWeight = 1500

