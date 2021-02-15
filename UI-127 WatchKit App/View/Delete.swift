//
//  Delete.swift
//  UI-127 WatchKit Extension
//
//  Created by にゃんにゃん丸 on 2021/02/15.
//

import SwiftUI

struct Delete: View {
    @FetchRequest(entity: Memo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Memo.dateAdded, ascending: false)],animation : .easeIn) var results : FetchedResults<Memo>
    
    @State var deleteitem : Memo?
    @State var deletememo = false
    
    @Environment(\.managedObjectContext) var context
   
    var body: some View {
        List(results){item in
            
            HStack(spacing:10){
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(item.title ?? "")
                        .font(.system(size: 8))
                        .fontWeight(.bold)
                    
                    
                    
                    Text(item.dateAdded ?? Date(),style: .date)
                        .font(.system(size: 8))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    
                    
                }
                
                Spacer(minLength : 5)
                
                Button(action: {
                    
                    deleteitem = item
                    deletememo.toggle()
                    
                }) {
                    
                    Image(systemName: "trash")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.red)
                        .cornerRadius(5)
                    
                }
                .buttonStyle(PlainButtonStyle())
                
                
            
                
            }
            
            
            
            
        }
        .overlay(
        
            Text(results.isEmpty ? "No memos to Delete" : "")
        )
        .alert(isPresented: $deletememo, content: {
            
            Alert(title: Text("Confirm"), message: Text("Delete this item"), primaryButton: .default(Text("OK"), action: {
                deleteitem(memo: deleteitem!)
            }), secondaryButton: .destructive(Text("Cancel")))
            
            
        })
        
        
        
        .listStyle(CarouselListStyle())
        .navigationBarTitle("Delte")
    }
    
    func deleteitem(memo : Memo){
        
        context.delete(memo)
        do{
            
            try context.save()
        }
    
        catch{
            
            print(error.localizedDescription)
        }
        
    }
    
    
}

