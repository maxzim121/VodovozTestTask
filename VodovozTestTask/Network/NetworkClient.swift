import UIKit

typealias ResponceCompletion = (Result<Response, Error>) -> Void

final class NetworkClient {
    private let urlSession = URLSession.shared
    private var task: URLSessionTask?
    static let shared = NetworkClient()
    
    func fetchData(completion: @escaping ResponceCompletion) {
        assert(Thread.isMainThread)
        let request = dataRequest()
        task = urlSession.object(urlSession: urlSession, for: request) { [weak self] (result: Result<Response, Error>) in
            DispatchQueue.main.async {
                guard self != nil else {return}
                switch result {
                case .success(let todos):
                    completion(.success(todos))
                case .failure(let error):
                    completion(.failure(error))
                    assertionFailure("\(error)")
                }
            }
        }
    }
    
    func dataRequest() -> URLRequest {
        URLRequest.makeHTTPRequest(
            httpMethod: "get"
        )
    }
}
