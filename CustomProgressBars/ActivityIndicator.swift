//
//  ActivityIndicator.swift
//  CustomProgressBars
//
//  Created by Levit Kanner on 11/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: View {
    @State var degrees: CGFloat = 0.0
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.6)
            .stroke(Color.gray , lineWidth: 5)
            .frame(width: 120 , height: 120)
            .rotationEffect(Angle(degrees: Double(self.degrees)))
            .onAppear(perform: startloadig)
        
    }
    func startloadig(){
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
            withAnimation {
                self.degrees += 10
            }
            
            if self.degrees == 360 {
                self.degrees = 0.0
            }
            
            
        }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
