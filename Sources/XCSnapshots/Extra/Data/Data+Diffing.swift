import XCTest

extension Diffing where Value == Data {
  public static let first = Diffing { old, new in
    let attachments = [
      XCTAttachment(name: "Reference", data: old),
      XCTAttachment(name: "Value", data: new)
    ]

    if old.count != new.count {
      return ("Size does not match", attachments)
    }

    for index in 0..<old.count where old[index] != new[index] {
      return ("Byte at index \(index) does not match", attachments)
    }

    return nil
  }
}
