import XCTest

import CursedTests

var tests = [XCTestCaseEntry]()
tests += CursedTests.allTests()
XCTMain(tests)