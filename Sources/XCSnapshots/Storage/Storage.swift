import Foundation

protocol Storage {
  func setup(directory: URL)
  func exists(file: URL) -> Bool
  func write(file: URL, data: Data)
  func read(file: URL) -> Data
}
