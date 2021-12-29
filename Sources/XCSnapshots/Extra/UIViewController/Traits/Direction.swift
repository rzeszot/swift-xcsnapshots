import UIKit

public enum Direction {
  case leftToRight
  case rightToLeft

  public static var `default`: Self = .leftToRight
}

extension UITraitCollection {
  convenience init(_ direction: Direction) {
    switch direction {
    case .leftToRight:
      self.init(layoutDirection: .leftToRight)
    case .rightToLeft:
      self.init(layoutDirection: .rightToLeft)
    }
  }
}
