import XCTest

func verify<Value, Format>(
  matching value: Value,
  as snapshotting: Snapshotting<Value, Format>,
  storage: Storage,
  file: StaticString = #file,
  function: String = #function,
  line: UInt = #line
) -> (String, [XCTAttachment])? {

  let directory = directoryFromTestCaseFile(file: "\(file)")
  let file = sanitize(function)
  let path = directory
    .appendingPathComponent(file)
    .appendingPathExtension(snapshotting.persisting.ext ?? "")

  let format = snapshotting.transformer.transform(value)

  storage.setup(directory: directory)

  if storage.exists(file: path) {
    let data = storage.read(file: path)
    let reference = snapshotting.persisting.decode(data)

    return snapshotting.diffing.compare(format, reference)
  } else {
    let data = snapshotting.persisting.encode(format)
    storage.write(file: path, data: data)
    return ("No reference was found on disk. Automatically recorded snapshot", [])
  }
}
