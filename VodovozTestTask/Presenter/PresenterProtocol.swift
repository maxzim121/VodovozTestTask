import Foundation
protocol PresenterProtocol: AnyObject {
    func viewDidLoad()
    func getButtonsNames() -> [String]
}
