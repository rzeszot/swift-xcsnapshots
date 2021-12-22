import Foundation

extension Snapshotting where Value == URLRequest, Format == String {
  public static let http2: Snapshotting = .init(diffing: .lines, persisting: .stringify, transformer: .http2)
}
