//
//  HistoryListView.swift
//  sunbae_app
//
//  Created by Sunbae lee on 2022/06/13.
//

import SwiftUI

struct HistoryListView: View {
    @State var historys:[CardInfo] = CardHistory.data
    var body: some View {
        NavigationView {
            ZStack {
            VStack {
                List() {
                    ForEach(historys, id: \.id) { card in
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
        historys.append(
            CardInfo(title:"22ISAKAYA",memger: ["Sunbae","Geonsuk","Hosub"],price: "132,000")
        )
    }
    func delete(indexSet: IndexSet) {
        historys.remove(atOffsets: indexSet)
    }
    func move(indices: IndexSet, newOffset: Int) {
        historys.move(fromOffsets: indices, toOffset: newOffset)
    }
}

struct HistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryListView()
    }
}
