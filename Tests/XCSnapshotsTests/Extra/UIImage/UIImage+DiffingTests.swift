import XCSnapshots
import XCTest

final class UIImageDiffingTests: XCTestCase {

  var sut: Diffing<UIImage>!

  override func setUp() {
    sut = .image(precision: 1, scale: 2)
  }

  override func tearDown() {
    sut = nil
  }

  // MARK: -

  func test_failure_scale() {
    let output = sut.compare(.lenna(scale: 1), .lenna(scale: 2))
    XCTAssertEqual(output?.0.starts(with: "Images scales are different "), true)
  }

  func test_failure_size() {
    let output = sut.compare(.lenna(scale: 3), .init(systemName: "xmark")!)
    XCTAssertEqual(output?.0.starts(with: "Images sizes are different "), true)
  }

  func test_failure_differences() {
    let output = sut.compare(.lenna(scale: 2), .trollface(scale: 2))
    XCTAssertEqual(output?.0, "Snapshot does not match (0.22231197, allowed: 0.0)")
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
