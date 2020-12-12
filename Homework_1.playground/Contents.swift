import Foundation

//Задание №1

typealias VoidClosure = () -> Void // ничего не возваращает и не принимает
typealias VoidtToAnyClosure  = () -> Any // ничего не принимает, возвращает Any
typealias InputToVoidClosure  = (Any) -> Void // принимает Any, ничего не возвращает





//Задание №2

// Первый вариант
func unwrap1(input: Any?) {
    if let any = input {
        print(any)
    } else {
        print("Unable to unwrap nil")
    }
}

// Второй вариант с разваорачиванием Any через Mirror, подсмотрел на StackOverflow

func unwrap2<T>(_ any: T) -> Any
{
    let mirror = Mirror(reflecting: any)
    guard mirror.displayStyle == .optional, let first = mirror.children.first else {
        print(any)
        return any
    }
    print(first.value)
    return first.value
}

let value: [Int]? = [0] // Optional со значением
let value2: [Int]? = nil // Optional с nil

let anyValue: Any = value as Any // Константа типа Any со значением
let anyValue2: Any = value2 as Any // Константа типа Any с nil

unwrap1(input: anyValue) // разворачиваем Optional([0]) первой функцией
unwrap1(input: anyValue2) // разворачиваем Optional(nil) первой функцией
unwrap2(anyValue) // разворачиваем Optional([0]) второй  функцией
unwrap2(anyValue2) // разворачиваем Optional(nil) второй функцией




//Задание №3

// Программа выводит дату для различных локалей

// Предварительно создаем Dateformatter и дату
let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .medium
dateFormatter.timeStyle = .none
let date = Date()

    // Создаем протокол
    protocol DateFormatterStrategy {
        
        func printDate()
    }

    // Создаем типовую структуру
    struct DateFormat {

        let strategy: DateFormatterStrategy

        func printDate() {

            strategy.printDate()
        }
    }

    // Структуры для различных стратений
    struct USStrategy: DateFormatterStrategy {
        
        func printDate() {
            dateFormatter.locale = Locale(identifier: "en_US")
            print(dateFormatter.string(from: date as Date))
        }
    }

    struct RUStrategy: DateFormatterStrategy {
       
        func printDate() {
            dateFormatter.locale = Locale(identifier: "ru_RU")
            print(dateFormatter.string(from: date as Date))
        }
        
    }

    struct ENStrategy: DateFormatterStrategy {
        func printDate() {
        dateFormatter.locale = Locale(identifier: "en_GB")
        print(dateFormatter.string(from: date as Date))
        }
    }

// Проверка вывода


var dateFormat = DateFormat(strategy: USStrategy())
dateFormat.printDate()

dateFormat = DateFormat(strategy: RUStrategy())
dateFormat.printDate()

dateFormat = DateFormat(strategy: ENStrategy())
dateFormat.printDate()





