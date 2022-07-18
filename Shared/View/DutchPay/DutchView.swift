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
        GeometryReader { geo in
            ScrollView {
                VStack (alignment: .leading, spacing: 10) {
                    HStack {
                        Text("😍 더치페이 계산기")
                            .font(.subheadline.bold())
                        Spacer()
                        Button(action: {
                            sun.addItem(title: "", member: [""], price: "")
                        },label: {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                    .frame(width: 50, height: 50)
                            } // hstack
                        }) // button
                    }
                    .padding(5)
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

                ForEach(sun.dutchdatas.indices, id:\.self) { index in
                    VStack (alignment: .leading, spacing: 5) {
                        HStack {
                            Button(action: {
                                sun.dutchdatas.remove(at: index)
                            }, label: {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                                    .padding(.horizontal)
                            })
                            Text("정산 \(Int(index+1))회차 🤩")
                                .font(.subheadline)
                                .padding()
                                .foregroundColor(.accentColor)
                            Spacer()
                        } // hstack

                        TextField("정산 금액", text: $sun.dutchdatas[index].price)
                            .padding(8)
                            .background(Color(uiColor: .secondarySystemBackground))
                            .font(.subheadline)
                            .cornerRadius(8)
                            .keyboardType(.numberPad)
                            .submitLabel(.next)
                        
                        ForEach(0..<sun.dutchdatas[index].members.count, id:\.self) { m_index in
                                HStack {
                                    Button(action: {
                                        sun.deleteMember(indexArray: index, indexAt: m_index)
                                    }, label: {
                                        Image(systemName: "minus.circle.fill")
                                            .foregroundColor(.red)
                                            .padding(.horizontal)
                                    })
                                    Spacer()
                                    
                                    TextField("정산 멤버", text:$sun.dutchdatas[index].members[m_index])
                                        .padding(8)
                                        .background(Color(uiColor: .secondarySystemBackground))
                                        .font(.subheadline)
                                        .cornerRadius(8)
                                        .submitLabel(.next)
                                } // hstack
                            } // foreach 1
                        // 여기까지
                            HStack {
                                Button(action: {
                                    sun.addMember(indexArray: index, member: "")
                                }, label: {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.green)
                                        .padding(.horizontal)
                                })
                                Text("인원 추가하기")
                                    .font(.subheadline)
                                    .padding()
                                Spacer()

                            } // hstack
                        Divider()
                    } // vstack
                    
                }
                Button(action: {
                    // actions
//                    text = getCalData()
//                    focusedField = nil

                }, label: {
                        Text("정산하기")
                            .frame(width: geo.size.width, height: 50)
                            .background(btnColor)
                            .foregroundColor(Color.white)
                            .cornerRadius(15)
                }).disabled(isDisabled()) // 추후 여기에 변수 넣을 예정
            } // scrollview
        } // geometry
        .padding()

    } // body
    
    func isDisabled() -> Bool {
        var tempVal_one: Int = 0
        var tempVal_two: Int = 0

        for eleOne in sun.dutchdatas {
            if (eleOne.price.isEmpty) {
                tempVal_one += 1
            }
            for eleTwo in eleOne.members {
                if (eleTwo.isEmpty) {
                    tempVal_two += 1
                }
            }
        }
        
        let isCountZero = sun.dutchdatas.count == 0 ? true : false
        let isValueIsEmptry = (tempVal_one + tempVal_two) > 0 ? true : false
        
        return isCountZero || isValueIsEmptry
    }
    var btnColor: Color {
        return isDisabled() ? .gray : .accentColor
    }
    
    
    
} // end


struct DutchView_Previews: PreviewProvider {
    static var previews: some View {
        DutchView()

    }
}
