import XCTest
import XCSnapshots

final class URLRequestTransformingTests: XCTestCase {

  var sut: Transforming<URLRequest, String>!

  override func setUp() {
    sut = .http2
  }

  override func tearDown() {
    sut = nil
  }

  // MARK: -

  func test_transform_simple() {
    let input = URLRequest.simple
    let output = sut.transform(input)
    XCTAssertEqual(output, Fixture.simple.string)
  }

  func test_transform_example() {
    let input = URLRequest.example
    let output = sut.transform(input)
    XCTAssertEqual(output, Fixture.example.string)
  }

}

private extension URLRequest {
  static var simple: URLRequest {
    URLRequest(url: URL(string: "https://example.org/path")!)
  }

  static var example: URLRequest {
    var request = URLRequest(url: URL(string: "https://user:password@example.org:123/path?query=true#fragment")!)
    request.httpMethod = "POST"
    request.setValue("hello", forHTTPHeaderField: "field")
    request.httpBody = """
      {
        "hello" : "world"
      }
      """.data(using: .utf8)

    return request
  }
}

private extension Fixture {
  static var simple: Fixture = """
    :method: GET
    :scheme: https
    :authority: example.org
    :path: /path
    """

  static var example: Fixture = """
    :method: POST
    :scheme: https
    :authority: example.org
    :path: /path?query=true
    field: hello

    {
      "hello" : "world"
    }
    """
}
