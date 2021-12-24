import XCTest
import XCSnapshots

final class XCAssertSnapshotTests: XCTestCase {

  func test_string() {
    XCAssertSnapshot(matching: "hello string", as: .string)
  }

  func test_data() {
    XCAssertSnapshot(matching: "hello data".data(using: .utf8)!, as: .raw)
  }

  func test_image() {
    XCAssertSnapshot(matching: UIImage.lenna(scale: 1), as: .image(scale: 1))
  }

}

private extension Data {
  static var lenna: Data = try! .init(contentsOf: Bundle.module.lenna)
  static var trollface: Data = try! .init(contentsOf: Bundle.module.trollface)
}

private extension Bundle {
  var lenna: URL {
    url(forResource: "Lenna", withExtension: "png", subdirectory: nil)!
  }
  var trollface: URL {
    url(forResource: "Trollface", withExtension: "png", subdirectory: nil)!
  }
}

private extension UIImage {
  static func lenna(scale: CGFloat) -> UIImage {
    UIImage(data: .lenna, scale: scale)!
  }
  static func trollface(scale: CGFloat) -> UIImage {
    UIImage(data: .trollface, scale: scale)!
  }
}
