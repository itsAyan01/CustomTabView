//
//  DashboardView.swift
//  FinanceAppDesign
//
//  Created by Dr.Mac on 17/11/22.
//

import SwiftUI

enum Tab {
    case homeView
    case detailView
    case profileView
    case notificationView
}

struct DashboardView: View {
    
    @State var currentView: Tab = .homeView
    
    var body: some View {
        ZStack {
            BackgroundView()
            showView
            dashboardBottomView
        }
    }
}


extension DashboardView {
    
    var showView: some View {
        VStack {
            switch currentView {
            case .homeView:
                HomeView(currentView: $currentView)
                    .transition(.scale)
                
            case .detailView:
                DetailView()
                    .transition(.scale)
                
            default :
                EmptyView()
            }
        }
    }
    
    var dashboardBottomView: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                BottomImageView(imageName: "house", currentView: $currentView, selectedTab: .homeView)
                    
                
                Spacer()
                BottomImageView(imageName: "bolt", currentView: $currentView, selectedTab: .detailView)
                
                Spacer()
                BottomImageView(imageName: "person", currentView: $currentView, selectedTab: .profileView)
                
                Spacer()
                BottomImageView(imageName: "bell", currentView: $currentView, selectedTab: .notificationView)
                
                Spacer()
            }
            .padding(.top, 30)
            .background(Color.firstBG.ignoresSafeArea())
        }
    }
    
    
}



struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

struct BottomImageView: View {
    
    @State var imageName: String
    @Binding var currentView: Tab
    var selectedTab: Tab
        
    var body: some View {
        ZStack {
            Image(systemName: currentView == selectedTab ? imageName + ".fill" : imageName)
                .resizable()
                .foregroundColor(.white)
                .frame(width: 22, height: 22)
                .onTapGesture {
                    withAnimation(.spring()) {
                        currentView = selectedTab
                    }
                }
                .padding(14)
                .background(currentView == selectedTab ? LinearGradient(colors: [Color.lightGreen, .darkGreen], startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(colors: [Color.firstBG, Color.firstBG], startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(Circle())
                .transition(.scale)
        }
    }
}
