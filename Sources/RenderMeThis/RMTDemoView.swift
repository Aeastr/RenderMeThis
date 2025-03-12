//
//  RMTDemoView.swift
//  RenderMeThis
//
//  Created by Aether on 12/03/2025.
//

import SwiftUI

@available(iOS 18.0, *)
struct RMTDemoView: View {
    @State private var counter = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(alignment: .leading, spacing: 12) {
                    // Entire content you're checking is wrapped in RenderCheck.
                    RenderCheck {
                        Text("Main Content")
                            .font(.headline)
                        
                        Text("Counter: \(counter)")
                            .font(.subheadline)
                        
                        Button(action: {
                            counter += 1
                        }) {
                            Label("Increment", systemImage: "plus.circle.fill")
                                .padding()
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(8)
                        }
                        
                        Divider()
                        
                        Text("Separate Section")
                            .font(.headline)
                        
                        RMTSubDemoView() // iOS 18 version of the subview.
                    }
                }
            }
            .padding()
            .navigationTitle("RenderMeThis")
        }
    }
}

@available(iOS 18.0, *)
struct RMTSubDemoView: View {
    @State private var counter = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            RenderCheck {
                
                Text("Counter: \(counter)")
                    .font(.subheadline)
                
                Button(action: {
                    counter += 1
                }) {
                    Label("Increment", systemImage: "plus.circle.fill")
                        .padding()
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(8)
                }
            }
        }
    }
}


struct RMTDemoView_Pre18: View {
    @State private var counter = 0

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                VStack(spacing: 12) {
                    Text("Main Content")
                        .font(.headline)
                        .checkForRender()

                    Text("Counter: \(counter)")
                        .font(.subheadline)
                        .checkForRender()

                    Button(action: {
                        counter += 1
                    }) {
                        HStack{
                            Text("Increment")
                            Image(systemName: "plus.circle.fill")
                        }
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(8)
                    }
                    .checkForRender()

                    Divider()
                        .checkForRender()

                    Text("Separate Section")
                        .font(.headline)
                        .checkForRender()

                    RMTSubDemoView_Pre18()
                        .checkForRender()
                }
            }
            .padding()
        }
    }
}

struct RMTSubDemoView_Pre18: View {
    @State private var counter = 0

    var body: some View {
        VStack(spacing: 12) {
            Text("Counter: \(counter)")
                .font(.subheadline)
                .checkForRender()

            Button(action: {
                counter += 1
            }) {
                HStack{
                    Text("Increment")
                    Image(systemName: "plus.circle.fill")
                }
                    .padding()
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(8)
            }
            .checkForRender()
        }
    }
}

@available(iOS 18.0, *)
#Preview("Wrapper") {
    RMTDemoView()
}

#Preview("Modifier") {
    RMTDemoView_Pre18()
}
