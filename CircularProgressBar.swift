//
//  CircularProgressBar.swift
//  CustomProgressBars
//
//  Created by Levit Kanner on 11/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct CircularProgressBar: View {
    @Binding var progress: CGFloat
    var percentage: String{
        return "\(Int(progress * 100))%"
    }
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color.gray , lineWidth: 15)
                .frame(width: 200 , height: 200)
            
            Circle()
                .trim(from: 0.0 , to: progress)
                .stroke(Color.blue , lineWidth: 15)
                .frame(width: 200 , height: 200)
                .rotationEffect(Angle(degrees: -90))
            
            
            VStack(alignment: .center){
                Text(self.progress < 1 ? percentage : "process complete")
                    .font(.custom("HelveticaNeue", size: 20.0))
                
                if self.progress >= 1.0 {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                }
            }
            
        }
    }
}

/*
 Tip: Delete twice the line width of the progress circle to get another nice progress bar.
 */
