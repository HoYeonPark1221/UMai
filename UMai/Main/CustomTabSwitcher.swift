//
//  CustomTabSwitcher.swift
//  UMai
//
//  Created by PeterPark on 11/20/24.
//

import SwiftUI

struct CustomTabSwitcher: View {
    @State private var currentTab: CustomTab = .MBTI
    var tabs: [CustomTab]
    
    var body: some View {
        ZStack {
            Color("backgroundGray")
                .ignoresSafeArea(.all)
            
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(tabs, id:\.self) { tab in
                            VStack {
                                // red bar
                                Rectangle()
                                    .frame(height: 6)
                                    .foregroundColor(tab == currentTab ? Color("deepRed") : .clear)
                                
                                //tab
                                Button(action: {
                                    currentTab = tab
                                }, label: {
                                    Text(tab.rawValue)
                                        .font(.system(size: 16, weight: .bold))
                                    
                                    
                                })
                                .frame(height: 30)
                            }
                            
                        }
                    }
                }
                .foregroundColor(.white)
            }
        }
    }
}

enum CustomTab: String {
    case MBTI = "CTSP"
    case Local = "Local"
    case Popular = "Populars"
}

#Preview {
    CustomTabSwitcher(tabs: [.MBTI, .Local, .Popular])
}
