
import SwiftUI

struct BTICardsView: View {
    // Grid columns 정의
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(btiCards) { card in
                    BTICard(model: card)
                }
            }
            .padding()
        }
        .background(Color("backgroundGray"))
    }
}

// BTI 카드 데이터 모델
struct BTICardModel: Identifiable {
    let id = UUID()
    let type: String
    let title: String
    let description: String
    let tags: [String]
    let gradientColors: [Color]
    let patternType: PatternType
}

// 패턴 타입 열거형
enum PatternType {
    case dynamic    // FA 타입용 - 다이나믹한 패턴
    case elegant    // FT 타입용 - 우아한 패턴
    case minimal    // CA 타입용 - 미니멀한 패턴
    case classic    // CT 타입용 - 클래식한 패턴
}

// BTI 카드 뷰
struct BTICard: View {
    let model: BTICardModel
    
    var body: some View {
        ZStack {
            // Background Pattern
            Group {
                switch model.patternType {
                case .dynamic: DynamicPattern()
                case .elegant: ElegantPattern()
                case .minimal: MinimalPattern()
                case .classic: ClassicPattern()
                }
            }
//            .fill(LinearGradient(
//                colors: model.gradientColors,
//                startPoint: .topLeading,
//                endPoint: .bottomTrailing
//            ))
            
            // Content
            VStack(spacing: 15) {
                // BTI Type
                Text(model.type)
                    .font(.custom("DMSerifDisplay-Regular", size: 32))
                    .foregroundColor(.white)
                
                // Title
                Text(model.title)
                    .font(.custom("DMSerifDisplay-Regular", size: 16))
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                
                // Description
                Text(model.description)
                    .font(.custom("DMSerifDisplay-Regular", size: 12))
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                
                // Tags
                FlexibleTagsView(tags: model.tags)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 10)
        }
        .frame(height: 250)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 10)
    }
}

// 패턴 구현
struct DynamicPattern: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        path.move(to: CGPoint(x: 0, y: height * 0.3))
        for i in 0...4 {
            let x = width * CGFloat(i) / 4
            let y = height * (0.3 + CGFloat(i % 2) * 0.3)
            path.addLine(to: CGPoint(x: x, y: y))
        }
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.closeSubpath()
        return path
    }
}

struct ElegantPattern: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        path.move(to: CGPoint(x: 0, y: height * 0.4))
        path.addCurve(
            to: CGPoint(x: width, y: height * 0.6),
            control1: CGPoint(x: width * 0.4, y: height * 0.2),
            control2: CGPoint(x: width * 0.6, y: height)
        )
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.closeSubpath()
        return path
    }
}

struct MinimalPattern: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        path.move(to: CGPoint(x: 0, y: height * 0.5))
        for i in 0...3 {
            let x1 = width * CGFloat(i) / 3
            let x2 = width * CGFloat(i + 1) / 3
            path.addQuadCurve(
                to: CGPoint(x: x2, y: height * 0.5),
                control: CGPoint(x: (x1 + x2) / 2, y: height * 0.3)
            )
        }
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.closeSubpath()
        return path
    }
}

struct ClassicPattern: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        path.move(to: CGPoint(x: 0, y: height * 0.4))
        for i in 0...2 {
            let x1 = width * CGFloat(i) / 2
            let x2 = width * CGFloat(i + 1) / 2
            path.addQuadCurve(
                to: CGPoint(x: x2, y: height * 0.4),
                control: CGPoint(x: (x1 + x2) / 2, y: height * 0.2)
            )
        }
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.closeSubpath()
        return path
    }
}

// 태그 뷰
struct FlexibleTagsView: View {
    let tags: [String]
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                ForEach(0..<min(2, tags.count), id: \.self) { index in
                    TagView(text: tags[index])
                }
            }
            if tags.count > 2 {
                HStack(spacing: 8) {
                    ForEach(2..<min(4, tags.count), id: \.self) { index in
                        TagView(text: tags[index])
                    }
                }
            }
        }
    }
}

struct TagView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Capsule().fill(.white.opacity(0.2)))
    }
}

