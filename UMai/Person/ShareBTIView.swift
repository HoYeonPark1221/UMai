// ShareBTIView.swift
import SwiftUI

struct ShareBTIView: View {
    let btiType: String
    let description: String
    
    var body: some View {
        VStack(spacing: 30) {
            // 타이틀
            Text("Share your MBFP!")
                .foregroundColor(Color("lightRed"))
                .font(.custom("DMSerifDisplay-Italic", size: 20))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 20)
            
            // BTI Card Block
            ShareBTICardBlock()
                .padding(.horizontal)
            
            Text("Or")
                .foregroundColor(Color("lightRed"))
                .font(.custom("DmSerifDisplay-Italic", size: 18))
            // QR Code Section
            VStack(spacing: 12) {
                Image(systemName: "qrcode")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundColor(Color("lightRed"))
                
                Text("Scan to see profile")
                    .font(.custom("DMSerifDisplay-Regular", size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 30)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.05), radius: 5)
            .padding(.horizontal)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("backgroundGray"))
    }
}

// ShareBTICardBlock - BtiCardBlock의 복사본
struct ShareBTICardBlock: View {
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
            VStack() {
                HStack {

                    Text("The Clean Aristocrat")
                        .font(.custom("DMSerifDisplay-Regular", size: 20))
                    .foregroundColor(.gray)
                    
                    Spacer()
                }
                .padding(.leading)
                
                Text("CTSP")
                    .font(.custom("DMSerifDisplay-Regular", size: 52))
                    .foregroundColor(Color("lightRed"))

                Spacer()
//                Text("깔끔한 맛의 귀족")
//                    .font(.custom("DMSerifDisplay-Regular", size: 20))
//                    .foregroundColor(.gray)
//                
//                HStack(spacing: 12) {
//                    ShareTagView(text: "깔끔한")
//                    ShareTagView(text: "보수적")
//                }
//                HStack(spacing: 12) {
//                    ShareTagView(text: "말캉한 식감")
//                    ShareTagView(text: "품격 중시")
//                }
            }
            .padding(.vertical, 40)
        }
        .frame(height: 300)
        .background(Color.white)
        .cornerRadius(30)
    }
}

// ShareTagView - TagView의 복사본
struct ShareTagView: View {
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

// QR 코드 생성 함수
extension ShareBTIView {
    func generateQRCode(from string: String) -> UIImage {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview {
    ShareBTIView(btiType: "CTSP", description: "")
}
