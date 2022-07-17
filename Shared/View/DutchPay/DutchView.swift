//
//  DutchView.swift
//  sunbae_app (iOS)
//
//  Created by Sunbae lee on 2022/07/15.
//

import SwiftUI

struct DutchView: View {
    @ObservedObject var dm = dutchModel()
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 10) {
                HStack {
                    Text("더치페이 계산기")
                        .font(.title3.bold())
                    Spacer()
                    Button(action: {
                        // action
                        dm.prices.append("")
                        print(dm.prices)
                    },label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .frame(width: 50, height: 50)
                        } // hstack
                    }) // button
                }
                .padding()
                Divider()
                if (dm.prices.count == 0) {
                    Spacer()
                    VStack {
                        HStack {
                            Spacer()
                            Text("정산할 수 있는 거래가 없습니다.")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                            .padding()
                            Spacer()
                        }
                    }
                    .frame(alignment: .bottom)
                    
                }
            } // vstac
            ForEach(0..<dm.prices.count, id:\.self) { index in
                VStack (alignment: .leading, spacing: 10) {
                    Spacer()
                    Group {
                        HStack {
                            Button(action: {
                                // action
                                dm.prices.remove(at: index)
                            }, label: {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                                    .padding(.horizontal)
                            })
                            Text("정산 \(index+1)회차 🤩")
                                .padding()
                                .foregroundColor(.accentColor)
                            Spacer()
                        } // hstack
                        TextField("정산 금액", text: $dm.prices[index])
                            .padding()
                            .background(Color(uiColor: .secondarySystemBackground))
                            .font(.subheadline)
                            .cornerRadius(15)
                            .keyboardType(.numberPad)
                            .submitLabel(.next)
                        ForEach(1..<dm.members.count, id:\.self) { m_index in
                            HStack {
                                Button(action: {
                                    dm.members.remove(at: m_index)
                                }, label: {
                                    Image(systemName: "minus.circle.fill")
                                        .foregroundColor(.red)
                                        .padding(.horizontal)
                                })
                                
                                Spacer()
                                TextField("정산 멤버", text:$dm.members[m_index])
                                    .padding()
                                    .background(Color(uiColor: .secondarySystemBackground))
                                    .font(.subheadline)
                                    .cornerRadius(15)
                                    .submitLabel(.next)
                            } // hstack
                        } // foreach 1
                    } // group
                    Group {
                        HStack {
                            Button(action: {
                                // action
                                dm.members.append("")
                            }, label: {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                    .padding(.horizontal)
                            })
                            Spacer()
                            
                            TextField("정산 멤버", text:$dm.members[0])
                                .padding()
                                .background(Color(uiColor: .secondarySystemBackground))
                                .font(.subheadline)
                                .cornerRadius(15)
                                .submitLabel(.next)
                        } // hstack
                    } // group
                } // vstack
            } // foreach
         
        } // scrollview
    } // body
} // end

struct particial_dutchView: View {
    @ObservedObject var dm = dutchModel()
    
    var body: some View {
        ForEach(0..<dm.prices.count, id:\.self) { index in
            VStack (alignment: .leading, spacing: 10) {
                Group {
                    HStack {
                        Button(action: {
                            // action
                            dm.prices.remove(at: index)
                        }, label: {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                                .padding(.horizontal)
                        })
                        Text("정산 \(index+1)회")
                            .padding()
                            .foregroundColor(.accentColor)
                        Spacer()
                    } // hstack
                    TextField("정산 금액", text: $dm.prices[index])
                        .padding()
                        .background(Color(uiColor: .secondarySystemBackground))
                        .font(.subheadline)
                        .cornerRadius(15)
                        .keyboardType(.numberPad)
                        .submitLabel(.next)
                    ForEach(1..<dm.members.count, id:\.self) { m_index in
                        HStack {
                            Button(action: {
                                dm.members.removeLast()
                            }, label: {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                                    .padding(.horizontal)
                            })
                            
                            Spacer()
                            TextField("정산 멤버", text:$dm.members[m_index])
                                .padding()
                                .background(Color(uiColor: .secondarySystemBackground))
                                .font(.subheadline)
                                .cornerRadius(15)
                                .submitLabel(.next)
                        } // hstack
                    } // foreach 1
                } // group
                Group {
                    HStack {
                        Button(action: {
                            // action
                            dm.members.append("")
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .padding(.horizontal)
                        })
                        Spacer()
                        TextField("정산 멤버", text:$dm.members[0])
                            .padding()
                            .background(Color(uiColor: .secondarySystemBackground))
                            .font(.subheadline)
                            .cornerRadius(15)
                            .submitLabel(.next)
                    } // hstack
                } // group
            } // vstack
        } // foreach
    }
}


struct DutchView_Previews: PreviewProvider {
    static var previews: some View {
        DutchView()
    }
}
