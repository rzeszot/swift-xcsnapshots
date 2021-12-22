import Foundation

extension Persisting where Value == Data {
  public static let raw = Persisting(
    ext: "data",
    encode: { $0 },
    decode: { $0 }
  )
}
