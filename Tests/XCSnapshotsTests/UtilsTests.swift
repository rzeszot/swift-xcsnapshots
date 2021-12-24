import XCTest
@testable import XCSnapshots

final class UtilsTests: XCTestCase {

  func test_directoryFromTestCaseFile() {
    let file = "/xcsnapshots/Tests/XCSnapshotsTests/VerifyTests.swift"
    let sut = directoryFromTestCaseFile(file: file)

    XCTAssertEqual(sut.absoluteString, "file:///xcsnapshots/Tests/XCSnapshotsTests/_Snapshots/VerifyTests")
  }

  // MARK: -

  func test_sanitize_spaces() {
    let sut = sanitize("hello world")
    XCTAssertEqual(sut, "hello-world")
  }

  func test_sanitize_dots() {
    let sut = sanitize("hello.world")
    XCTAssertEqual(sut, "hello-world")
  }

  func test_sanitize_underscore() {
    let sut = sanitize("hello_world")
    XCTAssertEqual(sut, "hello_world")
  }

  func test_sanitize_special_chars() {
    let sut = sanitize("hello !@#$%^&*()")
    XCTAssertEqual(sut, "hello")
  }

  func test_sanitize_numbers() {
    let sut = sanitize("hello 1234")
    XCTAssertEqual(sut, "hello-1234")
  }

}
