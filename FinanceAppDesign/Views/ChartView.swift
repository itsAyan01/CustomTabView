//
//  ChartView.swift
//  FinanceAppDesign
//
//  Created by Dr.Mac on 17/11/22.
//

import SwiftUI

struct ChartView: View {
    
    var chartData: [CGFloat] = [88.2,43,77,87,33,99,65,34]
    
    var body: some View {
        
        ZStack {
            BackgroundView()
            
            VStack {
                HStack(alignment: .bottom) {
                    ForEach(0..<6, id: \.self) { index in
                        Rectangle()
                            .fill(.red)
                            .frame(width: 20, height: chartData[index])
                    }
                    
                }
            }
        }
        
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
