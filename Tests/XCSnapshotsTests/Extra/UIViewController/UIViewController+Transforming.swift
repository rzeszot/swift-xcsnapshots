import UIKit
import XCSnapshots
import XCTest

final class UIViewControllerTransformingTests: XCTestCase {

  func test_safe_area_insets_custom() {
    let device = Device(screenSize: CGSize(width: 200, height: 300), safeAreaInsets: UIEdgeInsets(top: 20, left: 40, bottom: 60, right: 80), traitCollection: UITraitCollection(traitsFrom: [.init(displayScale: 1)]))
    let vc = SafeAreaViewController()
    let sut = Transforming<UIViewController, UIImage>.image(device)
    let result = sut.transform(vc)

    XCAssertSnapshot(matching: result, as: .image(scale: 1))
  }

  func test_safe_area_insets_none() {
    let device = Device(screenSize: CGSize(width: 200, height: 300), safeAreaInsets: .zero, traitCollection: UITraitCollection(traitsFrom: [.init(displayScale: 1)]))
    let vc = SafeAreaViewController()
    let sut = Transforming<UIViewController, UIImage>.image(device)
    let result = sut.transform(vc)

    XCAssertSnapshot(matching: result, as: .image(scale: 1))
  }

  func test_safe_area_insets_iphone_13_portrait() {
    let vc = SafeAreaViewController()
    XCAssertSnapshot(matching: vc, as: .image(.iPhone13Pro(orientation: .portrait)))
  }

  func test_safe_area_insets_iphone_13_landscape_left() {
    let vc = SafeAreaViewController()
    XCAssertSnapshot(matching: vc, as: .image(.iPhone13Pro(orientation: .landscapeLeft)))
  }

  func test_safe_area_insets_iphone_13_landscape_right() {
    let vc = SafeAreaViewController()
    XCAssertSnapshot(matching: vc, as: .image(.iPhone13Pro(orientation: .landscapeRight)))
  }

  // MARK: -

  func test_style_light_on_iphone_13_pro_with_light_mode() {
    let vc = StyleViewController()
    XCAssertSnapshot(matching: vc, as: .image(.iPhone13Pro(style: .light)))
  }

  func test_style_dark_on_iphone_13_pro_with_dark_mode() {
    let vc = StyleViewController()
    XCAssertSnapshot(matching: vc, as: .image(.iPhone13Pro(style: .dark)))
  }

  // MARK: -

  func test_direction_on_iphone_13_pro_with_ltr() {
    let vc = DirectionViewController()
    XCAssertSnapshot(matching: vc, as: .image(.iPhone13Pro(direction: .leftToRight)))
  }

  func test_direction_on_iphone_13_pro_with_rtl() {
    let vc = DirectionViewController()
    XCAssertSnapshot(matching: vc, as: .image(.iPhone13Pro(direction: .rightToLeft)))
  }

}
