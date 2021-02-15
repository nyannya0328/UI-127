//
//  Additem.swift
//  UI-127 WatchKit Extension
//
//  Created by にゃんにゃん丸 on 2021/02/15.
//

import SwiftUI

struct Additem: View {
    @State var memotext = ""
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var present
    
    var memoitem : Memo?
    var body: some View {
        
        VStack(spacing:10){
            
            TextField("Enter", text: $memotext)
            
            Button(action: AddMemo) {
                Text("Save")
                    .padding(.vertical)
                    .frame(maxWidth: .infinity,alignment:.center)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(15)
            }
            .padding(.horizontal)
            .buttonStyle(PlainButtonStyle())
            .disabled(memotext == "")
            
        }
        
        .onAppear(perform: {
            
            if let memo = memoitem{
                
                memotext = memo.title ?? ""
                
            }
            
            
            
        })
        .navigationBarTitle("\(memoitem == nil ? "Add Memo":"update")")
    }

    func AddMemo(){
        
        let memo = memoitem == nil ? Memo(context: context) : memoitem!
        memo.title = memotext
        memo.dateAdded = Date()
        
        do{
           try context.save()
            present.wrappedValue.dismiss()
            
            
        }
        catch{
            
            print(error.localizedDescription)
        }
        
        
        
    }
}

struct Additem_Previews: PreviewProvider {
    static var previews: some View {
        Additem()
    }
}
