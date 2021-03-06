//
//  TagView.swift
//  VJ
//
//  Created by Cappuccino on 2020-09-02.
//

import SwiftUI

struct TagView: View {
    
    var body: some View {
        
        GeometryReader { geo in
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Y")
                    Spacer()
                    Text("X")
                    Spacer()
                    Text("A")
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Text("P")
                    Spacer()
                    Text("A")
                    Spacer()
                    Text("U")
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Text("H")
                    Spacer()
                    Text("X")
                    Spacer()
                    Text("G")
                    Spacer()
                }
                Spacer()
            }
            .font(.system(size: geo.size.height * 0.03, weight: .black, design: .monospaced))
            .foregroundColor(.white)
            
        }
        .aspectRatio(1.0, contentMode: .fit)
        
    }
    
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView()
    }
}
