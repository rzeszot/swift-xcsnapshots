import XCSnapshots
import XCTest

final class StringTransformingTests: XCTestCase {

  var sut: Transforming<String, String>!

  override func setUp() {
    sut = .identity
  }

  override func tearDown() {
    sut = nil
  }

  // MARK: -

  func test_identity() {
    let input = "hello"
    let output = sut.transform(input)
    XCTAssertEqual(output, input)
  }

}
