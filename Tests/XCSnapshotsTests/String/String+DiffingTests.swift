import XCSnapshots
import XCTest

final class StringDiffingTests: XCTestCase {

  var sut: Diffing<String>!

  override func setUp() {
    sut = .lines
  }

  override func tearDown() {
    sut = nil
  }

  // MARK: -

  func test_success() {
    let output = sut.compare("hello", "hello")
    XCTAssertNil(output)
  }

  func test_failure_different() {
    let output = sut.compare("hello", "hellx")
    XCTAssertEqual(output?.0, "Line at index 0 does not match")
  }

  func test_failure_size() {
    let output = sut.compare("hello", "hell")
    XCTAssertEqual(output?.0, "Size does not match")
  }

}
