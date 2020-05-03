//
//  ContentView.swift
//  Animations
//
//  Created by Oscar da Silva on 02.05.20.
//  Copyright © 2020 Oscar da Silva. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var isShowingRed = false
    
    var body: some View {
        
        /*
         Showing and Hiding views with transitions and
         Building custom transitions using viewModifiers
         */
        VStack {
                Button("Tap Me") {
                    withAnimation{
                        self.isShowingRed.toggle()
                    }
                }

                if isShowingRed {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 200, height: 200)
//                        .transition(.scale) // same transition for insert and removal
//                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                        .transition(.pivot)
                }
        }

        /*
         Animating Gestures
         */
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count) { num in
//                Text(String(self.letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(self.enabled ? Color.blue : Color.red)
//                    .offset(self.dragAmount)
//                    .animation(Animation.default.delay(Double(num) / 20))
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged { self.dragAmount = $0.translation }
//                .onEnded { _ in
//                    self.dragAmount = .zero
//                    self.enabled.toggle()
//                }
//        )
        
//        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged { self.dragAmount = $0.translation }
////                    .onEnded { _ in self.dragAmount = .zero }
//                    .onEnded { _ in
//                        withAnimation(.spring()) {
//                            self.dragAmount = .zero
//                        }
//                }
//            )
////            .animation(.spring())
        
        /*
         Controlling the animation stack
         */
        
//        Button("Tap Me") {
//            // do nothing
//        }
//        .background(Color.blue)
//        .frame(width: 200, height: 200)
//        .foregroundColor(.white)
        
        // The order of modifiers matter
        
//        Button("Tap Me") {
//            self.enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled ? Color.blue : Color.red)
//        .foregroundColor(.white)
//        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//        .animation(.default)
        
        // Different animations for preceding modifiers
        
//        Button("Tap Me") {
//            self.enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled ? Color.blue : Color.red)
////        .animation(.default)
//        .animation(nil)  // No animation before here
//        .foregroundColor(.white)
//        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
//    }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}
