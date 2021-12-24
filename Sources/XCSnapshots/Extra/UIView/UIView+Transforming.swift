import UIKit

extension Transforming where Value == UIView, Format == UIImage {
  public static func image(traits: UITraitCollection) -> Transforming {
    return .init { view in
      snapshot(view, traits: traits)
    }
  }
}

private func snapshot(_ view: UIView, traits: UITraitCollection) -> UIImage {
  let format = UIGraphicsImageRendererFormat(for: traits)
  let renderer = UIGraphicsImageRenderer(bounds: view.bounds, format: format)

  return renderer.image { ctx in
    view.layer.render(in: ctx.cgContext)
  }
}
