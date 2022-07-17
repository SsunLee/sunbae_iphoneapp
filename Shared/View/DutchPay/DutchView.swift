//
//  DutchView.swift
//  sunbae_app (iOS)
//
//  Created by Sunbae lee on 2022/07/15.
//

import SwiftUI

struct DutchView: View {
    @ObservedObject var sun =  DutchInfo()
    
    
    var body: some View {
        
        ScrollView {
            VStack (alignment: .leading, spacing: 10) {
                HStack {
                    Text("😍 더치페이 계산기")
                        .font(.title3.bold())
                    Spacer()
                    Button(action: {
                        // action
                        //dm.prices.append("")
                        
                        sun.addItem(title: "z", member: ["zz"], price: "z")
                        
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
                // sun.dutchdatas
                if (sun.dutchdatas.count == 0) {
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
            
            //let sunDatas: [DutchData] = sun.dutchdatas
            //sun.dutchdatas
            ForEach(sun.dutchdatas.indices, id:\.offset) { index in
                VStack (alignment: .leading, spacing: 10) {
                    Spacer()
                        HStack {
                            Button(action: {
                                sun.dutchdatas.remove(at: index)
                                //sun.dutchdatas.remove(at: index)
                            }, label: {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                                    .padding(.horizontal)
                            })
                            Text("정산 \(Int(index+1))회차 🤩")
                                .padding()
                                .foregroundColor(.accentColor)
                            Spacer()
                        } // hstack
                        //$sun.dutchdatas[index].price
                        TextField("정산 금액", text: $sun.dutchdatas[index].price)
                            .padding()
                            .background(Color(uiColor: .secondarySystemBackground))
                            .font(.subheadline)
                            .cornerRadius(15)
                            .keyboardType(.numberPad)
                            .submitLabel(.next)
                        // 여기부터
                    
                    ForEach(sun.dutchdatas[index], id:\.self) { m_index in
                            HStack {
                                Button(action: {

                                    //sun.dutchdatas[index].members.remove(at: m_index)
                                    sun.deleteMember(indexArray: index, indexAt: m_index)
                                }, label: {
                                    Image(systemName: "minus.circle.fill")
                                        .foregroundColor(.red)
                                        .padding(.horizontal)
                                })

                                Spacer()
                                
                                TextField("정산 멤버", text:sun.dutchdatas[index].$members[m_index])
                                    .padding()
                                    .background(Color(uiColor: .secondarySystemBackground))
                                    .font(.subheadline)
                                    .cornerRadius(15)
                                    .submitLabel(.next)
                            } // hstack
                        } // foreach 1
                    // 여기까지
                        HStack {
                            Button(action: {
                                // action
                                //sun.dutchdatas[index].members.append("")
                                sun.addMember(indexArray: index, member: "")
                            }, label: {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                    .padding(.horizontal)
                            })
                            Spacer()
                            
//                            TextField("정산 멤버", text:$sun.dutchdatas[index].members[0])
//                                .padding()
//                                .background(Color(uiColor: .secondarySystemBackground))
//                                .font(.subheadline)
//                                .cornerRadius(15)
//                                .submitLabel(.next)
                        } // hstack
                } // vstack
            }
         
        } // scrollview
    } // body
} // end

//struct DutchMergeView: View {
//    @ObservedObject var sun = DutchInfo()
//
//    var body: some View {
//
//    }
//}

//struct DutchView_Previews: PreviewProvider {
//    static var previews: some View {
//        DutchView(sun: DutchData(id: "", title: "", members: [], price: "", payDate: ""))
//
//    }
//}
