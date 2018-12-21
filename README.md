# CodeqNLPClient

Swift Interface for [Codeq Natural Language Processing API](https://api.codeq.com/)

## Usage

Instantiate `CodeqNLPClient`, and call `analyze(text:, completionHander: )` to send HTTP POST request to Codeq's endpoint. The completionHandler will be invoked with `[Sentence]?` and `Error?` after the request returns.

A playground file is included for demo purposes

*TODO: Add DemoScreenShot*

## Annotators

This Swift Interface currently support the following annotators:

* speechact
* sentiment
* emotions
* sarcasm

More annotators will be added in the future.

For a full list of supported annotators by Codeq NLP APIs, please visit [Codeq NLP API Documentation](https://api.codeq.com/api)

## Requirements

* iOS 12.1
* Swift 4.2
* Xcode 10.1

## Installation

*Under Construction*

## Credits

Created and maintained by Allen Yee

## BSD 3-Clause License

Copyright (c) 2018, Allen Yee
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

* Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


