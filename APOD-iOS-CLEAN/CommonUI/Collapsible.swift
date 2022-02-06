//
//  Collapsible.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 27/01/22.
//

import SwiftUI

struct Collapsible<Content: View>: View {
    @Binding var collapsed: Bool
    @State var label: () -> Text
    @State var content: () -> Content
    
    var body: some View {
        VStack {
            Button(
                action: { self.collapsed.toggle() },
                label: {
                    HStack {
                        self.label()
                        Spacer()
                        Image(systemName: self.collapsed ? "chevron.down" : "chevron.up")
                    }
                    .padding(.bottom, 1)
                    .frame(height: 50)
                    .background(Color.white.opacity(0.01))
                }
            )
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                self.content()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            .animation(.easeOut, value: 1)
            .transition(.slide)
        }
    }
}

