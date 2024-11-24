//
//  HomeView.swift
//  UMai
//
//  Created by PeterPark on 10/8/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = "MSFP"
    let tabs = ["MSFP", "Local", "Popular"]
    
    var body: some View {
        ZStack {
            Color("backgroundGray")
                .ignoresSafeArea(.all)
            
            
            ScrollView(.vertical, showsIndicators: false)
            {
                //header
                VStack {
                    //app name
                    HStack() {
                        Button(action: {
                            //
                        }) {
                            Image(systemName: "line.3.horizontal")
                                .resizable()
                                .frame(width: 17, height: 17)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Text("Umai")
                            .font(.custom("DMSerifDisplay-Regular", size: 34))
                        
                        Spacer()
                        
                        Button(action: {
                            //
                        }) {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                }
                
                //맛BTI
                VStack(spacing: 30) {
                    RoundedRectangle(cornerRadius: 23)
                        .fill(Color("lightRed"))
                        .frame(width: 367, height: 185)
                        .overlay(
                            HStack {
                                VStack {
                                    Text("CTSP") //Liquefier //DMSerifDisplay-Italic //DMSerifDisplay-Regular
                                        .foregroundColor(Color("White"))
                                        .font(.custom("DMSerifDisplay-Regular", size: 34))
                                        .offset(x: -60, y: -24)
                                    
                                    Text("The food is familiar and upscale, with an emphasis on quality.")
                                        .font(.custom("DMSerifDisplay-Italic", size: 14))
                                        .frame(width: 200)
                                        .foregroundColor(Color("backgroundGray"))
                                }
                                
                                Image("deopbap")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                            }
                        )
                }
                
                // 텝 세션들
                VStack {
                    
                    //추천 클씨
                    HStack {
                        Text("Recomend")
                            .font(.custom("DMSerifDisplay-Regular", size: 27))
                        
                        Spacer()
                    }
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(tabs, id: \.self) { tab in
                                RoundedRectangle(cornerRadius: 23)
                                    .fill(selectedTab == tab ? Color("lightRed") : Color("White"))
                                    .frame(width: 100, height: 38)
                                    .overlay(
                                        Text(tab)
                                            .foregroundColor(selectedTab == tab ? Color("White") : Color("lightRed"))
                                            .font(.custom("DMSerifDisplay-Regular", size: 20))
                                    )
                                    .onTapGesture {
                                        selectedTab = tab
                                    }
                            }
                        }
                        .padding(.leading, 34)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            switch selectedTab {
                            case "MSFP":
                                FoodCard(title: "Hot Pot ", price: "$25.00", rating: "4.8")
                                FoodCard(title: "ramen", price: "$18.00", rating: "4.9")
                                FoodCard(title: "deopbap", price: "$15.00", rating: "4.7")
                            case "Local":
                                FoodCard(title: "Omurice", price: "$25.00", rating: "4.8")
                                FoodCard(title: "rice cake", price: "$18.00", rating: "4.9")
                                FoodCard(title: "Sashimi", price: "$15.00", rating: "4.7")
                            case "Popular":
                                FoodCard(title: "Yakisoba", price: "$25.00", rating: "4.8")
                                FoodCard(title: "Yukhoe", price: "$18.00", rating: "4.9")
                                FoodCard(title: "Sushi", price: "$15.00", rating: "4.7")
                            default:
                                EmptyView()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct FoodCard: View {
    let title: String
    let price: String
    let rating: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(title)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180)
                .padding(.top, 8)
            
            Text(title)
                .font(.custom("DMSerifDisplay-Regular", size: 18))
                .padding(.top, 8)
            
            HStack {
                Text(price)
                    .font(.custom("DMSerifDisplay-Regular", size: 16))
                    .foregroundColor(.gray)
                
                Spacer()
                
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text(rating)
                    .font(.custom("DMSerifDisplay-Regular", size: 14))
            }
        }
        .frame(width: 160)
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .padding(.top)
    }
}

#Preview {
    HomeView()
}





































//
//import SwiftUI
//
//struct HomeView: View {
//    @State private var userInfo: UserResponse? = nil
//    @State private var isLoading: Bool = false
//    @State private var errorMessage: String? = nil
//    
//    var body: some View {
//        ZStack {
//            Color("backgroundGray")
//                .ignoresSafeArea(.all)
//            
//            ScrollView(.vertical, showsIndicators: false) {
//                //header
//                VStack {
//                    //app name
//                    HStack() {
//                        Button(action: {
//                            //
//                        }) {
//                            Image(systemName: "line.3.horizontal")
//                                .resizable()
//                                .frame(width: 17, height: 17)
//                                .foregroundColor(.black)
//                        }
//                        
//                        Spacer()
//                        
//                        Text("Umai")
//                            .font(.custom("DMSerifDisplay-Regular", size: 34))
//                        
//                        Spacer()
//                        
//                        Button(action: {
//                            // 유저 정보 가져오기
//                            fetchUserData()
//                        }) {
//                            if isLoading {
//                                ProgressView()
//                                    .frame(width: 20, height: 20)
//                            } else {
//                                Image(systemName: "person.fill")
//                                    .resizable()
//                                    .frame(width: 20, height: 20)
//                                    .foregroundColor(.black)
//                            }
//                        }
//                    }
//                    .padding()
//                    
//                    // 유저 정보가 있다면 표시
//                    if let user = userInfo?.data {
//                        Text("\(user.firstName) \(user.lastName)")
//                            .font(.custom("DMSerifDisplay-Regular", size: 16))
//                    }
//                    
//                    // 에러 메시지가 있다면 표시
//                    if let error = errorMessage {
//                        Text(error)
//                            .foregroundColor(.red)
//                            .font(.caption)
//                    }
//                }
//                
//                // 기존 코드 계속...
//                //맛BTI
//                VStack(spacing: 30) {
//                    RoundedRectangle(cornerRadius: 23)
//                        .fill(Color("lightRed"))
//                        .frame(width: 367, height: 185)
//                        .overlay(
//                            HStack {
//                                VStack {
//                                    Text("CTSP")
//                                        .foregroundColor(Color("White"))
//                                        .font(.custom("DMSerifDisplay-Regular", size: 34))
//                                        .offset(x: -60, y: -24)
//                                    
//                                    Text("The food is familiar and upscale, with an emphasis on quality.")
//                                        .font(.custom("DMSerifDisplay-Italic", size: 14))
//                                        .frame(width: 200)
//                                        .foregroundColor(Color("backgroundGray"))
//                                }
//                                
//                                Image("deopbap")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 100, height: 100)
//                            }
//                        )
//                }
//                
//                // 나머지 기존 코드...
//            }
//        }
//        .task {
//            // 뷰가 로드될 때 자동으로 유저 정보 가져오기
//            await fetchUserData()
//        }
//    }
//    
//    // 유저 정보를 가져오는 함수
//    private func fetchUserData() {
//        Task {
//            isLoading = true
//            do {
//                userInfo = try await NetworkManager.shared.fetchUser(id: 2)
//                errorMessage = nil
//            } catch {
//                errorMessage = "Failed to load user info"
//                debugPrint("Error fetching user:", error)
//            }
//            isLoading = false
//        }
//    }
//}
//
//#Preview {
//    HomeView()
//}
