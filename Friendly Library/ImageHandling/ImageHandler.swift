//
//  ImageHandler.swift
//  Friendly Library
//
//  Created by SJ Porter on 2/10/21.
//

import Foundation
import UIKit

extension UIImage {
    func toBase64() -> String? {
        guard let imageData = self.pngData() else { return nil }
        return imageData.base64EncodedString()
    }
    func resized(withPercentage percentage: CGFloat, isOpaque: Bool = true) -> UIImage? {
        let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: canvas, format: format).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
    func resized(toWidth width: CGFloat, isOpaque: Bool = true) -> UIImage? {
        let canvas = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: canvas, format: format).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
}

struct ImageRequest: Codable {
    let jsonInput: JSONInput

    enum CodingKeys: String, CodingKey {
        case jsonInput = "json-input"
    }
}

struct JSONInput: Codable {
    let image: String

    enum CodingKeys: String, CodingKey {
        case image = "Image"
    }
}

class ImageHandler {
    var master_image : UIImage?
    var knime_server_client : KNIMEServerClient!

    init(master_image: UIImage?) throws {
        self.master_image = master_image
        self.knime_server_client = try KNIMEServerClient(
            // TODO: These credentials need updated. For security reasons it
            // is best not to hard-code the credentials and instead store them
            // on the device and access them when needed.
            server_url: "https://knimeserver.example.com/knime/rest",
            username: "your_username_goes_here",
            password: "your_password_goes_here"
        )
    }

    func sendImage() {
        // TODO: The path to the workflow needs updated.
        let workflow = "/v4/repository/Projects/Friendly%20Library/friendly_library_rest_api:execution"
        let resized_image = self.master_image?.resized(withPercentage: 0.1)
        let image = JSONInput(image: resized_image?.toBase64() ?? "invalid image")
        let image_request = ImageRequest(jsonInput: image)

        self.knime_server_client.post_to_workflow(
            workflow_uri: workflow,
            message_body: image_request
        )
    }

}
