import XCTest

public func XCAssertSnapshot<Value, Format>(
  matching value: @autoclosure () -> Value,
  as snapshotting: Snapshotting<Value, Format>,
  file: StaticString = #file,
  function: String = #function,
  line: UInt = #line
) {
  guard let (message, attachments) = verify(
    matching: value(),
    as: snapshotting,
    storage: FileStorage(),
    file: file,
    function: function,
    line: line
  ) else { return }

  XCTFail(message, file: file, line: line)

  XCTContext.runActivity(named: "Add attachments") { activity in
    attachments.forEach(activity.add)
  }
}
