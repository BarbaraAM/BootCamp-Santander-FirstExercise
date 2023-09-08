
import UIKit

let name = "Steve"
var lastName: String? = "Jobs"

//desembrulhando

if let unwrappedName = lastName {
    print("Nome: \(name) \(unwrappedName)")
} else {
    lastName = "Wozniak"
    print("Nome desembrulhado: \(name) \(lastName!)")
}
