import XCSnapshots
import XCTest

final class DataDiffingTests: XCTestCase {

  var sut: Diffing<Data>!

  override func setUp() {
    sut = .first
  }

  override func tearDown() {
    sut = nil
  }

  // MARK: -

  func test_success() {
    let a = Data([1, 2, 3, 4, 5])
    let b = Data([1, 2, 3, 4, 5])

    let result = sut.compare(a, b)

    XCTAssertNil(result)
  }

  func test_failure_different() {
    let a = Data([1, 2, 3, 4, 5])
    let b = Data([1, 2, 9, 4, 5])

    let result = sut.compare(a, b)

    XCTAssertEqual(result?.0, "Byte at index 2 does not match")
  }

  func test_failure_size() {
    let a = Data([1, 2, 3, 4, 5])
    let b = Data([1, 2, 3, 4, 5, 6])

    let result = sut.compare(a, b)

    XCTAssertEqual(result?.0, "Size does not match")
  }

}
