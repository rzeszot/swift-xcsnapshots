import UIKit

extension Snapshotting where Value == UIView, Format == UIImage {
  public static func image(precision: Float = 1, traits: UITraitCollection = .init(displayScale: 3)) -> Snapshotting {
    Snapshotting(
      diffing: .image(precision: precision, scale: traits.displayScale),
      persisting: .image(scale: traits.displayScale),
      transformer: .image(traits: traits)
    )
  }

  public static var image: Snapshotting {
    Snapshotting.image()
  }
}
