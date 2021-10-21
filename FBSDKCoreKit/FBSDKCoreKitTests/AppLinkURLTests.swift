// Copyright (c) 2014-present, Facebook, Inc. All rights reserved.
//
// You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
// copy, modify, and distribute this software in source code or binary form for use
// in connection with the web services and APIs provided by Facebook.
//
// As with any software that integrates with the Facebook platform, your use of
// this software is subject to the Facebook Developer Principles and Policies
// [http://developers.facebook.com/policy/]. This copyright notice shall be
// included in all copies or substantial portions of the software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import TestTools
import XCTest

class AppLinkURLTests: XCTestCase {

  override class func setUp() {
    super.setUp()

    AppLinkURL.reset()
  }

  override func tearDown() {
    AppLinkURL.reset()

    super.tearDown()
  }

  func testDefaultDependencies() {
    XCTAssertNil(
      AppLinkURL.settings,
      "Should not have settings by default"
    )
    XCTAssertNil(
      AppLinkURL.appLinkFactory,
      "Should not have an app link factory by default"
    )
    XCTAssertNil(
      AppLinkURL.appLinkTargetFactory,
      "Should not have an app link target factory by default"
    )
  }

  func testConfiguringDependencies() {
    let settings = TestSettings()
    let appLinkFactory = TestAppLinkFactory()
    let appLinkTargetFactory = TestAppLinkTargetFactory()

    AppLinkURL.configure(
      settings: settings,
      appLinkFactory: appLinkFactory,
      appLinkTargetFactory: appLinkTargetFactory
    )

    XCTAssertTrue(
      AppLinkURL.settings === settings,
      "Should be able to configure dependencies"
    )
    XCTAssertTrue(
      AppLinkURL.appLinkFactory === appLinkFactory,
      "Should be able to configure dependencies"
    )
    XCTAssertTrue(
      AppLinkURL.appLinkTargetFactory === appLinkTargetFactory,
      "Should be able to configure dependencies"
    )
  }
}