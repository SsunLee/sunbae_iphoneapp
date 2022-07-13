//
//  DouchView.swift
//  sunbae_app (iOS)
//
//  Created by riiid on 2022/07/13.
//

import SwiftUI

struct DouchView: View {
    
    @State var payfields = [String]()
    @State var payfields_test = [[String]]()
    

    // 그룹 정산 인원 수 그룹
    func getBindingTest(forIndex index: Int, forIndex index2: Int) -> Binding<String> {
        return Binding<String> (
            get: {
                payfields_test[index][index2]
            },
            set: {
                payfields_test[index][index2] = $0
            }
        )
    }

    // 그룹 정산 그룹 ??
    func getBinding(forIndex index: Int) -> Binding<String> {
        return Binding<String> (
            get: {
                payfields[index]
            },
            set: {
                payfields[index] = $0
                
            }
        )
    }
    
    var body: some View {

        VStack (alignment: .leading, spacing: 10){
            Text("N빵 계산기 🤩")
                .font(.title3.bold())
                .foregroundColor(.accentColor)
            Divider()
            Form {
                //ForEach(0..< )
                Section (header: Text("정산 회차")) {
                    ForEach(0..<payfields.count, id:\.self) { index in
                        HStack {
                            Button(action: {
                                // 마이너스 버튼
                                payfields.remove(at: index)
                            }, label: {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                                    .padding(.horizontal)
                            })
                            TextField("정산 장소", text: getBinding(forIndex: index))
                                .font(.subheadline)
                        }
                    } // foreach
                    Button(action: {
                        // 플러스 버튼
                        payfields.append("")
                    }, label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                                .padding(.horizontal)
                            Text("정산 회차 추가하기")
                                .font(.subheadline)
                        }
                    })
                }

            }
        }
        .padding()
    }
}




struct DouchView_Previews: PreviewProvider {
    static var previews: some View {
        DouchView()
    }
}
