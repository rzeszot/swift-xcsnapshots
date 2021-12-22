import Foundation

extension Snapshotting where Value == String, Format == String {
  public static let string = Snapshotting(diffing: .lines, persisting: .stringify)
}
