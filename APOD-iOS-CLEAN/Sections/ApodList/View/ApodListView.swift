//
//  ApodListView.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 25/01/22.
//

import SwiftUI

struct ApodListView: View {
    
    // MARK: - viewModel
    
    @ObservedObject var viewModel: ApodListViewModel
    
    // MARK: - Private State Properties
    
    @State private var date = Date()
    @State private var collapsed: Bool = true
    @State private var goToDetail: Bool = false
    
    // MARK: - Private Properties
    
    private var searchButton: some View {
        Text("Realizar busqueda")
            .foregroundColor(.white)
            .font(.title3)
            .padding()
            .background(Color(red: 0.052, green: 0.141, blue: 0.245, opacity: 1))
            .cornerRadius(10)
    }
    
    var body: some View {
        NavigationView {
            LoadingView(isShowing: $viewModel.showProgress) {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 0) {
                        Collapsible(collapsed: $collapsed, label: { Text("Realizar busqueda por día") .font(.title3)}) {
                            EmptyView()
                        }.padding(.top).padding(.horizontal)
                        
                        if !collapsed {
                            HStack {
                                Spacer()
                                
                                DatePicker("", selection: $date, in: ...Date(), displayedComponents: .date)
                                    .datePickerStyle(GraphicalDatePickerStyle())
                                    .accentColor(.orange)
                                    .frame(width: UIScreen.main.bounds.width - 90)
                                    .animation(.easeOut, value: 1)
                                
                                Spacer()
                            }
                            
                            HStack {
                                Spacer()
                                
                                Button(action: search, label: { searchButton })
                                    .padding(.horizontal, 45)
                                    .padding(.bottom)
                                    .offset(y: -10)
                            }
                        }
                        
                        Text("Últimos 8 días")
                            .foregroundColor(.orange)
                            .font(.title)
                            .padding(.vertical)
                            .padding(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(red: 240/255, green: 240/255, blue: 245/255, opacity: 1))
                        
                        ForEach(viewModel.apods) { apod in
                            ApodRow(apod: apod)
                                .padding(.horizontal)
                                .onTapGesture {
                                    goToDetail = true
                                }
                            
                            NavigationLink(destination: ApodDetailView(apod: apod), isActive: $goToDetail) {
                                EmptyView()
                            }
                        }//.buttonStyle(PlainButtonStyle())
                    }
                }
                .navigationBarTitle("Astronomy Picture of the Day")
            }
            .alert(item: $viewModel.error) {
                Alert(
                    title: Text("Error"),
                    message: Text($0),
                    dismissButton: .default(Text("Ok"))
                )
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func search() {
        viewModel.getApod(date: date)
        collapsed.toggle()
    }
    
}

struct ApodListView_Previews: PreviewProvider {
    static var previews: some View {
        ApodListFactory.getApodListView()
    }
}