// BTI 카드 데이터
let btiCards: [BTICardModel] = [
    // F(자극적) + A(모험적) 그룹
    BTICardModel(
        type: "FAHV",
        title: "The Spice Hunter",
        description: "매운 음식을 정복하는 맛 사냥꾼",
        tags: ["자극적인", "모험적인", "딱딱한", "가성비"],
        gradientColors: [Color.red.opacity(0.7), Color.orange.opacity(0.4)],
        patternType: .dynamic
    ),
    BTICardModel(
        type: "FAHP",
        title: "Fine Flavor Explorer",
        description: "프리미엄 자극의 모험가",
        tags: ["자극적인", "모험적인", "딱딱한", "품격"],
        gradientColors: [Color.red.opacity(0.6), Color.pink.opacity(0.4)],
        patternType: .dynamic
    ),
    BTICardModel(
        type: "FASV",
        title: "Bouncy Bargain Seeker",
        description: "부드럽게 만나는 가성비 탐험가",
        tags: ["자극적인", "모험적인", "말캉한", "가성비"],
        gradientColors: [Color.orange.opacity(0.7), Color.yellow.opacity(0.4)],
        patternType: .dynamic
    ),
    BTICardModel(
        type: "FASP",
        title: "Silk Road Pioneer",
        description: "부드러운 맛의 럭셔리 여행자",
        tags: ["자극적인", "모험적인", "말캉한", "품격"],
        gradientColors: [Color.red.opacity(0.6), Color.orange.opacity(0.3)],
        patternType: .dynamic
    ),
    
    // F(자극적) + T(보수적) 그룹
    BTICardModel(
        type: "FTHV",
        title: "Crispy Value Guardian",
        description: "바삭한 맛의 가성비 수호자",
        tags: ["자극적인", "보수적인", "딱딱한", "가성비"],
        gradientColors: [Color.orange.opacity(0.6), Color.brown.opacity(0.3)],
        patternType: .elegant
    ),
    BTICardModel(
        type: "FTHP",
        title: "Traditional Spice Artisan",
        description: "전통 있는 매운맛의 장인",
        tags: ["자극적인", "보수적인", "딱딱한", "품격"],
        gradientColors: [Color.brown.opacity(0.6), Color.orange.opacity(0.3)],
        patternType: .elegant
    ),
    BTICardModel(
        type: "FTSV",
        title: "Soft Spice Economist",
        description: "부드러운 자극의 실속파",
        tags: ["자극적인", "보수적인", "말캉한", "가성비"],
        gradientColors: [Color.orange.opacity(0.5), Color.yellow.opacity(0.3)],
        patternType: .elegant
    ),
    BTICardModel(
        type: "FTSP",
        title: "Premium Comfort Master",
        description: "고급스러운 편안함의 달인",
        tags: ["자극적인", "보수적인", "말캉한", "품격"],
        gradientColors: [Color.brown.opacity(0.5), Color.orange.opacity(0.3)],
        patternType: .elegant
    ),
    
    // C(깔끔) + A(모험적) 그룹
    BTICardModel(
        type: "CAHV",
        title: "Fresh Adventure Scout",
        description: "깔끔한 맛의 모험 스카우트",
        tags: ["깔끔한", "모험적인", "딱딱한", "가성비"],
        gradientColors: [Color.blue.opacity(0.6), Color.mint.opacity(0.3)],
        patternType: .minimal
    ),
    BTICardModel(
        type: "CAHP",
        title: "Pure Luxury Wanderer",
        description: "깔끔한 맛의 고급 유랑가",
        tags: ["깔끔한", "모험적인", "딱딱한", "품격"],
        gradientColors: [Color.blue.opacity(0.5), Color.cyan.opacity(0.3)],
        patternType: .minimal
    ),
    BTICardModel(
        type: "CASV",
        title: "Smooth Deal Hunter",
        description: "부드러운 가성비의 사냥꾼",
        tags: ["깔끔한", "모험적인", "말캉한", "가성비"],
        gradientColors: [Color.cyan.opacity(0.6), Color.mint.opacity(0.3)],
        patternType: .minimal
    ),
    BTICardModel(
        type: "CASP",
        title: "Elegant Taste Curator",
        description: "우아한 맛의 큐레이터",
        tags: ["깔끔한", "모험적인", "말캉한", "품격"],
        gradientColors: [Color.teal.opacity(0.6), Color.blue.opacity(0.3)],
        patternType: .minimal
    ),
    
    // C(깔끔) + T(보수적) 그룹
    BTICardModel(
        type: "CTHV",
        title: "Classic Value Expert",
        description: "전통적 가치의 전문가",
        tags: ["깔끔한", "보수적인", "딱딱한", "가성비"],
        gradientColors: [Color.green.opacity(0.6), Color.mint.opacity(0.3)],
        patternType: .classic
    ),
    BTICardModel(
        type: "CTHP",
        title: "Noble Taste Keeper",
        description: "고귀한 맛의 수호자",
        tags: ["깔끔한", "보수적인", "딱딱한", "품격"],
        gradientColors: [Color.green.opacity(0.5), Color.teal.opacity(0.3)],
        patternType: .classic
    ),
    BTICardModel(
        type: "CTSV",
        title: "Gentle Savings Guru",
        description: "부드러운 실속의 구루",
        tags: ["깔끔한", "보수적인", "말캉한", "가성비"],
        gradientColors: [Color.mint.opacity(0.6), Color.green.opacity(0.3)],
        patternType: .classic
    ),
    BTICardModel(
        type: "CTSP",
        title: "The Clean Aristocrat",
        description: "깔끔한 맛의 귀족",
        tags: ["깔끔한", "보수적인", "말캉한", "품격"],
        gradientColors: [Color.teal.opacity(0.5), Color.mint.opacity(0.3)],
        patternType: .classic
    )
]

struct BTICardsView_Previews: PreviewProvider {
    static var previews: some View {
        BTICardsView()
    }
}
