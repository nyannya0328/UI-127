//
//  ViewMemo.swift
//  UI-127 WatchKit Extension
//
//  Created by にゃんにゃん丸 on 2021/02/15.
//

import SwiftUI
import CoreData


struct ViewMemo: View {
    @FetchRequest(entity: Memo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Memo.dateAdded, ascending: false)],animation : .easeIn) var results : FetchedResults<Memo>
    
   
    var body: some View {
        List(results){item in
            
            HStack(spacing:10){
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(item.title ?? "")
                        .font(.system(size: 8))
                        .fontWeight(.bold)
                    
                    Text("Last Modeifierd")
                        .font(.system(size: 8))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.top,8)
                    
                    Text(item.dateAdded ?? Date(),style: .date)
                        .font(.system(size: 8))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    
                    
                }
                
                Spacer(minLength : 5)
                
                NavigationLink(destination: Additem()) {
                    
                    Image(systemName: "square.and.pencil")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.orange)
                        .cornerRadius(5)
                    
                }
                .buttonStyle(PlainButtonStyle())
               
                
                    
                
            }
            
            
            
            
        }
        .overlay(
        
            Text(results.isEmpty ? "No memo Found" : "")
        )
        
        
        
        .listStyle(CarouselListStyle())
        .navigationBarTitle("Memos")
    }
    
    
}

struct ViewMemo_Previews: PreviewProvider {
    static var previews: some View {
        ViewMemo()
    }
}
