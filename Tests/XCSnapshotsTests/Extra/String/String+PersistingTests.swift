import XCSnapshots
import XCTest

final class String_PersistingTests: XCTestCase {

  var sut: Persisting<String>!

  override func setUp() {
    sut = .stringify
  }

  override func tearDown() {
    sut = nil
  }

  // MARK: -

  func test_extension() {
    XCTAssertEqual(sut.ext, "txt")
  }

  // MARK: -

  func test_encode() {
    let input = "hello"
    let result = sut.encode(input)
    XCTAssertEqual(result, input.data(using: .utf8))
  }

  func test_decode() {
    let input = "hello".data(using: .utf8)!
    let result = sut.decode(input)
    XCTAssertEqual(result, "hello")
  }

}
