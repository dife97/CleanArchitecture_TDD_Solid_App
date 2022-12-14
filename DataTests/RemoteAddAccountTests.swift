import XCTest

/// esta é a implementação da
class RemoteAddAccount {
    
    private let url: URL
    private let httpClient: HttpPostClient
    
    init(url: URL, httpClient: HttpPostClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func add() {
        httpClient.post(url: url)
    }
}

protocol HttpPostClient {
    
    func post(url: URL)
}

final class RemoteAddAccountTests: XCTestCase {

    func test_add_should_call_httpClient_with_correct_url() {
        
        guard let url = URL(string: "any_url.com") else { return }
        
        let httpClientSpy = HttpClientSpy()
        
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        
        sut.add()
        
        XCTAssertEqual(httpClientSpy.url, url)
    }
    
    /// esta é uma implementação fake do meu httpClient que conforma com protocolo de client que garantirá um método POST
    class HttpClientSpy: HttpPostClient {
        
        var url: URL?
        
        func post(url: URL) {
            
            self.url = url
        }
    }
}
