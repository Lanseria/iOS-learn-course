//
//  HexagonView.swift
//  FlcMap
//
//  Created by 张超 on 2022/9/11.
//

import SwiftUI

struct HexagonView: View {
    @State var appear = false
    
    var body: some View {
        Canvas {
        content, size in
//            content.draw(Text("设计代码"), at: CGPoint(x: 50, y: 20))
//            content.fill(Path(ellipseIn: CGRect(x: -100, y: 100, width: size.width, height: size.height)), with: .color(.pink))
            content.draw(Image("Blob 1"), in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            content.draw(Image(systemName: "seal.fill"), in: CGRect(x: 50, y: 50, width: size.width/2, height: size.height/2))
        }
        .frame(width: 200  , height: 200, alignment: .center)
        .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
        .rotationEffect(.degrees(appear ? 360 : 0))
        .onAppear{
            withAnimation(
                .linear(duration: 10)
                .repeatForever(autoreverses: true)) {
                appear = true
            }
        }
    }
}

struct HexagonView_Previews: PreviewProvider {
    static var previews: some View {
        HexagonView()
    }
}
