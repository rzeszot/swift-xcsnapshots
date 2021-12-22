import Foundation

public struct Persisting<Value> {
  public let ext: String?
  public let encode: (Value) -> Data
  public let decode: (Data) -> Value

  init(ext: String?, encode: @escaping (Value) -> Data, decode: @escaping (Data) -> Value) {
    self.ext = ext
    self.encode = encode
    self.decode = decode
  }
}
