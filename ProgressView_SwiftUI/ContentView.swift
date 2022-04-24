//
//  ContentView.swift
//  ProgressView_SwiftUI
//
//  Created by Alejandro Gómez Martín on 24/4/22.
//

import SwiftUI
import CoreData
import UIKit
struct ContentView: View {
    var body: some View {
        VStack{
            UnknownProgressView()
            Divider()
            LinearProgressView()
            
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
        ContentView()
            
        }
    }
}

struct UnknownProgressView: View {
    @State var isLoading=false

    var body: some View {
        VStack(alignment: .center, spacing: 10){
            Text("Progress View").font(.largeTitle)
            ZStack{
                Text(isLoading ? "Loading data" :  "press the button to load data")
                    .font(.title2)
                if(isLoading){
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .scaleEffect(3)
                }
                
            }
            Button(
                isLoading ? "Cancel" : "Load",
                action: {isLoading.toggle()}
            )
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
            .font(.title2)
            
            
        }
    }
}


struct LinearProgressView: View {
    @State var isLoading=false
    @State var value=0.0
    
    
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10){
            
            
            Text("Linear View").font(.largeTitle)
            Text("\(value) %")
                .onReceive(timer){ _ in
                    if (isLoading==true && value<=1){
                        value+=0.000564*Double.random(in: 0..<100)
                    }else{
                        isLoading=false
                        value = 0
                    }
                    
                }
            
                ProgressView(value: value)
                                    .padding(.horizontal, 30)
                                    .padding(.bottom, 20)
                                
            
            
                Text(isLoading ? "Loading Image" :  "press the button to load Image")
                    .font(.title2)
                
                
            
            Button(
                isLoading ? "Cancel" : "Load",
                action: {
                    isLoading.toggle()
                    value=0
                    
                }
            )
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
            .font(.title2)
            
            
        }
    }
    
    
}
