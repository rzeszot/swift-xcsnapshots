import XCTest
import XCSnapshots

final class XCAssertSnapshotTests: XCTestCase {

  func test_string() {
    XCAssertSnapshot(matching: "hello string", as: .string)
  }

  func test_data() {
    XCAssertSnapshot(matching: "hello data".data(using: .utf8)!, as: .raw)
  }

}
