//
//  SubViews.swift
//  FinanceAppDesign
//
//  Created by Dr.Mac on 17/11/22.
//

import SwiftUI

struct SubViews: View {
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                largeBoldText(text: "Ayan Ansari")
            }
        }
    }
}

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Color.firstBG
                .ignoresSafeArea()
        }
    }
}

struct largeBoldText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 34, weight: .bold, design: .rounded))
            .foregroundColor(.white)
    }
}

struct SubViews_Previews: PreviewProvider {
    static var previews: some View {
        SubViews()
    }
}
