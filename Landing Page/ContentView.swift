//
// Created By: Mobile Apps Academy
// Subscribe : https://www.youtube.com/@MobileAppsAcademy?sub_confirmation=1
// Medium Blob : https://medium.com/@mobileappsacademy
// LinkedIn : https://www.linkedin.com/company/mobile-apps-academy
// Twitter : https://twitter.com/MobileAppsAcdmy
// Lisence : https://github.com/Mobile-Apps-Academy/MobileAppsAcademyLicense/blob/main/LICENSE.txt
//


import SwiftUI

let captionText: String = "Welcome to Mobile Apps Academy, your go-to channel for all things mobile app development! Whether you're a seasoned developer looking to enhance your skills or a complete beginner eager to dive into the world of app creation, we've got you covered."

struct ContentView: View {
    @State var caption: String = ""
    
    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .scaleEffect(x: -1)
            
            VStack(alignment: .trailing) {
                Spacer()
                VStack(alignment: .trailing, spacing: 10) {
                    GeometryReader { geo in
                        HStack {
                            Spacer()
                            Text("Mobile \nApps Academy")
                                .font(AmericanTypewriter(size: 32))
                                .multilineTextAlignment(.trailing)
                                .bold()
                                .foregroundColor(Color("Gray"))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: geo.size.width - 50, height: 3)
                                        .foregroundColor(.white)
                                        .offset(x: -20, y: geo.frame(in: .local).midY)
                                    
                                }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    
                    Text(caption)
                        .font(AmericanTypewriter(size: 13))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("Gray").opacity(0.6))
                }
                .offset(x:0, y: -90)
                
                Spacer()
                
                Button {
                    
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .overlay {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.white, lineWidth: 2)
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.white)
                            }
                        }
                        .foregroundColor(Color("Gray").opacity(0.6))
                }
                .frame(width: 55, height: 55)

            }
            .padding(30)
        }
        .ignoresSafeArea()
        .onAppear{
            typeWriter()
        }
    }
    
    func typeWriter(at position: Int = 0) {
        if position == 0 {
            caption = ""
        }
        if position < captionText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                caption.append(captionText[position])
                typeWriter(at: position + 1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
