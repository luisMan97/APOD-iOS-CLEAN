//
//  ApodRow.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 25/01/22.
//

import SwiftUI

struct ApodRow: View {
    
    var apod: ApodList.Apod.Domain
    
    private var placeHolderImage: some View {
        ZStack {
            Color(.lightGray)
            
            Text("Cargando...")
                .foregroundColor(.gray)
        }
        .frame(width: 120, height: 120)
        .cornerRadius(10)
    }
    
    var body: some View {
        HStack {
            if let imageURL = apod.imageURL {
                VStack {
                    AsyncImage(url: imageURL,
                               placeholder: { placeHolderImage },
                               image: { Image(uiImage: $0).resizable() })
                        .frame(width: 120, height: 120)
                    //.aspectRatio(contentMode: .fill)
                
                    Spacer()
                }
            }
            
            VStack(alignment: .leading) {
                Text(apod.title)
                    .font(.system(.body, design: .rounded))
                
                Text(apod.date)
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.gray)
                
                Spacer()
            }
        }.padding(.top)
    }
}
