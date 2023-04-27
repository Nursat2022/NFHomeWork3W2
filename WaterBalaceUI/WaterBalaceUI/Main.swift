//
//  Main.swift
//  WaterBalaceUI
//
//  Created by Nursat Sakyshev on 09.04.2023.
//

import SwiftUI

struct Main: View {
    var w = CGFloat(160)
    var h = CGFloat(160)
    let mx: Double = 2.4
    var ml: Double
    
    var level: Int
    
    init(ml: Double) {
        self.ml = ml
        self.level = Int(ceil(ml/mx * 100))
        progress1 = CGFloat(level) / CGFloat(100)
        progress2 = CGFloat(level) / CGFloat(100)
    }
    @State var progress1: CGFloat
    @State var phase1: CGFloat = 0.0
    
    @State var progress2: CGFloat
    @State var phase2: CGFloat = 0.9
    
    @State private var selectedTab = 1
    
    var text: String {
        switch level {
        case 0: return "Add your first drink for today"
        case 1...50: return "Great job!"
        default:
            return "Almost there!"
        }
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            VStack {
                let colors = Gradient(colors: [Color(red: 212/255, green: 225/255, blue: 248/255, opacity: 1), Color(red: 212/255, green: 225/255, blue: 248/255, opacity: 0)])
                
                Text("WATER BALANCE")
                    .font(.system(size: 17))
                    .italic()
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 5/255, green: 165/255, blue: 239/255))
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(LinearGradient(gradient: colors, startPoint: .top, endPoint: .bottom))
                        .frame(width: 358, height: 332)
                    
                    VStack(spacing: 56) {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 4)
                                .fill(.white)
                                .frame(width: w + 20, height: h + 20)
                            
                            Circle()
                                .stroke()
                                .fill(LinearGradient(gradient: colors, startPoint: .top, endPoint: .bottom))
                            
                                .frame(width: w + 10, height: h + 10)
                            
                            waterWave(progress: self.progress2, phase: self.phase2)
                                .fill(Color(red: 116/255, green: 194/255, blue: 238/255))
                                .frame(width: w, height: h, alignment: .center)
                            
                                .clipShape(Circle())
                                .onAppear() {
                                    withAnimation(Animation.linear(duration: 4).repeatForever(autoreverses: false)) {
                                        self.phase2 = .pi * 2
                                    }
                                }
                            
                            waterWave(progress: self.progress1, phase: self.phase1)
                                .fill(Color(red: 24/255, green: 171/255, blue: 253/255))
                                .frame(width: w, height: h, alignment: .center)
                            
                                .clipShape(Circle())
                                .onAppear() {
                                    withAnimation(Animation.linear(duration: 4).repeatForever(autoreverses: false)) {
                                        self.phase1 = .pi * 2
                                    }
                                }
                            
                            VStack {
                                Text("\(level)%")
                                    .font(.system(size: 36))
                                    .fontWeight(.bold)
                                
                                Text("\(String(format: "%.1f", ml)) out of \(String(format: "%.1f", mx)) L")
                                    .fontWeight(.semibold)
                            }
                        }
                        Text("Monday, 25th of November")
                    }
                    
                }
                
                phrases
                
                Spacer()
                
                nextOrSaveButton(text: "Add") {
                    
                }
            }
            .padding(.top, 14)
            .padding(.bottom, 20)
            .tabItem {
                selectedTab == 1 ? Image("mainSelected") : Image("main")
                Text("Main")
            }
            .tag(1)
            
            Settings()
                .tabItem {
                    VStack {
                        selectedTab == 2 ? Image("settSelected") : Image("sett")
                        Text("Settings")
                    }
                }
                .tag(2)
            
            History()
                .tabItem {
                    selectedTab == 3 ? Image("histSelected") : Image("hist")
                    Text("History")
                }
                .tag(3)
        }
    }
    
    var phrases: some View {
        VStack {
            
            Text(text)
                .font(.system(size: 36))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
        }
    }
}



struct waterWave: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        let midWidth = width / 2
        let progressHeight = height * (1 - progress)
        
        path.move(to: CGPoint(x: 0, y: progressHeight))
        
        for x in stride(from: 0, to: width + 15, by: 5) {
            let relativeX = x / waveLength
            let normalizedLength = (x - midWidth) / midWidth
            let y = progressHeight + sin(phase + relativeX) * amplitude + normalizedLength
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: width, y: progressHeight))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: progressHeight))
        return path
    }
    
    let progress: CGFloat
    var amplitude: CGFloat = 7
    var waveLength: CGFloat = 20
    var phase: CGFloat
    
    var animatableData: CGFloat {
        get {phase}
        set {phase = newValue}
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main(ml: 1.2)
    }
}