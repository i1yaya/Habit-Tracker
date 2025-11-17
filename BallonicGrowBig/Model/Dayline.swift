import SwiftUI

struct DaylineEntry: Identifiable {
    var id: Int
    
    var time: Int
    var location: Int
    var type0: Int
    var type1: Int
    
    var hands: String
    var intention: String
    
    var isDone: Bool
}

struct Dayline: Identifiable, Codable {
    var id: Int
    
    var time: Int
    var location: Int
    var type0: Int
    var type1: Int
    var title: String
    var habit: String
    var text: String
    
    var isDone: Bool
}
