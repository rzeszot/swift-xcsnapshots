import UIKit

extension Snapshotting where Value == UIViewController, Format == UIImage {
  public static func image(_ device: Device, precision: Float = 1) -> Snapshotting {
    Snapshotting(
      diffing: .image(precision: precision, scale: device.traitCollection.displayScale),
      persisting: .image(scale: device.traitCollection.displayScale),
      transformer: .image(device)
    )
  }
}
