import Foundation

func directoryFromTestCaseFile(file: String) -> URL {
  let url = URL(fileURLWithPath: file)
  let filename = url.deletingPathExtension().lastPathComponent

  return url
    .deletingLastPathComponent()
    .appendingPathComponent("_Snapshots")
    .appendingPathComponent(filename)
}

func sanitize(_ string: String) -> String {
  string
    .replacingOccurrences(of: "\\W+", with: "-", options: .regularExpression)
    .replacingOccurrences(of: "^-|-$", with: "", options: .regularExpression)
}
