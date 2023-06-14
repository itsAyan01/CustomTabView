//
//  DetailView.swift
//  FinanceAppDesign
//
//  Created by Dr.Mac on 17/11/22.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                ScrollView {
                    topView
                    expensesView
                    
                }
            }
        }
    }
}


extension DetailView {
    
    var topView: some View {
        VStack {
            Text("Saved This Month")
                .foregroundColor(.white.opacity(0.8))
            
            largeBoldText(text: "$28.09")
        }
    }
    
    var expensesView: some View {
        VStack {
            RowView(imageName: "car", heading: "Taxi", des: "Taxi payment for office", amount: "$24")
            
            RowView(imageName: "network", heading: "Internet", des: "internet bill payment", amount: "$10")
            
            RowView(imageName: "n.square.fill", heading: "Netflix", des: "Paid for netfilix subscription", amount: "$4")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(
                    LinearGradient(stops: [
                        .init(color: .secondBG, location: 0),
                        .init(color: .firstBG, location: 0.5)
                    ], startPoint: .leading, endPoint: .trailing)
                )
                .padding()
        )
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

struct RowView: View {
    
    var imageName: String
    var heading: String
    var des: String
    var amount: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text(heading)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Spacer()
                }
                
                Text(des)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding()
            
            Text(amount)
                .font(.title3.bold())
                .foregroundColor(.white)
            
        }
        .padding()
    }
    
}
