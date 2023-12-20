//
//  PageModel.swift
//  swiftui-pinch-and-zoom-app-ios16
//
//  Created by Stanislav Ponomarenko on 2023-12-20.
//

import Foundation

struct Page: Identifiable {
  var id: Int
  var imageName: String
}

extension Page {
  var thumbnailName: String {
    return "thumb-" + imageName
  }
}
