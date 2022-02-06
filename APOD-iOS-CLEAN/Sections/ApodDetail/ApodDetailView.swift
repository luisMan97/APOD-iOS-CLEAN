//
//  ApodDetailView.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 26/01/22.
//

import SwiftUI

struct ApodDetailView: View {
     
    var apod: ApodList.Apod.Domain
    
    private var placeHolderImage: some View {
        ZStack {
            Color(.lightGray)
            
            Text("Cargando...")
                .foregroundColor(.gray)
        }
        .frame(width: 140, height: 140)
        .cornerRadius(10)
        .padding(.top)
    }
    
    var body: some View {
        ScrollView {
            VStack() {
                if let imageURL = apod.imageURL {
                    AsyncImage(url: imageURL,
                               placeholder: { placeHolderImage },
                               image: { Image(uiImage: $0).resizable() })
                        .aspectRatio(contentMode: .fit)
                }
                
                Text(apod.title)
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .padding(.top)
                    .multilineTextAlignment(.center)
                
                HStack {
                    Text(apod.date)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                .padding()
                
                Text(apod.explanation)
                    .font(.system(.body, design: .rounded))
                    .padding(.horizontal)
                  
                Spacer()
            }
        }.navigationBarTitle(Text(apod.title), displayMode: .inline)
    }
}
