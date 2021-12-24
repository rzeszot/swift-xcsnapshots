import UIKit

extension Snapshotting where Value == UIImage, Format == UIImage {
  public static var image: Snapshotting {
    .image(scale: 3)
  }
  public static func image(precision: Float = 1, scale: CGFloat) -> Snapshotting {
    Snapshotting(diffing: .image(precision: precision, scale: scale), persisting: .image(scale: scale))
  }
}
