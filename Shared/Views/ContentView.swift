//
//  ContentView.swift
//  Shared
//
//  Created by Cappuccino on 2020-08-12.
//

import SwiftUI
import MultiplatformTypes
import AirKit

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var vj: VJModel
    
    @State var tapOnSmallCircles: [Bool] = []
    @State var tapOnBigCircles: [Bool] = []

    var body: some View {
        
        VStack {
            
//            // Gradient Radial
//            GeometryReader { geo in
//                RadialGradient(gradient: Gradient(colors: [Color.clear, Color.primary]), center: .center, startRadius: 0.0, endRadius: geo.size.width / 2)
//            }
            
            HStack {
                
                Spacer()
                
                // Settings
                VStack(spacing: 20) {
                    
                    Image(systemName: "airplayvideo")
                        .foregroundColor(vj.isAirPlaying ? .primary : .red)
                    
                    // Opacity
                    HStack(spacing: 20) {
                    
                        Button {
                            vj.opacity = 0.0
                        } label: {
                            Image(systemName: "sun.min.fill")
                        }
                        .disabled(vj.opacity == 0.0)
                        
                        Slider(value: $vj.opacity)
                            .frame(width: 200)
                        
                        Button {
                            vj.opacity = 1.0
                        } label: {
                            Image(systemName: "sun.max.fill")
                        }
                        .disabled(vj.opacity == 1.0)
                        
                    }
                    .font(.system(size: 30))
                    
                    // Count
                    Stepper("", value: $vj.yCount)
                        .frame(width: 100)
                    
                    Spacer()
                    
                }
                .padding()
                
                Spacer()
                
                // Output
                ZStack {
                    
                    // Grids
                    Group {
                        
                        GridView(yCount: vj.yCount,
                                 tapOnCircles: $tapOnSmallCircles)
                        
                        GridView(yCount: vj.yCount - 2,
                                 tapOnCircles: $tapOnBigCircles)
                            .blendMode(.difference)
                        
                    }
                    
                    // Flash
                    Group {
                        if vj.flash {
                            Color.primary
                                .blendMode(.difference)
                        }
                        InteractView { interacted in
                            vj.flash = interacted
                        }
                    }
                    
                }
                .aspectRatio(16 / 9, contentMode: .fit)
                .clipped()
                .opacity(vj.opacity)
                .airPlay()
                .border(Color.primary)
                
            }
            
            // Input
            HStack {
                    
                // Grids
                Group {
                    
                    GridView(yCount: vj.yCount,
                             tapOnCircles: $tapOnSmallCircles, hint: true)
                    
                    GridView(yCount: vj.yCount - 2,
                             tapOnCircles: $tapOnBigCircles, hint: true)
                    
                }
                .aspectRatio(16 / 9, contentMode: .fit)
                .border(Color.primary)
                .clipped()
             
            }
            
        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: { () -> CGFloat? in
                #if os(macOS)
                return 1920 * 0.25
                #else
                return nil
                #endif
            }(), height: { () -> CGFloat? in
                #if os(macOS)
                return 1080 * 0.25
                #else
                return nil
                #endif
            }())
            .environmentObject(VJModel())
    }
}