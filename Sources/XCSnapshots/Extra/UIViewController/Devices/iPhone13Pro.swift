import UIKit

extension Device {
  public static func iPhone13Pro(orientation: Orientation = .default, style: Style = .default, direction: Direction = .default
  ) -> Self {
    let traits = UITraitCollection(traitsFrom: [
      .init(displayGamut: .P3),
      .init(displayScale: 3),
      .init(userInterfaceIdiom: .phone),
      .init(horizontalSizeClass: .compact),
      .init(verticalSizeClass: .regular),
      .init(style),
      .init(direction)
    ])

    return Device(
      screenSize: .iPhone13Pro(orientation),
      safeAreaInsets: .iPhone13Pro(orientation),
      traitCollection: traits
    )
  }
}

private extension CGSize {
  static func iPhone13Pro(_ orientation: Orientation) -> CGSize {
    CGSize(width: 390.0, height: 844.0).applying(orientation)
  }
}

private extension UIEdgeInsets {
  static func iPhone13Pro(_ orientation: Orientation) -> UIEdgeInsets {
    switch orientation {
    case .landscapeLeft, .landscapeRight:
      return UIEdgeInsets(top: 0, left: 47, bottom: 21, right: 47)
    case .portrait:
      return UIEdgeInsets(top: 47, left: 0, bottom: 34, right: 0)
    case .portraitUpsideDown:
      fatalError()
    }
  }
}
