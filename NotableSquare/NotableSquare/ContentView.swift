//
//  ContentView.swift
//  NotableSquare
//
//  Created by nastasya on 11.10.2023.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var offset = CGSize.zero
    private var height = UIScreen.main.bounds.height / 4
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { gesture in
                offset = gesture.translation
            }
            .onEnded { _ in
                withAnimation(.spring()) {
                    offset = .zero
                }
            }
    }
    
    var text: some View {
        Text("пиздец сука что это пон")
            .multilineTextAlignment(.center)
            .lineLimit(2)
    }
    
    var notableSquare: some View {
            Rectangle()
                .foregroundColor(.white)
                .overlay {
                    text
                        .foregroundStyle(.white)
                    .blendMode(.difference)
                    .overlay(text.blendMode(.hue))
                    .overlay(text.foregroundStyle(.white).blendMode(.overlay))
                    .overlay(text.foregroundStyle(.black).blendMode(.overlay))
                }
                .blendMode(.difference)
                .overlay(Rectangle().blendMode(.hue))
                .overlay(Rectangle().foregroundStyle(.white).blendMode(.overlay))
                .overlay(Rectangle().foregroundStyle(.black).blendMode(.overlay))
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 20,
                        style: .continuous
                    ))
                .frame(width: 150, height: 150)
                .offset(offset)
                .gesture(drag)
    }

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Rectangle()
                    .frame(width: .infinity, height: height)
                    .foregroundStyle(.white)
                Rectangle()
                    .frame(width: .infinity, height: height)
                    .foregroundStyle(.pink)
                Rectangle()
                    .frame(width: .infinity, height: height)
                    .foregroundStyle(.yellow)
                Rectangle()
                    .frame(width: .infinity, height: height)
                    .foregroundStyle(.black)
            }
            notableSquare
        }
    }
}

#Preview {
    ContentView()
}

