import XCTest

extension XCTAttachment {
  convenience init(name: String, data: Data) {
    self.init(data: data)
    self.name = name
  }

  convenience init(name: String, string: String) {
    self.init(string: string)
    self.name = name
  }
}
