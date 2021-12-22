import XCTest

public struct Diffing<Value> {
  public let compare: (Value, Value) -> (String, [XCTAttachment])?

  public init(compare: @escaping (Value, Value) -> (String, [XCTAttachment])?) {
    self.compare = compare
  }
}
