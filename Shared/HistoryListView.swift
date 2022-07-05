//
//  HistoryListView.swift
//  sunbae_app
//
//  Created by Sunbae lee on 2022/06/13.
//

import SwiftUI

struct HistoryListView: View {
    
    @EnvironmentObject var cards: CardData
    @State private var searchText = ""

    var body: some View {
        ZStack {
            VStack {
                List {
                    if cards.cardinfos.count != 0 {
                        //WalletListView()
                        ForEach(cards.cardinfos, id: \.id) { card in
                            NavigationLink(destination: WalletDetailView(card: card)) {
                                HStack(spacing: 5) {
                                    Image("star")
                                        .padding(1)
                                }
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack {
                                        Text(card.title)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                        Spacer()
                                        Text(card.payType)
                                            .font(.subheadline)
                                            .frame(width: 40, height: 15, alignment: .center)
                                            .padding(5)
                                            .foregroundColor(.white)
                                            .background(payTypeColor(payTypeString: card.payType))
                                            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                                    }
                                    HStack {
                                        Label(card.member.joined(separator: ", "), systemImage: "person.3")
                                            .font(.subheadline)
                                    }
                                    HStack {
                                        Text(card.insertDate)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Spacer()
                                        Label(setNumberFormatter(strPrice: card.price), systemImage: "wonsign.circle")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    } // hstack
                                } // vastck
                                
                            }
                            .navigationBarHidden(true)// navigationLink
                            
                        } // foreach
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                        
                    } else {
                        EmptyListView()
                    }
                }
                //.listStyle(.plain)
                
            } // Vstack
            
        VStack {
            Spacer()
            HStack{
                Spacer()
                NavigationLink(destination: AddItemView()) {
                    Image(systemName: "plus")
                        .font(.subheadline)
                        .frame(width:30, height: 30)
                        .background(Color.green)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                }.padding()
            } // Vstack
            VStack {
                Spacer()
                HStack {
                    FixedPayAreaView() // 가용금액
                    Spacer()
                }
            }
        } // Zstack
        .navigationBarTitle("", displayMode: .inline)
        .edgesIgnoringSafeArea(.top)
    } // body View
    
    
    func setNumberFormatter(strPrice: String) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let _price = Int(strPrice)
        let result = numberFormatter.string(for: _price)!
        
        return result
    }
    
    func delete(indexSet: IndexSet) {
        cards.cardinfos.remove(atOffsets: indexSet)
    }
    func move(indices: IndexSet, newOffset: Int) {
        cards.cardinfos.move(fromOffsets: indices, toOffset: newOffset)
    }

    func payTypeColor(payTypeString: String) -> Color {
        if payTypeString == "수입" {
            return Color.blue
        } else {
            return Color.red
        }
    }
    
} // struct view

struct HistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryListView()
    }
}
