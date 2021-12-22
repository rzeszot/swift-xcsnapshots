import Foundation

struct FileStorage: Storage {
  private let manager: FileManager = .default

  func setup(directory: URL) {
    try! manager.createDirectory(at: directory, withIntermediateDirectories: true)
  }

  func exists(file: URL) -> Bool {
    manager.fileExists(atPath: file.path)
  }

  func write(file: URL, data: Data) {
    try! data.write(to: file)
  }

  func read(file: URL) -> Data {
    try! Data(contentsOf: file)
  }
}
