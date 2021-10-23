//
//  ContentView.swift
//  Flower6PetalsSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 11/09/20.
//  Copyright © 2021 Shreyas Vilaschandra Bhike. All rights reserved.
//  The App Wizard
//  Instagram : theappwizard2408
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Flower()
    }
}

struct Flower: View {
    @State private var rotateAnim = false
    var body: some View {
    ZStack{
    Color.black.edgesIgnoringSafeArea(.all)
        VStack{
        //1 : Overlay
        FlowerAnim(color: Color.clear,  //Color 1
                   color2: Color.clear, //Color 2
                   colorC: Color.clear, //Color Center
                   colorO: Color.white) //Overlay Stroke
                Spacer().frame(width: 120, height: 120)
                //2 : Gradient
        FlowerAnim(color: Color.purple,
                   color2: Color.pink,
                   colorC: Color.purple,
                   colorO: Color.clear)
                Spacer().frame(width: 120, height: 120)
                //3 : Overlay and Gradient
        FlowerAnim(color: Color.purple,
                   color2: Color.pink,
                   colorC: Color.purple,
                   colorO: Color.white)
                
            }
        }
        
    }
}










struct FlowerAnim: View {
    @State var color = Color.purple
    @State var color2 = Color.pink
    @State var colorC = Color.purple
    @State var colorO = Color.white
    
    
    @State private var mainflower = false
    @State private var showCentralCircle = false
    var body: some View {
        VStack {
            
            ZStack {
               
                //Background Gradient
                
                ZStack {
                    ZStack { // Vertical
                        ZStack { // Square gradient
                            RadialGradient(gradient: Gradient(colors: [color, color2]), center: .center, startRadius: 5, endRadius: 100)
                                // Clip gradient to circle
                                .clipShape(Circle()).frame(width: 120, height: 120)
                                .overlay(Circle().stroke(colorO, lineWidth: 4))
                                .offset(y: -51)
                        }
                        
                        ZStack {
                            RadialGradient(gradient: Gradient(colors: [color, color2]), center: .center, startRadius: 5, endRadius: 90)
                                .clipShape(Circle()).frame(width: 120, height: 120)
                                .overlay(Circle().stroke(colorO, lineWidth: 4))
                                .offset(y: 51)
                        }
                    }.opacity(0.5)
                    
                ZStack { // At 60°
                    ZStack {
                        RadialGradient(gradient: Gradient(colors: [color, color2]), center: .center, startRadius: 5, endRadius: 100)
                            .clipShape(Circle()).frame(width: 120, height: 120)
                            .overlay(Circle().stroke(colorO, lineWidth: 4))
                            .offset(y: -51)
                    }
                    
                    ZStack {
                        RadialGradient(gradient: Gradient(colors: [color, color2]), center: .center, startRadius: 5, endRadius: 90)
                            .clipShape(Circle()).frame(width: 120, height: 120)
                            .overlay(Circle().stroke(colorO, lineWidth: 4))
                            .offset(y: 51)
                    }
                }.opacity(0.5).rotationEffect(.degrees(60), anchor: .center)
                    
                ZStack { // At 60*2°
                    ZStack {
                        RadialGradient(gradient: Gradient(colors: [color, color2]), center: .center, startRadius: 5, endRadius: 100)
                            .clipShape(Circle()).frame(width: 120, height: 120)
                            .overlay(Circle().stroke(colorO, lineWidth: 4))
                            .offset(y: -51)
                    }
                    
                    ZStack {
                        RadialGradient(gradient: Gradient(colors: [color, color2]), center: .center, startRadius: 5, endRadius: 90)
                            .clipShape(Circle()).frame(width: 120, height: 120)
                            .overlay(Circle().stroke(colorO, lineWidth: 4))
                            .offset(y: 51)
                    }
                }.opacity(0.5).rotationEffect(.degrees(60*2), anchor: .center)
                    
                }// Whole flower
                .rotationEffect(.degrees(mainflower ? 360 : 0), anchor: .center)
                .scaleEffect(mainflower ? 1 : 0.2)
                .animation(Animation.easeInOut(duration: 4).delay(1).repeatForever(autoreverses: true))
                .opacity(mainflower ? 1 : 0.5)
                .onAppear() {
                self.mainflower.toggle()
                }
                
                
                //Central Circle Purple With Animation
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(colorC)
                    .scaleEffect(showCentralCircle ? 0 : 0.8)
                    .opacity(showCentralCircle ? 0 : 1)
                    .blendMode(.plusLighter)
                .blur(radius: 1)
                    .animation(Animation.easeInOut(duration: 4).delay(1).repeatForever(autoreverses: true))
                    .onAppear() {
                        self.showCentralCircle.toggle()
                }
                
            }
            
        }
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
