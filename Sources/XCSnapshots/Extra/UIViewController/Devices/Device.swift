import UIKit

public struct Device {
  public let screenSize: CGSize
  public let safeAreaInsets: UIEdgeInsets
  public let traitCollection: UITraitCollection

  public init(screenSize: CGSize, safeAreaInsets: UIEdgeInsets, traitCollection: UITraitCollection) {
    self.screenSize = screenSize
    self.traitCollection = traitCollection
    self.safeAreaInsets = safeAreaInsets
  }
}
