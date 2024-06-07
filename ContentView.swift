//
//  ContentView.swift
//  WaterMarkingApplication
//
//  Created by Sreya  Sarathy on 07/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var watermarkedImage: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                if let inputImage = inputImage {
                    Image(uiImage: inputImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                }
                
                if let watermarkedImage = watermarkedImage {
                    Image(uiImage: watermarkedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                }

                Spacer()
                
                Button(action: {
                    showingImagePicker = true
                }) {
                    Text("Select Image")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 280, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 10)
                 
                Button(action: {
                    if let inputImage = inputImage {
                        let watermarker = ImageWatermarker()
                        watermarkedImage = watermarker.addTextWatermark(text: "Priya Math Academy", to: inputImage)
                    }
                }) {
                    Text("Apply Watermark")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 280, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $inputImage)
            }
            .navigationBarTitle("Watermark App", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                inputImage = nil
                watermarkedImage = nil
            }) {
                Text("Reset")
            })
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        watermarkedImage = nil  // Clear the previous watermark if any
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
