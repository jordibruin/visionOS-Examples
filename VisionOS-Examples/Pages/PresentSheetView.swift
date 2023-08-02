//
//  PresentSheetView.swift
//  VisionOS-Examples
//
//  Created by Jordi Bruin on 02/08/2023.
//

import SwiftUI

struct PresentSheetView: View {
    
    @State var showSheet = false
    @State var showSecondSheet = false
    
    var body: some View {
        ZStack {
            Button {
                showSheet.toggle()
            } label: {
                Text("Present Sheet")
            }
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                Button {
                    showSecondSheet.toggle()
                } label: {
                    Text("Present Another Sheet")
                }
            
                Button {
                    showSheet.toggle()
                } label: {
                    Text("Close Sheet")
                }
            }
            .padding(50)
            .sheet(isPresented: $showSecondSheet) {
                VStack {
                    Text("Sheet Number 2")
                
                    Button {
                        showSecondSheet.toggle()
                    } label: {
                        Text("Close Sheet")
                    }
                }
                .padding(50)
            }
        }
    }
}

#Preview {
    PresentSheetView()
}
