//
//  ContentView.swift
//  simpleSheet
//
//  Created by Peter Deyi on 5/2/23.
//

import SwiftUI

struct ContentView: View {
    
    // need a state variable to indicate whether the sheet is shown
    @State private var showSheet = false
    @State  var guestInput = ""
    @State private var partyGuestList = [
        "Micky", "Donald", "Tinkerbell", "Elsa", "Goofy", "Dumbo"
    ]
    var body: some View {
        
        NavigationStack {
            VStack {
                List(partyGuestList, id: \.self) { guest in
                    NavigationLink {
                        Text(guest)
                    } label: {
                        VStack {
                            Text(guest)
                            Spacer()
                        }
                    }
                }
                .listStyle(.inset)
                .navigationTitle("Party Guest List")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showSheet = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                // add sheet view
                .sheet(isPresented: $showSheet) {
                    VStack(alignment: .trailing, spacing: 10) {
                        HStack(alignment: .top, spacing: 10) {
                            Spacer()
                            Button {
                                showSheet = false
                            } label: {
                                Image(systemName: "arrow.down")
                            }
                            .padding([.top, .bottom, .trailing], 10)
                        }
                        TextField("Insert Guest", text: $guestInput)
                            .padding()
                            .textFieldStyle(.roundedBorder)
                        Button("Save") {
                            // we need to add guest to our list
                            let guest = guestInput.trimmingCharacters(in: .whitespaces)
                            
                            if !guest.isEmpty {
                                partyGuestList.append(guest)
                            }
                            //dismiss your sheet
                            showSheet = false
                        }
                        .padding()
                        .buttonStyle(.borderedProminent)
                        Spacer()
                    }
                }
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
