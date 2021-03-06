import UIKit
import XCTest

extension Diffing where Value == UIImage {
  public static func image(precision: Float, scale: CGFloat) -> Diffing {
    Diffing { lhs, rhs in
      if lhs.scale != rhs.scale {
        return ("Images scales are different (\(lhs.scale) != \(rhs.scale))", [.reference(lhs), .failure(rhs)])
      }

      if lhs.size != rhs.size {
        return ("Images sizes are different (\(lhs.size.width)x\(lhs.size.height) != \(rhs.size.width)x\(rhs.size.height))", [.reference(lhs), .failure(rhs)])
      }

      let attachments: [XCTAttachment] = [
        .reference(lhs),
        .failure(rhs),
        .difference(lhs, rhs)
      ]

      let lhs = UIImage(data: lhs.pngData()!, scale: scale)!
      let rhs = UIImage(data: rhs.pngData()!, scale: scale)!

      guard let lhs = lhs.cgImage, let rhs = rhs.cgImage else {
        return ("Conversion to CGImage failed", [])
      }

      let percentage = differences(lhs, rhs)
      let threshold = 1 - precision

      guard percentage <= threshold else {
        return ("Snapshot does not match (\(percentage), allowed: \(threshold))", attachments)
      }

      return nil
    }
  }
}

// MARK: -

private func differences(_ lhs: CGImage, _ rhs: CGImage) -> Float {
  precondition(lhs.width == rhs.width)
  precondition(lhs.height == rhs.height)

  guard let lhs = bytes(for: lhs), let rhs = bytes(for: rhs), lhs.count == rhs.count else {
    return 1
  }

  var different = 0

  for index in 0..<lhs.count where lhs[index] != rhs[index] {
    different += 1
  }

  return Float(different) / Float(lhs.count)
}

private func bytes(for image: CGImage) -> [UInt8]? {
  let count = 4 * image.width * image.height
  var bytes = [UInt8](repeating: 0, count: count)

  guard let context = CGContext(
    data: &bytes,
    width: image.width,
    height: image.height,
    bitsPerComponent: 8,
    bytesPerRow: 4 * image.width,
    space: CGColorSpace(name: CGColorSpace.sRGB)!,
    bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
  ) else {
    return nil
  }

  context.draw(image, in: CGRect(x: 0, y: 0, width: image.width, height: image.height))

  return bytes
}

// MARK: -

private extension XCTAttachment {
  static func reference(_ image: UIImage) -> XCTAttachment {
    let attachment = XCTAttachment(image: image)
    attachment.name = "Reference"
    return attachment
  }
  static func failure(_ image: UIImage) -> XCTAttachment {
    let attachment = XCTAttachment(image: image)
    attachment.name = "Failure"
    return attachment
  }
  static func difference(_ a: UIImage, _ b: UIImage) -> XCTAttachment {
    let image = diff(a, b)
    let attachment = XCTAttachment(image: image)
    attachment.name = "Difference"
    return attachment
  }
}

// MARK: -

private func diff(_ lhs: UIImage, _ rhs: UIImage) -> UIImage {
  precondition(lhs.size == rhs.size)
  precondition(lhs.scale == rhs.scale)

  UIGraphicsBeginImageContextWithOptions(lhs.size, true, lhs.scale)

  lhs.draw(at: .zero)
  rhs.draw(at: .zero, blendMode: .difference, alpha: 1)

  let image = UIGraphicsGetImageFromCurrentImageContext()!

  UIGraphicsEndImageContext()

  return image
}
