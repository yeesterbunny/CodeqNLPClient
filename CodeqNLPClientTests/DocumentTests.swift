// BSD 3-Clause License
//
// Copyright (c) 2018, Allen Yee
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.
//
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// * Neither the name of the copyright holder nor the names of its
//   contributors may be used to endorse or promote products derived from
//   this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import XCTest

class DocumentTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDocumentMapping() {
        let json = """
            {
              "raw_text": "I really loved this device the first few months I had it and was ready to purchase more in this collection (Big Echo, Show, etc.) However, about 6 weeks ago my echo lost the ability to pause and play, which is very frustrating.",
              "sentences": [
                {
                  "position": 0,
                  "raw_sentence": "I really loved this device the first few months I had it and was ready to purchase more in this collection (Big Echo, Show, etc.)",
                  "speech_act": ["Statement"],
                  "sentiment": ["Positive"],
                  "emotions": ["Joy/Like"],
                  "sarcastic": "Non-sarcastic"
                },
                {
                  "position": 1,
                  "raw_sentence": "However, about 6 weeks ago my echo lost the ability to pause and play, which is very frustrating.",
                  "speech_act": ["Statement"],
                  "sentiment": ["Negative"],
                  "emotions": ["Anger"],
                  "sarcastic": "Non-sarcastic"
                }
              ]
            }
        """
        
        do {
            guard let jsonData = json.data(using: .utf16) else {
                XCTAssert(false)
                return
            }
            let jsonDecoder = JSONDecoder()
            let document = try jsonDecoder.decode(Document.self, from: jsonData)
            
            XCTAssertNotNil(document)

            guard let sentences = document.sentences else {
                XCTAssert(false)
                return
            }
            
            XCTAssertEqual(sentences.count, 2)
            
        } catch let decodeError {
            print("Decode Error: \(decodeError.localizedDescription)")
            XCTAssert(false)
        }
    }

}
