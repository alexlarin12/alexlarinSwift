//
//  main.swift
//  L5_AlexLarin
//
//  Created by пользователь on 10/07/2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation

enum EngineState:CustomStringConvertible {
    case start, stop
    var description: String{
        switch self {
        case.start:
            return "Двигатель включен"
        case.stop:
            return "Двигатель выключен"
        }
    }
}
enum WindowsState:CustomStringConvertible {
    case open, close
    var description: String{
        switch self {
        case.open:
            return "Окна открыты"
        case.close:
            return "Окна закрыты"
        }
    }
}
enum SeatBeltState:CustomStringConvertible {
    case wear, unwear
    var description: String{
        switch self {
        case.wear:
            return "Ремни пристегнуты"
        case.unwear:
            return "Ремни не пристегнуты"
        }
    }
}
enum TurbineState:CustomStringConvertible {
    case on, off
    var description: String{
        switch self {
        case .on:
            return "Турбина включена"
        case .off:
            return "Турбина выключена"
        }
    }
}
enum TunkState:CustomStringConvertible{
    case load, unload, wait
    var description: String{
        switch self {
        case .load:
            return "Загрузка цистерны"
        case .unload:
            return "Разгрузка цистерны"
        case .wait:
            return "Режим ожидания"
        }
    }
}
enum Action {
    case switchEgine(EngineState)
    case switchSeatBelt(SeatBeltState)
    case switchWindows(WindowsState)
}
// создаем протокол Car, описание общих свойств и метод действий
protocol Car:AnyObject{
    var brand:String{get}
    var year:Int{get}
    var engine:EngineState{get set}
    var windows:WindowsState{get set}
    var seatBelt:SeatBeltState{get set}
    func Perform(action:Action)
}
// создаем расширение для протокола Car, реализовываем метод действий с автомобилем
extension Car{
    func EngineState(status:EngineState){
        if seatBelt == .wear{
            print("Двигатель заведен")
            return engine = .start
        }else{
            print("Двигатель не заводится.Пристегните ремни.")
            return self.engine = .stop
        }
    }
    func SeatBeltState(status:SeatBeltState){
        switch status {
        case .wear:
            print("\(brand) - Ремни пристегнуты")
            return self.seatBelt = .wear
        case .unwear:
            print("\(brand) - Ремни не пристегнуты")
            return self.seatBelt = .unwear
        }
    }
    func WindowsState(status:WindowsState){
        switch status {
        case .open:
            print("\(brand) - Окна открыты")
            return self.windows = .open
            
        case .close:
            print("\(brand) - Окна закрыты")
            return self.windows = .close
        }
    }
}
// создаем класс SportCar
class SportCar:Car{
    var brand: String
    var year: Int
    var engine: EngineState
    var windows: WindowsState
    var seatBelt: SeatBeltState
    var turbine:TurbineState
    func Perform(action: Action) {
        switch action {
        case .switchEgine(let status):
            EngineState(status: status)
        case .switchSeatBelt(let status):
            SeatBeltState(status: status)
        case .switchWindows(let status):
            WindowsState(status: status)
        }
    }
    func TurbineState(status:TurbineState){
        switch status {
        case .on:
            print("Турбина включена")
            return self.turbine = .on
        case .off:
            print("Турбина выключена")
            return self.turbine = .off
        }
    }
    init(brand:String, year:Int, engine:EngineState, windows:WindowsState, seatBelt:SeatBeltState, turbine:TurbineState) {
        self.brand = brand
        self.year = year
        self.engine = engine
        self.windows = windows
        self.seatBelt = seatBelt
        self.turbine = turbine
    }
}
// создаем расширение CustomStringConvertible для вывода в консоль
extension SportCar:CustomStringConvertible{
    var description: String {
        return "\(brand) |\(year) |\(engine) |\(windows) |\(seatBelt) |\(turbine)"
    }
}
// создаем класс TrunkCar
class TrunkCar:Car{
    var brand: String
    var year: Int
    var engine: EngineState
    var windows: WindowsState
    var seatBelt: SeatBeltState
    var tunk:TunkState
    func Perform(action: Action) {
        switch action {
        case .switchEgine(let status):
            EngineState(status: status)
        case .switchSeatBelt(let status):
            SeatBeltState(status: status)
        case .switchWindows(let status):
            WindowsState(status: status)
        }
    }
    func TunkState(status:TunkState){
        switch status {
        case .load:
            print("Загрузка цистерны")
            return self.tunk = .load
        case .unload:
            print("Разгрузка цистерны")
            return self.tunk = .unload
        case.wait:
            print("Режим ожидания")
            return self.tunk = .wait
        }
    }
    init(brand:String, year:Int, engine:EngineState, windows:WindowsState, seatBelt:SeatBeltState, tunk:TunkState) {
        self.brand = brand
        self.year = year
        self.engine = engine
        self.windows = windows
        self.seatBelt = seatBelt
        self.tunk = tunk
    }
}
// создаем расширение CustomStringConvertible для вывода в консоль
extension TrunkCar:CustomStringConvertible{
    var description: String {
        return "\(brand) |\(year) |\(engine) |\(windows) |\(seatBelt) |\(tunk)"
    }
}


//создаем экземпляр спортивного авто
var tesla = SportCar(brand: "Tesla", year: 2019, engine: .stop, windows: .close, seatBelt: .unwear, turbine: .off)
// создаем экземпляр цистерны
var man = TrunkCar(brand: "Man", year: 2019, engine: .stop, windows: .close, seatBelt: .unwear, tunk: .wait)
//выводим в консоль свойства спортивного авто:
print(tesla)
//запускаем двигатель. двигатель не заводится
tesla.EngineState(status: .start)
// пристегиваем ремни безопасности:
tesla.SeatBeltState(status: .wear)
// снова заводим:
tesla.EngineState(status: .start)
// включаем турбину
tesla.TurbineState(status: .on)
//выводим в консоль свойства цистерны:
print(man)
//запускаем двигатель. двигатель не заводится
man.EngineState(status: .start)
// пристегиваем ремни безопасности:
man.SeatBeltState(status: .wear)
// снова заводим. двигатель заведен
man.EngineState(status: .start)
// загружаем цистерну
man.TunkState(status: .load)
