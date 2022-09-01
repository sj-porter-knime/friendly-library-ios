//
//  Response.swift
//  Friendly Library
//
//  Created by SJ Porter on 2/17/21.
//

import Foundation

struct Response: Codable {
    let id: String
    let executorName: String
    let finishedExecutionAt: String
    let startedExecutionAt: String
    let outputValues: OutputValues
    let workflow: String
}

struct OutputValues: Codable {
    let jsonOutput: JSONOutput

    enum CodingKeys: String, CodingKey {
        case jsonOutput = "json-output"
    }
}

struct JSONOutput: Codable {
}
