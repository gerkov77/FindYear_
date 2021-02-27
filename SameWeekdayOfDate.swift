
import Foundation

func nextYearWithSameDayOfMonth(dateString: String) -> (Int, Int) {
  let formatter        = DateFormatter()
  formatter.dateFormat = .init(format: "yyyy-MM-d")
  formatter.calendar   = Calendar.init(identifier: .gregorian)
  formatter.locale = Calendar.current.locale

  guard let date             = formatter.date(from: dateString) else {
   print("Not valid date format")
   main()
    return (-1, -1)
  }
  let components       = formatter.calendar.dateComponents(in: .current, from: date)
  guard let year       = components.year else { return (0, 0)}
  
  if let weekDayOfInput = date.dayOfWeek() { 
    print(weekDayOfInput) 
  } else {
    print("Give a valid date in the required format")
    return (-1, -1)
  }

  var nextYearWithSame     = year + 1
  var previousYearWithSame = year - 1

  var resultComponents     = DateComponents(
      calendar:            formatter.calendar,
      year:                nextYearWithSame,
      month:               components.month,
      day:                 components.day)

  while resultComponents.date!.dayOfWeek() != components.date!.dayOfWeek() {
    nextYearWithSame += 1
    resultComponents.year = nextYearWithSame
    
  }
 
  resultComponents.year = previousYearWithSame

  while resultComponents.date!.dayOfWeek() != components.date!.dayOfWeek() {
    previousYearWithSame -= 1
    resultComponents.year = previousYearWithSame
  }
  let tuple = (nextYearWithSame, previousYearWithSame)
  print("The next year with the same weekday on the same day of month is \n\(tuple.0), \nthe previous one is \n\(tuple.1)")

  return tuple
}

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter         = DateFormatter()
        dateFormatter.dateFormat  = "EEEE"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }
}

func main() { 
  print("Give a date in the format of the example: 2000 12 31,\n(or type quit to exit)")
  let input = readLine()
  if input == "quit" {
    return
    } else { 
      let _     =  nextYearWithSameDayOfMonth(dateString: input!)
  }
}

main()



