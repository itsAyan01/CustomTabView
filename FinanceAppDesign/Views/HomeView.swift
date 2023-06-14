//
//  HomeView.swift
//  FinanceAppDesign
//
//  Created by Dr.Mac on 17/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var currentView: Tab
    @State var cardSlide: Bool = false
    @State var cardAnimation: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                ScrollView {
                    topView
                    if cardSlide {
                        cardView
                            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
                    }
                    balanceView
                    upcomingPayment
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation {
                            cardAnimation = true
                        }
                        
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            cardSlide = true
                        }
                    }
                }
            }
            
        }
    }
}

extension HomeView {

    var topView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                largeBoldText(text: "Ayan Ansari")
                
                Text("Welcome Back")
                    .foregroundColor(.gray)
            }
            Spacer()
            Image("personImage")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .onTapGesture {
                    withAnimation {
                        currentView = .profileView
                    }
                }
        }
        .padding()
    }
    
    var cardView: some View {
        VStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(LinearGradient(colors: [.lightGreen, .darkGreen], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(maxWidth: .infinity)
                .frame(height: 250)
                .shadow(radius: 12)
                .background(
                    VStack {
                        Spacer()
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color.darkGreen.opacity(0.8))
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .rotationEffect(Angle(degrees: cardAnimation ? 10 : 0), anchor: .topLeading)
                            .padding()
                            .shadow(radius: 20)
                            .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
                    }
                )
                .overlay(
                    cardText
                )
                .background(
                    VStack {
                        Spacer()
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color.darkGreen.opacity(0.6))
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .rotationEffect(Angle(degrees: cardAnimation ? 20 : 0), anchor: .topLeading)
                            .padding()
                            .padding(.horizontal, 30)
                            .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
                    }
                )
                
        }
        .padding()
        .shadow(radius: 10)
    }
    
    var cardText: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "esim")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 60, height: 45)
                    .opacity(0.8)
                    .padding()
                
                Spacer()
            }
            
            Text("4526 1242 9941 2365")
                .font(.title3)
                .fontWeight(.semibold)
                .kerning(2)
                .foregroundColor(.white)
                .padding(.horizontal)
                
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Card Holder")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                    
                    Text("Ayan Ansari")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .underline()
                }
                Spacer()
                VStack(alignment: .center) {
                    HStack(spacing: 0) {
                        Circle()
                            .fill(.red)
                            .frame(width: 50, height: 50)
                        
                        Circle()
                            .fill(.orange.opacity(0.7))
                            .frame(width: 50, height: 50)
                            .offset(x: -15)
                    }
                    
                    Text("Mastercard")
                        .font(.callout)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    
                }
                
            }
            .padding()
        }
    }
    
    var balanceView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Balance")
                    .foregroundColor(.white.opacity(0.8))

                Spacer()
            }
            
            HStack {
                largeBoldText(text: "$100.11")
                Spacer()
                Capsule()
                    .fill(LinearGradient(colors: [.lightGreen, .darkGreen], startPoint: .leading, endPoint: .trailing))
                    .frame(width: 60, height: 30)
                    .overlay(
                        HStack {
                            Image(systemName: "arrow.down")
                                .font(.caption.weight(.semibold))
                                .foregroundColor(.white)
                            Text("5.9")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    )
                    .shadow(radius: 12)
            }

        }
        .padding()
        .padding(.top)
    }
    
    var upcomingPayment: some View {
        HStack {
            ElementBox(imageName: "suitcase", label: "Salary", des: "Belong Interactive", rs: "$200")
            ElementBox(imageName: "paypal", label: "Paypal", des: "Freelance Payment", rs: "$55.60")
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(currentView: .constant(.profileView))
    }
}


struct ElementBox: View {
    
    var imageName: String
    var label: String
    var des: String
    var rs: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(imageName)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 34, height: 34)
                .foregroundColor(.white)
                .padding()
            
            Text(label)
                .font(.title3)
                .foregroundColor(.white)
                .fontWeight(.semibold)
            
            Text(des)
                .font(.caption)
                .foregroundColor(.white)
            
            Text(rs)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        .padding()
        .frame(width: 170)
        .background(
            RoundedRectangle(cornerRadius: 34)
                .fill(LinearGradient(stops: [.init(color: .secondBG, location: 0.01),
                                             .init(color: .firstBG, location: 0.4)
                                            ], startPoint: .leading, endPoint: .trailing))
        )
    }
}
