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
            return AnyView(
            Image("bread2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: getScreen().width, height: getScreen().height - firstMinY)
                .cornerRadius(1)
                .scaleEffect(scale < 0.6 ? imageScale: 1)
                .offset(y: scale < 0.3 ? imageOffSet: 0)
                .overlay(
                    
                    ZStack {
                        
                        VStack {
                            Text("BREAD")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .opacity(0.7)
                            
                            Text("It is bread indeed")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .opacity(0.7)
                                .padding()
                        }
                        .foregroundColor(.white)
                        .offset(y: 15)
                        .opacity(Double(scale - 0.7 / 0.3))
                        
                        Text("Bread")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .opacity(0.8)
                            .scaleEffect(1.6)
                            .opacity(0.1 - Double(scale - 0.7) / 0.3)
                    }
                )
            // used to overlay added content when scale < 0.6
                .background(
                    
                    // overlays a roundedrectangle with colorthree when scale is less then 0.6
                    ZStack {
                        if scale < 0.6 {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color("colorthree"))
                            
                            
                            // displays circles when scale < 0.6
                            VStack {
                                
                                HStack {
                                    
                                    // pushes our circles to the right edge
                                    Spacer()
                                    
                                    // displays our three circles
                                    ForEach(1...3, id: \.self) { _ in
                                    Circle()
                                            .fill(Color.gray)
                                            .frame(width: 15, height: 15)
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                )
            // applies vertical offset based on minY and lastMinY to ensure proper position/pos
                .scaleEffect(scale > 0.6 ? scale: 0.6)
                .offset(y: minY > 0 ? minY > lastMinY + 60 && lastMinY != 0 ? lastMinY + 60 : minY : 0)
                .offset(y: scale > 0.6 ? (scale - 1) * 200 : -80)
            )
        }
        .frame(width: getScreen().width, height: getScreen().height - firstMinY)
        
        .overlay(
            VStack {
                Text("Swipe up to order")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    showInfoModalView = true
                }, label: {
                    Label("Order", systemImage: "")
                        .background(Color.white)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .padding()
                        .border(Color.white, width: 16)
                })
                .padding()
            }
            // presents the order form as a modal sheet
                .sheet(isPresented: $showInfoModalView) {
                    OrderForm()
                }
                .offset(y: minY > 0 ? minY > lastMinY + 60 && lastMinY != 0 ? lastMinY + 60 : minY : 0), alignment: .bottom
        )
    }
}

#Preview {
    HomeView()
}
