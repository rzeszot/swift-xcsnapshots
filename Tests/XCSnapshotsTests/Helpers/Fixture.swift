import Foundation

struct Fixture: ExpressibleByStringLiteral {
  let string: String

  var data: Data {
    string.data(using: .utf8)!
  }

  init(stringLiteral value: String) {
    string = value
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
