//
//  Home.swift
//  UI-127 WatchKit Extension
//
//  Created by にゃんにゃん丸 on 2021/02/15.
//

import SwiftUI

struct Home: View {
    var body: some View {
        GeometryReader{reader in
            let rect = reader.frame(in: .global)
            
            VStack(spacing:10){
                
                HStack(spacing:15){
                    
                    NavigationLink(destination: Additem()) {
                        NavButton(title: "Add", image: "plus", rect: rect, color: Color.orange)
                    }
                    .buttonStyle(PlainButtonStyle())
                
                    
                    NavigationLink(destination: Delete()) {
                        NavButton(title: "Delete", image: "trash", rect: rect, color: Color.red)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    
                }
                .frame(width: rect.width,alignment: .center)
                
            
                
                HStack(spacing:15){
                    
                    NavButton(title: "Star", image: "star.fill", rect: rect, color: Color.blue)
                    
                    NavigationLink(destination: ViewMemo()) {
                        NavButton(title: "View", image: "doc.fill", rect: rect, color: Color.green)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    
                }
                .frame(width: rect.width,alignment: .center)
            }
           
            
        }
        
    }
}

struct NavButton : View {
    var title : String
    var image : String
    var rect : CGRect
    var color : Color
    var body: some View{
        
        VStack{
            
            Image(systemName: image)
                .font(.title2)
                .frame(width: rect.width / 3, height: rect.width / 3 , alignment: .center)
                .background(color)
                .clipShape(Circle())
            
            Text(title)
                .font(.system(size: 10))
                .foregroundColor(.white)
            
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
