//
//  CornerSettingView.swift
//  VJ
//
//  Created by Cappuccino on 2020-08-17.
//

import SwiftUI
import PolyKit

struct CornerSettingView: View {
    
    @Binding var corner: CGFloat
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Button {
                    corner = 0.0
                } label: {
                    if corner == 0.0 {
                        Poly(count: 6)
                            .stroke(lineWidth: 3)
                    } else {
                        Poly(count: 6)
                    }
                }
                .disabled(corner == 0.0)
                
                Spacer()
                
                Button {
                    corner = 0.5
                } label: {
                    if corner == 0.5 {
                        Poly(count: 6, relativeCornerRadius: 0.5)
                            .stroke(lineWidth: 3)
                    } else {
                        Poly(count: 6, relativeCornerRadius: 0.5)
                    }
                }
                .disabled(corner == 0.5)
                
                Spacer()
                
                Button {
                    corner = 1.0
                } label: {
                    if corner == 1.0 {
                        Poly(count: 6, relativeCornerRadius: 1.0)
                            .stroke(lineWidth: 3)
                    } else {
                        Poly(count: 6, relativeCornerRadius: 1.0)
                    }
                }
                .disabled(corner == 1.0)
                
            }
            .font(.system(size: 30))
        
            Slider(value: $corner)
            
            
        }
        .bg()
        
    }
    
}

struct CornerSettingView_Previews: PreviewProvider {
    static var previews: some View {
        CornerSettingView(corner: .constant(0.5))
    }
}
