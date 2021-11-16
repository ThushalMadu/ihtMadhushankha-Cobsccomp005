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
    var type: String
    var items: [GridItem] {
      Array(repeating: .init(.adaptive(minimum: 300)), count: 2)
    }
    
    var body: some View {
        VStack {
            //            if #available(iOS 15.0, *) {
//            List(viewModel.parkModel, id: \.documentId) { item in
//                NavigationLink(destination: SingleParkView(singleItem: item)) {
//                    ParkSingleComp(parkName: item.parkName, parkCategory: item.parkCategory, vehicleNumber: item.uservehicle, reserved: item.reserved, booked: item.booked, remainTime:String("\(viewModel.getRemainTime(dateValue: item.bookTime))"))
//                }
//            }
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: items, spacing: 15) {
                ForEach(viewModel.parkModel, id: \.documentId) { item in
                      ParkSingleComp(parkName: item.parkName, parkCategory: item.parkCategory, vehicleNumber: item.uservehicle, reserved: item.reserved, booked: item.booked, remainTime:String("\(viewModel.getRemainTime(dateValue: item.bookTime))"))
                  }
                  .padding(.horizontal)
                }.padding(.top, 10.0)
              }
            .onAppear() {
//                viewModel.updatefetchAllData()
//                viewModel.updateUsersBangData()
                if (type == "Avaliable"){
                    viewModel.fetchAllData()
                    print("This Avaliable Tab Calling")
//                    viewModel.updateUsersBangData()
                } else if (type == "Book"){
                    print("Booking Clicj TAB")
                    viewModel.fetchBookData()
//                    viewModel.updateUsersBangData()
                }
                else if (type == "Reservation"){
                    viewModel.fetchBookReseveData()
                }
            }
        }.edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var sinsgleitm = "Avaliable"
    
    static var previews: some View {
        HomeView(type: sinsgleitm)
    }
}
