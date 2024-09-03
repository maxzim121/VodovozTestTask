import Foundation
final class Presenter {
    
    weak var view: ViewProtocol?
    
    let networkClient = NetworkClient.shared
    var fetchedData: Response?
    
    func fetchData() {
        networkClient.fetchData() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.fetchedData = response
                self.view?.showData()
            case .failure(let error):
                assertionFailure("\(error)")
            }
        }
    }
}

extension Presenter: PresenterProtocol {
    func viewDidLoad() {
        fetchData()
    }
    
    func getButtonsNames() -> [String] {
        var array: [String] = []
        guard let fetchedData = fetchedData else { return [] }
        fetchedData.tovary.forEach {
            array.append($0.name)
        }
        return array
    }
}
