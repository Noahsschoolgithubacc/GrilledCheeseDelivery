//
//  StickyView.swift
//  GrilledCheeseDelivery
//
//  Created by PM Student on 9/16/24.
//

import SwiftUI

struct StickyView: View {
    
    @Binding var firstMinY: CGFloat
    @Binding var minY: CGFloat
    @Binding var lastMinY: CGFloat
    @Binding var scale: CGFloat
    
    // tracks whether the info screen view should be shown
    @State var showInfoModalView = false
    
    var body: some View {
        
        //geometryreader=uses screen size and coords to determine how a view should look
        GeometryReader { reader -> AnyView in
            
            // the following calculates adjustments for the view based on its pos and size
            // dispatchqueue = executes code asynchronously
            let minY = reader.frame(in: .global).minY
            let progress = (minY > 0 ? minY: 0) / 200
            let scale = (1 - progress) * 1
            let imageScale = (scale / 0.6) > 0.9 ? (scale / 0.6) : 0.9
            let imageOffSet = imageScale > 0 ? (1 - imageScale) * 200 : 20
            
            DispatchQueue.main.async {
                if self.firstMinY == 0 {
                    self.firstMinY = minY
                }
                self.minY = minY
                
                if scale < 0.4 && lastMinY == 0 {
                    self.lastMinY = minY
                }
                self.scale = scale
            }
            return AnyView(Image("bread"))
        }
    }
}

#Preview {
    HomeView()
}
