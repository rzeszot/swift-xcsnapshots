import XCTest

public func XCAssertSnapshot<Value, Format>(
  matching value: @autoclosure () -> Value,
  as snapshotting: Snapshotting<Value, Format>,
  file: StaticString = #file,
  function: String = #function,
  line: UInt = #line
) {
  let message = verify(
    matching: value(),
    as: snapshotting,
    storage: FileStorage(),
    file: file,
    function: function,
    line: line
  )

  if let message = message {
    XCTFail(message, file: file, line: line)
  }
}
