import XCSnapshots
import XCTest

final class UIImage_PersistingTests: XCTestCase {

  var sut: Persisting<UIImage>!

  override func setUp() {
    sut = .image(scale: 1)
  }

  override func tearDown() {
    sut = nil
  }

  // MARK: -

  func test_extension() {
    XCTAssertEqual(sut.ext, "png")
  }

  // MARK: -

  func test_encode() {
    let input = UIImage.lenna
    let output = sut.encode(input)
    XCTAssertEqual(output, input.pngData())
  }

  func test_decode() {
    let input = Data.lenna
    let output = sut.decode(input)
    XCTAssertEqual(output.size, UIImage.lenna.size)
  }

}

private extension Data {
  static var lenna: Data = try! .init(contentsOf: Bundle.module.lenna)
}

private extension Bundle {
  var lenna: URL {
    url(forResource: "Lenna", withExtension: "png", subdirectory: nil)!
  }
}

private extension UIImage {
  static var lenna: UIImage {
    UIImage(named: "Lenna.png", in: .module, with: nil)!
  }
}
