//
//  HeaderView.swift
//  GrilledCheeseDelivery
//
//  Created by PM Student on 9/16/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.horizontal.3")
                    .font(.title2)
            })
        }
        
        .padding()
        
        .overlay(
        Text("Bread Delivery")
            .font(.title2)
            .fontWeight(.bold)
        )
        // Used for Xcode versions below 15
        // .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        
        // used version 15+
        .padding(.top, getSafeAreaInsets()?.top ?? 0)
        .background(Color("colorone"))
        .foregroundColor(.black)
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 0)
        
        }
    // used for version 15+
    private func getSafeAreaInsets() -> UIEdgeInsets? {
        let connectedScenes = UIApplication.shared.connectedScenes
        let windowScene = connectedScenes.first { $0 is UIWindowScene} as? UIWindowScene
        
        return windowScene?.windows.first?.safeAreaInsets
    }
}

#Preview {
    HeaderView()
}
