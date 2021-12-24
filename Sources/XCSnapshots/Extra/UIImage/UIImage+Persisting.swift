import UIKit

extension Persisting where Value == UIImage {
  public static func image(scale: CGFloat = 1) -> Persisting {
    Persisting(
      ext: "png",
      encode: { image in
        image.pngData()!
      }, decode: { data in
        UIImage(data: data, scale: scale)!
      }
    )
  }
}
