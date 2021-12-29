import UIKit

public enum Style {
  case light
  case dark

  public static var `default`: Self = .light
}

extension UITraitCollection {
  convenience init(_ style: Style) {
    switch style {
    case .light:
      self.init(userInterfaceStyle: .light)
    case .dark:
      self.init(userInterfaceStyle: .dark)
    }
  }
}
