import Foundation

final class ListViewModel {
    
    var user: Observable<User?> = Observable(nil)
    
    func getUser() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.user.value = User(firstName: "John", lastName: "Doe", age: 27)
        }
    }
}

