import XCTest

/// esta é a implementação da
class RemoteAddAccount {
    
    private let url: URL
    private let httpClient: HttpClient
    
    init(url: URL, httpClient: HttpClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func add() {
        httpClient.post(url: url)
    }
}

protocol HttpClient {
    
    func post(url: URL)
}

final class RemoteAddAccountTests: XCTestCase {

    func test_() {
        
        guard let url = URL(string: "any_url.com") else { return }
        
        let httpClientSpy = HttpClientSpy()
        
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        
        sut.add()
        
        XCTAssertEqual(httpClientSpy.url, url)
    }
    
    /// esta é uma implementação fake do meu httpClient que conforma com protocolo de client que garantirá um método POST
    class HttpClientSpy: HttpClient {
        
        var url: URL?
        
        func post(url: URL) {
            
            self.url = url
        }
    }
}
