//
//  ContentView.swift
//  SwiftUIToolbarTutorial
//
//  Created by JIMENEZ, JANINE on 5/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack() {
                Text("Mobile Application Development presents students with opportunities to design, implement, and deliver projects using mobile computing devices. ")
                Spacer()
            }
            .padding(.all, 10)
            .navigationTitle("Mobile App Development")
            
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    
                    HStack(spacing: 50) {
                        Image(systemName: "trash")
                        Image(systemName: "info")
                        Image(systemName: "paperclip")
                        Text("Share")
                        
                        HStack {
                            Image(systemName: "photo")
                            Text("Photo")
                        }
                    }
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
