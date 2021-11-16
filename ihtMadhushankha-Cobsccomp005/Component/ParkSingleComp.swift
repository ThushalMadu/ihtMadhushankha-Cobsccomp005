//
//  ParkSingleComp.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-17.
//

import SwiftUI

struct ParkSingleComp: View {
    
    var parkName:String
    var parkCategory:String
    var vehicleNumber:String
    var reserved:Bool
    var booked:Bool
    var remainTime:String

    
    var body: some View {
        VStack{
            if(parkCategory == "VIP"){
                Image("vipCar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 10.0)
                    .frame(height:100)
            }else{
                Image("normalCar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 10.0)
                    .frame(height:100)
            }
            TextTitle(title: parkName, fontSize: 24, fontTitleWeight: .semibold, fontColor: Color.gray)
            Spacer()
            if(parkCategory == "VIP"){
                VStack{
                    TextTitle(title: "VIP", fontSize: 14, fontTitleWeight: .semibold, fontColor: Color.red)
                }
            }else{
                TextTitle(title: "Normal", fontSize: 14, fontTitleWeight: .semibold, fontColor: Color.green)
            }
            Spacer()
            if(reserved){
                VStack{
                    TextTitle(title: "Reserved", fontSize: 14, fontTitleWeight: .regular, fontColor: Color.red)
                    TextTitle(title: vehicleNumber, fontSize: 14, fontTitleWeight: .regular, fontColor: Color.red)
                }
            }else{
                EmptyView()
            }
            Spacer()
            if(booked){
                VStack{
                    TextTitle(title: String("\(remainTime)"), fontSize: 16, fontTitleWeight: .semibold, fontColor: Color.red)
                        .padding(.bottom, 10.0)
                }
            }else{
              EmptyView()
            }
        }
        .frame(width:170, height: 200)
        .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 1, y: 3)
            )
//        .frame(height: UIScreen.main.bounds.height/12, alignment: .center)
    }
}

struct ParkSingleComp_Previews: PreviewProvider {
    static var previews: some View {
        ParkSingleComp(parkName: "P1-01", parkCategory: "VIP", vehicleNumber: "CAP-9080", reserved: false, booked: false, remainTime: "12")
    }
}
