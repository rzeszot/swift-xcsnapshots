import XCSnapshots
import XCTest

final class DataTransformingTests: XCTestCase {

  var sut: Transforming<Data, Data>!

  override func setUp() {
    sut = .identity
  }

  override func tearDown() {
    sut = nil
  }

  // MARK: -

  func test_identity() {
    let input = Data([1, 2, 3, 4, 5])
    let output = sut.transform(input)
    XCTAssertEqual(output, input)
  }

}
