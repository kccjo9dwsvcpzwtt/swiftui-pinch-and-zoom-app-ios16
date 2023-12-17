//
//  ControlImageView.swift
//  swiftui-pinch-and-zoom-app-ios16
//
//  Created by Stanislav Ponomarenko on 2023-12-17.
//

import SwiftUI

struct ControlImageView: View {
  
  let icon: String
  
    var body: some View {
      Image(systemName: icon)
        .font(.system(size: 36))
    }
}

#Preview {
    ControlImageView(icon: "minus.magnifyingglass")
    .preferredColorScheme(.dark)
    .previewLayout(.sizeThatFits)
    .padding()
}
