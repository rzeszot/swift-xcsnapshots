import Foundation

public struct Transforming<Value, Format> {
  public let transform: (Value) -> Format

  public init(transform: @escaping (Value) -> Format) {
    self.transform = transform
  }
}

extension Transforming where Value == Format {
  public static var identity: Transforming {
    .init(transform: { $0 })
  }
}
