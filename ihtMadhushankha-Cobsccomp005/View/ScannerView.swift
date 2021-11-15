//
//  ScannerView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-15.
//

import SwiftUI

struct ScannerView: View {
    @ObservedObject var viewModel = ScannerViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Binding var parkkId : String
    let userId = UserDefaults.standard.string(forKey: "userId")
    @State private var isCheckParkId = false
    
    var body: some View {
        VStack{
            ZStack {
                QrCodeScannerView()
                    .found(r: self.viewModel.onFoundQrCode)
                    .torchLight(isOn: self.viewModel.torchIsOn)
                    .interval(delay: self.viewModel.scanInterval)
                VStack {
                    VStack {
                        Text("Keep scanning for QR-codes")
                            .font(.subheadline)
                        Text(self.viewModel.lastQrCode)
                            .bold()
                            .lineLimit(5)
                            .padding()
                    }
                    .padding(.vertical, 20)
                    
                    Spacer()
                    HStack {
                        Button(action: {
                            self.viewModel.torchIsOn.toggle()
                        }, label: {
                            Image(systemName: self.viewModel.torchIsOn ? "bolt.fill" : "bolt.slash.fill")
                                .imageScale(.large)
                                .foregroundColor(self.viewModel.torchIsOn ? Color.yellow : Color.blue)
                                .padding()
                        })
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    
                }.padding()
            }
            if(self.viewModel.lastQrCode == ""){
                EmptyView()
            }else {
                ButtonView(title: "Confirm Reservation",
                           function: {
                    if(parkkId == self.viewModel.lastQrCode){
                        viewModel.updateReserveDocument(documentId: self.viewModel.lastQrCode, userId: userId ?? "23ew")
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        isCheckParkId = true
                    }
                },width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45).padding(.top)
                    .alert(isPresented: $isCheckParkId) { () -> Alert in
                        Alert(title: Text("You check Differnet Park. Please Try again."))
                    }
            }
            ButtonView(title: "Cancel QR View",
                       function: {
                presentationMode.wrappedValue.dismiss()
            },width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
                .padding(.vertical)
        }
        
    }
}

struct ScannerView_Previews: PreviewProvider {
    
    @State static var parkIds: String = ""
    
    
    static var previews: some View {
        ScannerView(parkkId: $parkIds)
    }
}

