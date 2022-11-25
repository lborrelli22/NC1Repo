//
//  MailboxScreen.swift
//  MailboxScreen
//
//  Created by Luca Borrelli on 24/11/22.
//

import SwiftUI

///

struct MailboxElement: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var color: Color
    var mboxName: String
}

///

struct MailboxScreen: View {
    
    let mailboxElements = [
        MailboxElement(name: "Inbox", image: "envelope", color: .blue, mboxName: ""),
        MailboxElement(name: "VIP", image: "star", color: .yellow, mboxName: ""),
        MailboxElement(name: "Drafts", image: "doc", color: .blue, mboxName: "fed.idserve.net"),
        MailboxElement(name: "Sent", image: "paperplane", color: .blue, mboxName: "fed.idserve.net"),
        MailboxElement(name: "Junk", image: "xmark.bin", color: .blue, mboxName: "fed.idserve.net"),
        MailboxElement(name: "Bin", image: "trash", color: .blue, mboxName: "fed.idserve.net")
    ]
    
        
    var body: some View {
        
        NavigationStack {     // "NavigationView" is deprecated
            
            List(mailboxElements) { element in
                NavigationLink( destination: Destination(myChildView: element), label: { Label(element: element) } )
                
            }
            .navigationTitle("Mailboxes")
            .toolbar{ToolbarItem(placement: .navigationBarTrailing) {
                Button("Edit"){} } }
            .toolbar{ToolbarItemGroup(placement: .bottomBar) {
                        Spacer()
                        Text("Updated Just Now")
                            .font(.footnote)
                        Spacer()
                        Button(action:{}) { Image(systemName: "square.and.pencil") } }
            }
            
        }
    }
    
}

///

struct Label: View {
    
    var element: MailboxElement
    
    var body: some View {
        HStack {
            
            Image(systemName: element.image).foregroundColor(element.color)
            Text(element.name)
            Spacer()
            Text(element.mboxName).font(.subheadline).foregroundColor(.gray).padding(.trailing, 8.0)
            
        }
    }
}

///

struct Destination: View {
    let myChildView: MailboxElement
    var body: some View {
        VStack { }
    }
}

///
///
///

struct MailboxScreen_Previews: PreviewProvider {
    static var previews: some View {
        MailboxScreen()
    }
}

