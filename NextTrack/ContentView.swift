//
//  ContentView.swift
//  NextTrack
//
//  Created by Димон on 5.10.23.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimate: Bool = false
    @State private var isAnimate2: Bool = false
    
    @Namespace private var namespace
    
    private let playImageName = "play.fill"
    
    private let matchedGeometryId = "Play"

    var body: some View {
        VStack {
            Button {
                withAnimation(.interpolatingSpring(stiffness: 180, damping: 15)) {
                    isAnimate.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isAnimate.toggle()
                }
            } label: {
                ZStack {
                    Image(systemName: playImageName)
                        .font(.system(size: 40))
                        .scaleEffect(isAnimate ? 1 : 0)
                        .opacity(isAnimate ? 1 : 0.5)
                        .offset(x: isAnimate ? 0 : -20)
                        .matchedGeometryEffect(id: matchedGeometryId, in: namespace)
                    Image(systemName: playImageName)
                        .font(.system(size: 40))
                        .offset(x: isAnimate ? 30 : 0)
                        .matchedGeometryEffect(id: matchedGeometryId, in: namespace)
                    Image(systemName: playImageName)
                        .font(.system(size: 40))
                        .scaleEffect(isAnimate ? 0 : 1)
                        .offset(x: isAnimate ? 50 : 30)
                        .opacity(isAnimate ? 0.0 : 1)
                        .matchedGeometryEffect(id: playImageName, in: namespace)
                }.offset(x: -10)
            }
            .frame(width: 100, height: 100)
            .buttonStyle(.plain)
            .foregroundStyle(.blue)
            .background(alignment: .center) {
                Color.gray
                    .opacity(isAnimate ? 0.1 : 0)
                    .clipShape(.circle)
                    .offset(x: 5)
                    .animation(.bouncy(duration: 0.5), value: isAnimate)
            }
        }
    }
}

#Preview {
    ContentView()
}
