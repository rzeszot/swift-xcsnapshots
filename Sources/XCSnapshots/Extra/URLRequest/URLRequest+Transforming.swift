import Foundation

extension Transforming where Value == URLRequest, Format == String {
  public static let http2 = Transforming { request in
    var lines: [String] = []

    lines.append(":method: " + (request.httpMethod ?? "GET"))

    if let url = request.url {
      if let scheme = url.scheme {
        lines.append(":scheme: " + scheme)
      }

      if let host = url.host {
        // FIXME: port?
        lines.append(":authority: " + host)
      }

      lines.append(":path: " + url.path + (url.query.map { "?" + $0 } ?? ""))
    }

    let headers = (request.allHTTPHeaderFields ?? [:])
      .map { key, value in key + ": " + value }
      .sorted()
    lines.append(contentsOf: headers)

    if let body = request.httpBody {
      let string: String

      // FIXME: handle non-string body
      do {
        let json = try JSONSerialization.jsonObject(with: body)
        let data = try JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted, .sortedKeys])
        string = String(data: data, encoding: .utf8)!
      } catch {
        string = String(data: body, encoding: .utf8)!
      }

      lines.append("")
      lines.append(string)
    }

    return lines.joined(separator: "\n")
  }
}
