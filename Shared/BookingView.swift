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
    
    @ObservedObject var ticket: Ticket
    @State var cancellableSet = Set<AnyCancellable>()
    
    init(ticket newTicket: Ticket) {
        ticket = newTicket
    }
    
    var body: some View {
       
//        VStack(alignment: .center, spacing: 10)
         NavigationView {
           
            Form {
                
                Section(header: Text("Travel Details")) {
                    
                    DatePicker("Choose booking date", selection: $ticket.bookingDate, displayedComponents: .date)
                    PhoneView(phone: $ticket.phone)
                    TextField("Email", text: $ticket.email.bound)
                }
                
                NavigationLink(
                    destination: PassengerView(ticket: ticket)){
                       Text("Manage Passengers")
                }
                
                Section(header: Text("Extras")){
                    ExtrasView(extras: ticket.extraServices)
                }
            
                Section(header: Text("Ticket Details")) {
                    #if os(macOS)
                    if let data = ticket.qrData, let image = NSImage(data: data){
                        Image(nsImage: image)
                    }
                    #else
                    if let data = ticket.qrData, let image = UIImage(data: data){
                        Image(uiImage: image)
                    }
                    #endif
                    
                    List(ticket.journeys, rowContent: JourneyView.init)
                }
                
                Section(header: Text("Personal Details")) {
                    Text("Payment Status: \(ticket.paymentStatus.rawValue.capitalized)")
                    Text("PNR: \(ticket.PNR ?? "N/A")")
                        .bold()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        
                }
                
                Section(footer: Text( ticket.commsExist ? "" : "Phone or Email is Required." ).foregroundColor(.red) ){
                    
                    Button("Book Ticket") {
                        print(ticket.commsExist)
                        ticket.commit()
                    }.disabled(!ticket.commsExist)
                    
                    NavigationLink(destination: BookedView(ticket: ticket)){
                        Text("Status: \(ticket.paymentStatus == .completed ? "Ticket Booked!" : "To Be Processed...")")
                            .bold()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    }
                    
                }
               
            }
           
         }

    }
}


struct BookingView_Previews: PreviewProvider {
    @StateObject static var ticks: Ticket = fetchTicket()
    
    static var previews: some View {
        BookingView(ticket: ticks).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
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
