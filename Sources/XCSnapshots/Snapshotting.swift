import Foundation

public struct Snapshotting<Value, Format> {
  public let diffing: Diffing<Format>
  public let persisting: Persisting<Format>
  public let transformer: Transforming<Value, Format>

  public init(diffing: Diffing<Format>, persisting: Persisting<Format>, transformer: Transforming<Value, Format>) {
    self.diffing = diffing
    self.persisting = persisting
    self.transformer = transformer
  }
}

extension Snapshotting where Value == Format {
  public init(diffing: Diffing<Value>, persisting: Persisting<Value>) {
    self.init(diffing: diffing, persisting: persisting, transformer: .identity)
  }
}
