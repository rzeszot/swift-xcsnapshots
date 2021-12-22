import XCTest

extension Diffing where Value == String {
  public static let lines = Diffing { old, new in
    let attachments = [
      XCTAttachment(name: "Reference", string: old),
      XCTAttachment(name: "Value", string: new)
    ]

    if old.count != new.count {
      return ("Size does not match", attachments)
    }

    let a = old.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)
    let b = new.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)

    for index in 0..<a.count where a[index] != b[index] {
      return ("Line at index \(index) does not match", attachments)
    }

    return nil
  }
}
