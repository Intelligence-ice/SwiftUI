//
//  MainPageView.swift
//  SomeAppSession2
//
//  Created by Sultan Rifaldy on 24/11/22.
//

import SwiftUI

struct MainPageView: View {
    //Properties
    @State private var showAlert: Bool = false
    @State private var showSheet: Bool = false
    
    
    //Body
    var body: some View {
        ZStack{
            Image("go-to-beach")
                .resizable()
                .ignoresSafeArea()
                .overlay(Color.black.opacity(0.3))
            VStack {
                
                buttonTopView
                
                Text("Start Your Adventure and Go Travel Now")
                    .font(.system(size: 60, design: .default))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                    .padding(.trailing)
                    
                Text("Discover local destinations beauty with Bluesky and travel pride")
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .padding(.horizontal, 24)
                Spacer()
            }
            .padding(.horizontal, 20)
            //VStack
        }
        //ZStack
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}

//extension buttonTopView
extension MainPageView {
    private var buttonTopView: some View {
        //Body
        HStack{
            leftTopButton
            
            Spacer()
            
            Text("Travel")
                .fontWeight(.medium)
                .font(.system(size: 20, design: .rounded))
                .tracking(2)
                
            Spacer()
            
            rightTopButton
            
        }
        .foregroundColor(Color.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        //HStack
    }
}

//Extension leftTopButton
extension MainPageView {
    private var leftTopButton : some View {
        Button {
            showAlert = true
        }
        label: {
            Image(systemName: "cloud.sun.fill")
                .renderingMode(.original)
                .font(.system(size: 25))
                .overlay(Circle()
                    .frame(width: 150, height: 50).foregroundColor(.black).opacity(0.1))
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Not Yet Available"),
                message: Text("Currently on active development"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

//Extension rightTopButton
extension MainPageView{
    private var rightTopButton : some View{
        Button {
            showSheet.toggle()
        }
        label: {
            Image(systemName: "cart.badge.plus")
                .renderingMode(.original)
                .font(.system(size: 25))
                .overlay(Circle()
                    .frame(width: 150, height: 50).foregroundColor(.black).opacity(0.1))
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                HStack {
                    Text("Pink Beach, Flores")
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                    Spacer()
                    Image(systemName: "star.fill")
                        .renderingMode(.original)
                    Text("4.8")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
                .padding(.horizontal)
                .padding(.vertical, 25)
                
                //HStackPinkBeach,Flores
                
                HStack{
                    todoIcon(activity: "Walk", icon: "figure.walk.motion", iconColor: .green, textColor: .black, bgColor: Color.cyan.opacity(0.05))
                    Spacer()
                    todoIcon(activity: "Food", icon: "fork.knife.circle.fill", iconColor: .orange, textColor: .black, bgColor: Color.cyan.opacity(0.05))
                    Spacer()
                    todoIcon(activity: "Stays", icon: "house.fill", iconColor: .blue, textColor: .black, bgColor: Color.cyan.opacity(0.05))
                    Spacer()
                    todoIcon(activity: "Ride", icon: "sailboat.fill", iconColor: .purple, textColor: .black, bgColor: Color.cyan.opacity(0.05))
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                
                //HStackIcon
                VStack(alignment: .leading){
                    Text("About Destination")
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                    
                    Text("Pink Beach, or Pantai Merah , as it aptly named is one of seven pink beaches on the planet. This was awesome")
                }
                .foregroundColor(.black)
                .padding(.horizontal)
                Spacer()
                //Vstack
                HStack{
                    Text("$81,39")
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                    Spacer()
                        HStack {
                            Link(destination: URL(string: "https://www.apple.com")!){
                                Image(systemName: "bag")
                                Text("Join Tour")
                            }
                            .frame(width: 150, height: 50)
                            .background(LinearGradient(gradient: Gradient(colors: [.purple, .indigo]), startPoint: .leading, endPoint: .trailing))
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                            .shadow(radius: 50, x:50, y: 50)
                        }
                        .font(.title2)
                        .foregroundColor(.white)
                        //HStack
                }
                .padding(.horizontal, 20)
                Spacer()
                //HStack
            }//VSTack
            .presentationDragIndicator(.visible)
            .presentationDetents([.medium, .fraction(0.40)])
        }
    }
}

struct todoIcon: View {
    var activity: String
    var icon: String
    var iconColor: Color
    var textColor: Color
    var bgColor: Color
    
    var body: some View {
        VStack{
            Image(systemName: icon)
                .fontWeight(.medium)
                .foregroundColor(iconColor)
                .font(.system(size: 30))
                .padding(-3)
            Text(activity)
                .foregroundColor(textColor)
                .fontWeight(.light)
                .font(.system(size: 15))
        }
        .frame(width: 40, height: 60)
        .padding()
        .background(bgColor)
        
        .cornerRadius(5)
        //VStack
    }
}
