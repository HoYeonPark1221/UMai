
import SwiftUI

struct PersonView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("backgroundGray")
                    .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 25) {
                        ProfileHeaderBlock()
                            .padding(.horizontal)
                        
                        
                        
                        // Action Buttons
                        VStack(spacing: 12) {
                            Button(action: {
                                // Edit Profile action
                            }) {
                                HStack {
                                    Text("Edit Profile")
                                        .fontWeight(.semibold)
                                    Spacer()
                                    Image(systemName: "square.and.pencil")
                                }
                                .foregroundColor(Color("lightRed"))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(15)
                            }
                            
                            Button(action: {
                                // Logout action
                            }) {
                                HStack {
                                    Text("Logout")
                                        .fontWeight(.semibold)
                                    Spacer()
                                    Image(systemName: "arrow.right.circle")
                                }
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("lightRed"))
                                .cornerRadius(15)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                    }
                    .padding(.top)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ProfileHeaderBlock: View {
    @State private var showingShareSheet = false
    
    var body: some View {
        VStack(spacing: 25) {
            // Profile Header
            HStack(alignment: .center) {
                // Profile Info
                VStack(alignment: .leading, spacing: 5) {
                    Text("Winter")
                        .font(.custom("DMSerifDisplay-Regular", size: 28))
                        .foregroundColor(.black)
                    Text("The Clean Aristocrat")
                        .font(.custom("DMSerifDisplay-Regular", size: 16))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Profile Image
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 60, height: 60)
            }
            .padding(.horizontal, 25)
            .padding(.top, 25)
            
            // BTI Card
            BtiCardBlock()
            
            // Share Button
            Button(action: {
                showingShareSheet = true
            }) {
                VStack(alignment: .center) {
                    Text("Share your MBFP!")
                        .foregroundColor(Color("White"))
                        .font(.custom("DMSerifDisplay-Italic", size: 20))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                }
                .frame(width: 200, alignment: .leading)
                .padding()
                .background(Color("lightRed"))
                .cornerRadius(12)
            }
            .padding(.horizontal, 8)
            
            // Additional Info
            HStack(spacing: 15) {
                InfoBox(title: "MBTI", value: "ENFJ")
                InfoBox(title: "즐겨찾기", value: "6")
            }
            .padding(.horizontal, 25)
            .padding(.bottom, 25)
        }
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.05), radius: 15)
        .sheet(isPresented: $showingShareSheet) {
            ShareBTIView(
                btiType: "CTSP",
                description: "깔끔한 맛의 귀족"
            )
        }
    }
}

struct BtiCardBlock: View {
    var body: some View {
        ZStack {
            // 배경 패턴
            GeometryReader { geometry in
                Path { path in
                    let width = geometry.size.width
                    let height = geometry.size.height
                    
                    path.move(to: CGPoint(x: 0, y: height * 0.4))
                    path.addCurve(
                        to: CGPoint(x: width, y: height * 0.6),
                        control1: CGPoint(x: width * 0.4, y: height * 0.2),
                        control2: CGPoint(x: width * 0.6, y: height)
                    )
                    path.addLine(to: CGPoint(x: width, y: height))
                    path.addLine(to: CGPoint(x: 0, y: height))
                    path.closeSubpath()
                }
                .fill(LinearGradient(
                    colors: [Color("lightRed").opacity(0.3), Color("lightRed").opacity(0.1)],
                    startPoint: .top,
                    endPoint: .bottom
                ))
            }
            
            // 메인 콘텐츠
            VStack(spacing: 20) {
                Text("CTSP")
                    .font(.custom("DMSerifDisplay-Regular", size: 52))
                    .foregroundColor(Color("lightRed"))
                
                Text("깔끔한 맛의 귀족")
                    .font(.custom("DMSerifDisplay-Regular", size: 20))
                    .foregroundColor(.gray)
                
                HStack(spacing: 12) {
                    TagView(text: "깔끔한")
                    TagView(text: "보수적")
                }
                HStack(spacing: 12) {
                    TagView(text: "말캉한 식감")
                    TagView(text: "품격 중시")
                }
            }
            .padding(.vertical, 40)
        }
        .frame(height: 300)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.horizontal, 25)
    }
}

struct TagView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(Color("lightRed"))
            .padding(.horizontal, 15)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(Color("lightRed").opacity(0.1))
            )
    }
}

struct InfoBox: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

// BTI 타입과 설명
let tasteBTIClasses = [
    "FAHV": "The Spice Hunter 매운 음식을 정복하는 맛 사냥꾼",
    "FAHP": "Fine Flavor Explorer 프리미엄 자극의 모험가",
    "FASV": "Bouncy Bargain Seeker 부드럽게 만나는 가성비 탐험가",
    "FASP": "Silk Road Pioneer 부드러운 맛의 럭셔리 여행자",
    "FTHV": "Crispy Value Guardian 바삭한 맛의 가성비 수호자",
    "FTHP": "Traditional Spice Artisan 전통 있는 매운맛의 장인",
    "FTSV": "Soft Spice Economist 부드러운 자극의 실속파",
    "FTSP": "Premium Comfort Master 고급스러운 편안함의 달인",
    "CAHV": "Fresh Adventure Scout 깔끔한 맛의 모험 스카우트",
    "CAHP": "Pure Luxury Wanderer 깔끔한 맛의 고급 유랑가",
    "CASV": "Smooth Deal Hunter 부드러운 가성비의 사냥꾼",
    "CASP": "Elegant Taste Curator 우아한 맛의 큐레이터",
    "CTHV": "Classic Value Expert 전통적 가치의 전문가",
    "CTHP": "Noble Taste Keeper 고귀한 맛의 수호자",
    "CTSV": "Gentle Savings Guru 부드러운 실속의 구루",
    "CTSP": "The Clean Aristocrat 깔끔한 맛의 귀족"
]

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}

