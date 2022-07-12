//
//  DutchPayView.swift
//  sunbae_app (iOS)
//
//  Created by Sunbae lee on 2022/07/12.
//

import SwiftUI
import SimpleToast

struct DutchPayView: View {
    @State private var showToast = false
    private let toastOptions = SimpleToastOptions(
        alignment: .bottom,
        hideAfter: 3,
        backdropColor: Color.blue.opacity(0.5),
        animation: .default,
        modifierType: .scale
    )
    
    @State var price: String = ""
    @State var member: String = ""
    
    var payfunc = AddItemFunc(card: CardData())
    
    
    @FocusState private var focusedField: Field?
    @State var payResult: String = ""
    
    @State private var inputHeight: CGFloat = 200
    @State private var isFocused: Bool = false
    @Binding var text: String
    
    init(text: Binding<String>) {
        self._text = text
    }
    enum Field: Hashable {
        case priceField, memberField, txtField
    }
    
    var body: some View {
        GeometryReader { geo in
                ScrollView {
                    VStack (alignment: .leading, spacing: 10){
                        Text("N빵 계산기 🤩")
                            .font(.title3.bold())
                            .foregroundColor(.accentColor)
                            
                        Divider()
                        Group {
                            TextField("정산 금액", text: $price)
                                .padding()
                                .background(Color(uiColor: .secondarySystemBackground))
                                .font(.subheadline)
                                .cornerRadius(15)
                                .keyboardType(.numberPad)
                                .submitLabel(.next)
                                .focused($focusedField, equals: .priceField)
                            TextField("멤버 ex) 이순배, 최보미", text: $member)
                                .padding()
                                .background(Color(uiColor: .secondarySystemBackground))
                                .font(.subheadline)
                                .cornerRadius(15)
                                .focused($focusedField, equals: .memberField)
                            Spacer()
                            Button(action: {
                                // actions
                                text = getCalData()
                                focusedField = nil

                            }, label: {
                                    Text("정산하기")
                                        .frame(width: geo.size.width, height: 50)
                                        .background(btnColor)
                                        .foregroundColor(Color.white)
                                        .cornerRadius(15)
                            }).disabled(isDisable)
                                
                    } // group
                    Spacer()
                    
                    Divider()
                        
                    VStack {
                        HStack {
                            Text("Result")
                                .font(.subheadline)
                            .foregroundColor(Color.accentColor)
                            Spacer()
                            Button(action: {
                                if showToast {
                                    UIPasteboard.general.string = text
                                    showToast.toggle()
                                    print("찍히는지 : \(text)")
                                }

                            }, label: {
                                Text("Copy")
                                    .font(.subheadline)
                                    .foregroundColor(.accentColor)
                                    .padding()
                            })
                        }
                    }
                    VStack {
                        Divider()
                        UITextViewRepresentable(text: $text, isFocused: $isFocused, inputHeight: $inputHeight)
                          .frame(height: inputHeight)
                          .padding(.vertical, 4)
                          .focused($focusedField, equals: .txtField)
                          .disabled(isDisable)
                    }
                    .border(isFocused ? Color.accentColor : Color.gray, width: 1)
                        
                } // vstack
                .simpleToast(isPresented: $showToast, options: toastOptions){
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("복사 되었습니다.")
                            .font(.subheadline)
                    }
                    .padding(5)
                    .cornerRadius(16)
                    .foregroundColor(.white)
                    .background(Color.blue)
                }
            } // scrollview

        } // geo
        .padding()

    }
        
    
    var isDisable: Bool {
        return price.isEmpty || member.isEmpty
    }
    var btnColor: Color {
        return isDisable ? Color.gray : Color.blue
    }
    
    
    func getCalData() -> String {
        lazy var dutchCls: DutchPayFunc = DutchPayFunc(memberString: member, price: price)
        let calData: String = dutchCls.calDutchPay()
        
        return calData
    }
}

//struct DutchPayView_Previews: PreviewProvider {
//    static var previews: some View {
//        DutchPayView(price: "100,000", member: "이순배, 최보미"), payfunc: AddItemFunc())
//
//
//    }
//}
