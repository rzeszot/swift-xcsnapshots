import UIKit

extension Transforming where Value == UIViewController, Format == UIImage {
  public static func image(_ device: Device) -> Transforming {
    return Transforming { vc in
      let window = ScreenshotWindow(device: device)
      window.rootViewController = vc
      window.layoutIfNeeded()
      window.makeKeyAndVisible()

      return snapshot(window, traits: device.traitCollection)
    }
  }
}

private func snapshot(_ view: UIView, traits: UITraitCollection) -> UIImage {
  let format = UIGraphicsImageRendererFormat(for: traits)
  let renderer = UIGraphicsImageRenderer(bounds: view.bounds, format: format)

  return renderer.image { ctx in
    view.layer.render(in: ctx.cgContext)
  }
}

private class ScreenshotWindow: UIWindow {
  private let overrideSafeAreaInsets: UIEdgeInsets
  private let overrideTraitCollection: UITraitCollection

  init(size: CGSize, safeAreaInsets: UIEdgeInsets, traitCollection: UITraitCollection) {
    self.overrideSafeAreaInsets = safeAreaInsets
    self.overrideTraitCollection = traitCollection
    super.init(frame: CGRect(origin: .zero, size: size))
  }

  convenience init(device: Device) {
    self.init(
      size: device.screenSize,
      safeAreaInsets: device.safeAreaInsets,
      traitCollection: device.traitCollection
    )
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override var safeAreaInsets: UIEdgeInsets {
    overrideSafeAreaInsets
  }

  override var traitCollection: UITraitCollection {
    overrideTraitCollection
  }
}
