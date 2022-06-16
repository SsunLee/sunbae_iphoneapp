//
//  HistoryListView.swift
//  sunbae_app
//
//  Created by Sunbae lee on 2022/06/13.
//

import SwiftUI

struct HistoryListView: View {
    //@State var historys:[CardInfo] = CardHistory.data
    @EnvironmentObject var card: CardData
    //@ObservedObject var historys = card.cardinfos
    //var historys = card.cardinfos
 
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List() {
                        if card.cardinfos.count != 0 {
                            ForEach(card.cardinfos, id: \.id) { card in
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(card.title)
                                        .fontWeight(.semibold)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                    HStack {
                                        Label(card.memger.joined(separator: ", "), systemImage: "person.3.sequence")
                                            .font(.subheadline)
                                    }
                                    HStack {
                                        Label(card.price, systemImage: "wonsign.circle")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
                                }
                            }
                            .onDelete(perform: delete)
                            .onMove(perform: move)
                        } else {
                            EmptyView()
                        }
                    }
                }
                .navigationTitle("Sunbae's History")
                .navigationBarItems(leading: EditButton())
                .toolbar {
                    Button(action: {
                        // if you button click
                        addItemRow()
                    }) { // plus button
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("New")
                }
            VStack {
                Spacer()
                HStack{
                    NavigationLink(destination: AddItemView()) {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                            .frame(width:70, height: 70)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                }.padding().shadow(radius: 2)
            }
        }
    }
}
    
    func addItemRow() {
        card.cardinfos.append(
            CardInfo(title:"22ISAKAYA",memger: ["Sunbae","Geonsuk","Hosub"],price: "132,000")
        )
        print("test : \(card.cardinfos)")
        //ForEach (historys, id: \.id) { h in
        //    print(h)
        //}
        
    }
    func delete(indexSet: IndexSet) {
        card.cardinfos.remove(atOffsets: indexSet)
    }
    func move(indices: IndexSet, newOffset: Int) {
        card.cardinfos.move(fromOffsets: indices, toOffset: newOffset)
    }
}

struct HistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryListView()
    }
}
