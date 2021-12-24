import Foundation

struct Fixture {
  let data: Data

  var string: String {
    String(data: data, encoding: .utf8)!
  }
}

extension Fixture: ExpressibleByStringLiteral {
  init(stringLiteral value: String) {
    data = value.data(using: .utf8)!
  }

  static func from(url: URL) -> Fixture {
    Fixture(data: try! Data(contentsOf: url))
  }
}

extension Fixture {
  static var touch: Fixture = """
    Everything I touch
    with tenderness, alas,
    pricks like a bramble.
    """

  static var snail: Fixture = """
    O snail
    Climb Mount Fuji,
    But slowly, slowly!
    """
}
