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

import Foundation

public class CodeqNLPClient {
    private let codeqAPIEndpoint = URL(string:"https://api.codeq.com/v1")
    private(set) var userID: String
    private(set) var userKey: String
    
    public init(userID: String, userKey: String) {
        self.userID = userID
        self.userKey = userKey
    }
    
    public func analyze(_ text: String, pipeline: String? = nil, completionHandler: @escaping ([Sentence]?, Error?) -> Void) {
        var params = ["user_id": userID, "user_key": userKey, "text": text]
        if let pipeline = pipeline {
            params["pipeline"] = pipeline
        }
        
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: request(params: params)) { (data, response, error) in
            if let error = error {
                // TODO: Handle error
                print("error: \(error.localizedDescription)")
            }
            
            if let response = response {
                // TODO: Handle non 200s
                print("response: \(response.description)")
            }
            
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let document = try jsonDecoder.decode(Document.self, from: data)
                    completionHandler(document.sentences, error)
                    
                } catch let decodeError {
                    completionHandler(nil, decodeError)
                }
            } else {
                completionHandler(nil, error)
            }
        }
        task.resume()
    }
    
    private func request(params: [String: String]) -> URLRequest {
        var request = URLRequest(url: codeqAPIEndpoint!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        return request
    }
}
