import Foundation

extension Snapshotting where Value == Data, Format == Data {
  public static let raw = Snapshotting(diffing: .first, persisting: .raw)
}
