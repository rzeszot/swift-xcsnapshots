import UIKit

extension Device {
  public static func iPhoneSE(orientation: Orientation = .default, style: Style = .default, direction: Direction = .default
  ) -> Self {
    let traits = UITraitCollection(traitsFrom: [
      .init(displayGamut: .P3),
      .init(displayScale: 2),
      .init(userInterfaceIdiom: .phone),
      .init(horizontalSizeClass: .compact),
      .init(verticalSizeClass: .regular),
      .init(style),
      .init(direction)
    ])

    return Device(
      screenSize: .iPhoneSE(orientation),
      safeAreaInsets: .zero,
      traitCollection: traits
    )
  }
}

private extension CGSize {
  static func iPhoneSE(_ orientation: Orientation) -> CGSize {
    CGSize(width: 375.0, height: 667.0).applying(orientation)
  }
}
