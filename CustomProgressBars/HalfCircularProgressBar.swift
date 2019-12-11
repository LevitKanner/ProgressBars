//
//  HalfCircularProgressBar.swift
//  CustomProgressBars
//
//  Created by Levit Kanner on 11/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct HalfCircularProgressBar: View {
    @State var progress: CGFloat = 0.0
    var percentage: String{
        return "\(Int(progress * 100))%"
    }
    
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .stroke(Color.gray , style: StrokeStyle(lineWidth: 15, dash: [8]))
                    .frame(width: 200 , height: 200)
                    .rotationEffect(Angle(degrees: -180))
                
                Circle()
                    .trim(from: 0.0, to: self.progress/2)
                    .stroke(Color.blue , lineWidth: 15)
                    .frame(width: 200 , height: 200)
                    .rotationEffect(Angle(degrees: -180))
                
                
                
                HStack(alignment: .center){
                    Text(self.progress < 1 ? percentage : "process complete")
                        .font(.custom("HelveticaNeue", size: 20.0))
                    
                    if self.progress >= 1.0 {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.green)
                    }
                }
            }
            
            
            Button(action: {
                self.startloading()
            }){
                Text("start timer")
                    .font(.custom("HelveticaNeue", size: 16))
            }
        }
    }
    func startloading(){
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            withAnimation {
                self.progress += 0.01
                
                if self.progress > 1.0 {
                    timer.invalidate()
                }
            }
        }
    }
}

struct HalfCircularProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        HalfCircularProgressBar()
    }
}
