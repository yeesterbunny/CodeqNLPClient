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

public class Sentence: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case position
        case rawSentence = "raw_sentence"
        case sentiments
        case speechActs = "speech_acts"
        case emotions
        case sarcasm
        case tokens
        case tokensFiltered = "tokens_filtered"
        case lemmas
        case stems
        case posTags = "pos_tags"
        case dependencies
    }
    
    public private(set) var position: Int?
    public private(set) var rawSentence: String?
    public private(set) var sentiments: [String]?
    public private(set) var speechActs: [String]?
    public private(set) var emotions: [String]?
    public private(set) var sarcasm: String?
    public private(set) var tokens: [String]?
    public private(set) var tokensFiltered: [String]?
    public private(set) var lemmas: [String]?
    public private(set) var stems: [String]?
    public private(set) var posTags: [String]?
    public private(set) var dependencies: [[String]]?
    
    
    required public init(from decoder: Decoder) throws {
        let sentenceValue = try decoder.container(keyedBy: CodingKeys.self)
        
        position = try sentenceValue.decodeIfPresent(Int.self, forKey: .position)
        rawSentence = try sentenceValue.decodeIfPresent(String.self, forKey: .rawSentence)
        sentiments = try sentenceValue.decodeIfPresent([String].self, forKey: .sentiments)
        speechActs = try sentenceValue.decodeIfPresent([String].self, forKey: .speechActs)
        emotions = try sentenceValue.decodeIfPresent([String].self, forKey: .emotions)
        sarcasm = try sentenceValue.decodeIfPresent(String.self, forKey: .sarcasm)
        tokens = try sentenceValue.decodeIfPresent([String].self, forKey: .tokens)
        tokensFiltered = try sentenceValue.decodeIfPresent([String].self, forKey: .tokensFiltered)
        lemmas = try sentenceValue.decodeIfPresent([String].self, forKey: .lemmas)
        stems = try sentenceValue.decodeIfPresent([String].self, forKey: .stems)
        posTags = try sentenceValue.decodeIfPresent([String].self, forKey: .posTags)
        dependencies = try sentenceValue.decodeIfPresent([[String]].self, forKey: .dependencies)
    }
}

extension Sentence: CustomStringConvertible {
    public var description: String {
        return """
            rawSentence: \(rawSentence ?? "Not found")
            position: \(position ?? -1)
            sentiments: \(sentiments ?? ["Not Found"])
            speechActs: \(speechActs ?? ["Not Found"])
            emotions: \(emotions ?? ["Not Found"])
            sarcasm: \(sarcasm ?? "Not Found")
            tokens: \(tokens ?? ["Not found"])
            tokensFiltered: \(tokensFiltered ?? ["Not found"])
            lemmas: \(lemmas ?? ["Not found"])
            stems: \(stems ?? ["Not found"])
            posTags: \(posTags ?? ["Not found"])
            dependencies: \(dependencies ?? [["Not found"]])
        
        """
    }
}
