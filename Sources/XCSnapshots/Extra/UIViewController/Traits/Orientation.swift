import UIKit

public enum Orientation {
  case portrait
  case portraitUpsideDown
  case landscapeLeft
  case landscapeRight

  public static var `default`: Self = .portrait
}

extension CGSize {
  func applying(_ orientation: Orientation) -> CGSize {
    switch orientation {
    case .portrait, .portraitUpsideDown:
      return self
    case .landscapeLeft, .landscapeRight:
      return CGSize(width: height, height: width)
    }
  }
}
