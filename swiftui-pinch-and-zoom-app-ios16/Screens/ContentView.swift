//
//  ContentView.swift
//  swiftui-pinch-and-zoom-app-ios16
//
//  Created by Stanislav Ponomarenko on 2023-12-12.
//

import SwiftUI

struct ContentView: View {
  
  //MARK: - PROPERTY
  
  @State private var isAnimating: Bool = false
  @State private var imageScale: CGFloat = 1
  /*
   @State private var imageOffset: CGSize = CGSize(width: 0, height: 0)
   */
  @State private var imageOffset: CGSize = .zero // OPTIMIZATION OF PREVIOUS PROPERTY
  
  //MARK: - FUNCTION
  
  func resetImageState() {
    return withAnimation(.spring()) {
      imageScale = 1
      imageOffset = .zero
    }
  }
  
  //MARK: - CONTENT
  
  var body: some View {
    NavigationStack {
      ZStack {
        
        //MARK: - PAGE IMAGE
        
        Image("magazine-front-cover")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .cornerRadius(10)
          .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
          .opacity(isAnimating ? 1 : 0)
          .offset(x: imageOffset.width, y: imageOffset.height)
          .scaleEffect(imageScale)
        
        //MARK: - 1. TAP GESTURE
        
          .onTapGesture(count: 2, perform: {
            if imageScale == 1 {
              withAnimation(.spring()) {
                imageScale = 5 // SCALE-UP
              }
            } else {
              resetImageState()
            }
          })
        
        //MARK: - 2. DRAG GESTURE
        
          .gesture(
            DragGesture()
              .onChanged({ value in
                withAnimation(.linear(duration: 1)) {
                  imageOffset = value.translation
                }
              })
              .onEnded({ _ in
                if imageScale <= 1 {
                  resetImageState()
                }
              })
          )
        
      } //: ZSTACK
      .navigationTitle("Pinch & Zoom")
      .navigationBarTitleDisplayMode(.inline)
      .onAppear(perform: {
        withAnimation(.linear(duration: 1)) {
          isAnimating = true
        }
      })
    } //: NAVIGATION STACK
    .navigationViewStyle(.stack)
  }
}

//MARK: - PREVIEW

#Preview {
  ContentView()
}
