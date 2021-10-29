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
    
    var body: some View {
        VStack {
            //            if #available(iOS 15.0, *) {
            List(viewModel.parkModel, id: \.documentId) { item in
                NavigationLink(destination: SingleParkView(singleItem: item)) {
                    HStack{
                        Text("Parking Name: \(item.parkName)")
                        Spacer()
                        if(item.parkCategory == "VIP"){
                            VStack{
                                Text("VIP")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.red)
                            }
                        }else{
                            Text("Normal")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.green)
                        }
                        Spacer()
                        if(item.reserved){
                            VStack{
                                Text("Reserved")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.red)
                                
                                Text(item.uservehicle)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.red)
                            }
                        }else{
                            VStack{
                                Text("Avaliable")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.green)
                            }
                        }
                    }.frame(height: UIScreen.main.bounds.height/12, alignment: .center)
                }
            }
            //                .refreshable {
            //                    viewModel.fetchBookReseveData()
            //                }
            .onAppear() {
                if (type == "Avaliable"){
                    viewModel.fetchAllData()
                } else if (type == "Book"){
                    viewModel.fetchBookData()
                } else if (type == "Reservation"){
                    viewModel.fetchBookReseveData()
                }
            }
            //            } else {
            //                List(viewModel.parkModel, id: \.documentId) { item in
            //                    HStack{
            //                        Text("Parking Name: \(item.parkName)")
            //                        Spacer()
            //                        if(item.booked){
            //                            VStack{
            //                                Text("Booked")
            //                                    .font(.headline)
            //                                    .fontWeight(.semibold)
            //                                    .foregroundColor(Color.red)
            //                            }
            //                        }else{
            //                            VStack{
            //                                Text("Avaliable")
            //                                    .font(.headline)
            //                                    .fontWeight(.semibold)
            //                                    .foregroundColor(Color.green)
            //                            }
            //                        }
            //                    }.frame(height: UIScreen.main.bounds.height/12, alignment: .center)
            //                }
            //                .onAppear() {
            //                    viewModel.fetchBookReseveData()
            //                }
            //            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var sinsgleitm = "Avaliable"
    
    static var previews: some View {
        HomeView(type: sinsgleitm)
    }
}
