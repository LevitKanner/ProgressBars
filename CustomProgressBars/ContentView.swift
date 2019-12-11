//
//  ContentView.swift
//  CustomProgressBars
//
//  Created by Levit Kanner on 11/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var progress: CGFloat = 0.0
    
    var percentage: String{
        return "\(Int(progress * 100))%"
    }
    
    var body: some View {
        VStack(spacing: 30){
            ActivityIndicator()
            
            
            HalfCircularProgressBar()
            
            
            
            CircularProgressBar(progress: self.$progress)
            
            

            HStack(alignment: .center){
                Text(self.progress < 1 ? percentage : "process complete")
                    .font(.custom("HelveticaNeue", size: 20.0))
                
                if self.progress >= 1.0 {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                }
            }
            
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.gray)
                    .frame(width: 300 , height: 20)
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(width: 300 * progress , height: 20)
            }
            
            Button(action:{
                self.startLoading()
            }){
                Text("Start Timer")
            }
        }
        
    }
    
    func startLoading(){
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            withAnimation {
                self.progress += 0.01
                if self.progress >= 1.0 {
                    timer.invalidate()
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
