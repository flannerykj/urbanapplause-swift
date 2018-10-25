//
//  Image.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-25.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            print("URL: ", url.absoluteString)
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                } else {
                    print("COULDNT READ IMAGE FROM DATA")
                }
            } else {
                print("CANNOT GET IMAGE DATA")
            }
        }
    }
}
