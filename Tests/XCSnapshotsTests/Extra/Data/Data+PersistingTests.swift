import XCSnapshots
import XCTest

final class DataPersistingTests: XCTestCase {

  var sut: Persisting<Data>!

  override func setUp() {
    sut = .raw
  }

  override func tearDown() {
    sut = nil
  }

  // MARK: -

  func test_extension() {
    XCTAssertEqual(sut.ext, "data")
  }

  // MARK: -

  func test_encode() {
    let input = Data([1, 2, 3, 4, 5])
    let result = sut.encode(input)
    XCTAssertEqual(result, input)
  }

  func test_decode() {
    let input = Data([1, 2, 3, 4, 5])
    let result = sut.decode(input)
    XCTAssertEqual(result, input)
  }

}
