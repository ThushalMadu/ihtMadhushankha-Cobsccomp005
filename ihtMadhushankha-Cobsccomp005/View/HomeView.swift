//
//  HomeView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @State var reserverdName = ""
    @State var loader:Bool = true
    @State private var isActiveLink = false
    
    var type: String
    var items: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: 300)), count: 2)
    }
    var body: some View {
        VStack {
            if(viewModel.loadAvaliable){
                Spacer()
                ProgressView("Please Wait").progressViewStyle(CircularProgressViewStyle(tint: Color.app_Blue)).scaleEffect(1, anchor: .center).accentColor(Color.app_Blue)
                Spacer()
            } else{
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: items, spacing: 10) {
                        ForEach(viewModel.parkModel, id: \.documentId) { item in
                            NavigationLink(destination: SingleParkView(singleItem: item),isActive: $isActiveLink) {
                                ParkSingleComp(parkName: item.parkName, parkCategory: item.parkCategory, vehicleNumber: item.uservehicle, reserved: item.reserved, booked: item.booked, remainTime:String("\(viewModel.getRemainTime(dateValue: item.bookTime))"), function: {
                                    isActiveLink = true
                                    print(isActiveLink)
                                })
                            }
                        }
                        .padding(.horizontal)
                    }.padding(.top, 10.0)
                }
            }
        }
        .onAppear() {
            if (type == "Avaliable"){
                print(viewModel.loadAvaliable)
                viewModel.fetchAllData()
                
            } else if (type == "Book"){
                viewModel.fetchBookData()
            }
            else if (type == "Reservation"){
                viewModel.fetchBookReseveData()
            }
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var sinsgleitm = "Avaliable"
    
    static var previews: some View {
        HomeView(type: sinsgleitm)
    }
}
