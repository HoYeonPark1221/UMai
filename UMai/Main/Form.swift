//
//  form.swift
//  UMai
//
//  Created by PeterPark on 10/15/24.
//

import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let text: String
}

struct Form: View {
    // Example list of 60 questions with custom questions
    let questions: [Question] = [
        Question(text: "1. 매운 음식을 즐기십니까?"),
        Question(text: "2. 짠 음식에 대한 선호도가 높으신가요?"),
        // Add the rest of your custom questions here
    ] + Array(3...60).map { Question(text: "\($0).") } // Add more questions as needed
    
    // State to track the current page and selected answers
    @State private var currentPage = 0
    @State private var selectedAnswers = Array(repeating: -1, count: 60) // -1 means no answer selected
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        // 제목
                        HStack {
                            Spacer()
                            Text("맛BTI")
                                .font(.largeTitle)
                                .bold()
                                .padding(.top, 50)
                                .padding(.bottom, 20)
                                .id("TOP") // ID to scroll to the top of the page
                            Spacer()
                        }
                        .foregroundColor(Color("deepRed"))
                        
                        // 설문조사 View
                        TypeSelection()
                    }
                    .padding()
                }
            }
            .background(Color("lightbeige"))
        
            VStack(spacing: 16) {
                Spacer()
                PagePicker()
                    .padding(10)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

#Preview {
    Form()
}


struct PagePicker: View {
    @State private var currentPage = 0
    @State private var selectedAnswers = Array(repeating: -1, count: 60) // -1 means
    var body: some View {
        HStack {
            Button(action: {
                if currentPage > 0 {
                    currentPage -= 1
                }
            }) {
                Image(systemName: "arrow.left") // Arrow shape for Previous
                    .padding()
                    .background(Color(red: 191 / 255, green: 49 / 255, blue: 49 / 255)) // Custom red color
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(currentPage == 0) // Disable button if on the first page
            
            Spacer()
            
            Button(action: {
                if currentPage < 2 {
                    currentPage += 1
                }
            }) {
                Image(systemName: "arrow.right") // Arrow shape for Next
                    .padding()
                    .background(Color(red: 191 / 255, green: 49 / 255, blue: 49 / 255)) // Custom red color
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(currentPage == 2) // Disable button if on the last page
        }
        .padding(.top, 20)
    }
}

struct TypeSelection: View {
    let questions: [Question] = [
        Question(text: "1. 매운 음식을 즐기십니까?"),
        Question(text: "2. 짠 음식에 대한 선호도가 높으신가요?"),
        // Add the rest of your custom questions here
    ] + Array(3...60).map { Question(text: "\($0).") } // Add more questions as needed
    
    // State to track the current page and selected answers
    @State private var currentPage = 0
    @State private var selectedAnswers = Array(repeating: -1, count: 60) // -1 means
    var body: some View {
        ForEach(currentPage * 20..<min((currentPage + 1) * 20, questions.count), id: \.self) { index in
            VStack(alignment: .leading, spacing: 10) {
                Text(questions[index].text)
                    .font(.headline)
                    .foregroundColor(Color("deepRed"))
                
                HStack {
                    Text("Strongly Agree")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    // Answer buttons
                    HStack(spacing: 10) {
                        ForEach(0..<5, id: \.self) { answerIndex in
                            Button(action: {
                                selectedAnswers[index] = answerIndex
                            }) {
                                Circle()
                                    .fill(selectedAnswers[index] == answerIndex ? Color("lightRed") : Color.gray.opacity(0.2)) // Custom red color
                                    .frame(width: 30, height: 30)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Text("Strongly Disagree")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}
