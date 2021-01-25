//
//  BookingView.swift
//  Shared
//
//  Created by Noirdemort on 22/01/21.
//

import SwiftUI
import CoreData
import Combine


struct BookingView: View {
    
//    @StateObject var ticket = Ticket()
    @ObservedObject var ticket: Ticket
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Book Ticket")
    @State var comms: Bool = false
    @State var showPax = false
    @State var cancellableSet = Set<AnyCancellable>()
    
    init(ticket newTicket: Ticket) {
        ticket = newTicket
        ticket.commsExist
            .receive(on: RunLoop.main)
            .map { commsExist in
                return commsExist
            }
            .assign(to: \.comms, on: self)
            .store(in: &cancellableSet)
            
    }
    
    var body: some View {
       
//        VStack(alignment: .center, spacing: 10)
         NavigationView {
           
        
            Form {
                Section {
                    TextField("Name")
                
                Section(header: Text("Travel Details")) {
                    
                    DatePicker("Choose booking date", selection: $ticket.bookingDate, displayedComponents: .date)
                        
                    
                    PhoneView(phone: $ticket.phone)
                    
                    TextField("Email", text: $ticket.email.bound)
                    
                   
                    
                    ExtrasView(extras: ticket.extraServices)
                    
                }
            }
                
                NavigationLink(
                    destination: PassengerView(passengers: $ticket.passengers)){
                       Text("Manage Passengers")
                }
                
            
        }
    }
    
    
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}



//struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//
//    var body: some View {
//        List {
//            ForEach(items) { item in
//                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//            }
//            .onDelete(perform: deleteItems)
//        }
//        .toolbar {
//            #if os(iOS)
//            EditButton()
//            #endif
//
//            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
//            }
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
