import Foundation

extension Persisting where Value == String {
  public static let stringify = Persisting(
    ext: "txt",
    encode: { $0.data()! },
    decode: { String(data: $0)! }
  )
}

private extension String {
  init?(data: Data) {
    self.init(data: data, encoding: .utf8)
  }

  func data() -> Data? {
    data(using: .utf8)
  }
}
