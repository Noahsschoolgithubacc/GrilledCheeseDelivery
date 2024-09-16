//
//  HomeView.swift
//  GrilledCheeseDelivery
//
//  Created by PM Student on 9/16/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var firstMinY: CGFloat = 0
    @State var minY: CGFloat = 0
    @State var lastMinY: CGFloat = 0
    @State var scale: CGFloat = 0
    
    var body: some View {
        VStack {
            HeaderView()
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 15, content: {
                    Section(header: Text("BREAD")
                        .font(.title)
                        .fontWeight(.bold)) {
                            Text("It's all bread?\nAlways has been")
                                .multilineTextAlignment(.center)
                        }
                })
                .padding()
                .padding(.bottom, lastMinY)
                .background(Color.white)
                
                // adjusts the vertical position if scale is above 0.4; uses current Y position(minY), otherwise the last Y position (lastMinY)
                .offset(y: scale > 0.4 ? minY: lastMinY)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color("colorone"))
        .ignoresSafeArea(.all, edges: .all)
        
        // extension = adds new functionality to an existing class, struct or collection
    }
}
// adds a new method to all views. this method returns the screen bounds, which describes the dimensions of the devices 
extension View {
    // cgrect is a struct that contains the location and dimensions of a rectangle
    func getScreen() -> CGRect {
        return UIScreen.main.bounds
    }
}

#Preview {
    HomeView()
}
