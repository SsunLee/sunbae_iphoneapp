//
//  DutchPayView.swift
//  sunbae_app (iOS)
//
//  Created by Sunbae lee on 2022/07/12.
//

import SwiftUI
import UIKit

struct DutchPayView: View {
    var payfunc = AddItemFunc(card: CardData())
    var commonOption: commonOption
    @ObservedObject var sun =  DutchInfo()
    @State var price: String = ""
    @State var member: String = ""
//    @State var outString: String = ""
    @State var shareText: ShareText?
    
    @State var payResult: String = ""

    @State private var txtText: String = ""
    @State private var inputHeight: CGFloat = 200
    @State private var isFocused: Bool = false
    @State private var showToast = false
    @FocusState private var focusedField: Field?

    
    // test
    @State var items : [Any] = []
    @State var showShare: Bool = false
    
    enum Field: Hashable {
        case priceField, memberField, txtField
    }
    
    var body: some View {
        GeometryReader { geo in
                ScrollView {
                    VStack (alignment: .leading, spacing: 10){
                        Text("😍 더치페이 계산기")
                            .font(.subheadline.bold())
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
                            TextField("멤버 ex) 이순배, 홍길동", text: $member)
                                .padding()
                                .background(Color(uiColor: .secondarySystemBackground))
                                .font(.subheadline)
                                .cornerRadius(15)
                                .focused($focusedField, equals: .memberField)
                            Spacer()
                            Button(action: {
                                // actions
                                txtText = getCalData()
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
                                Text("🥰 Result")
                                    .font(.subheadline)
                                .foregroundColor(Color.accentColor)
                                Spacer()
                                Button(action: {
                                    txtText = ""
                                }, label: {
                                    Text("Clear")
                                        .font(.subheadline)
                                        .padding()
                                })
                                Button(action: {
                                    if !txtText.isEmpty {
                                        UIPasteboard.general.string = txtText
                                        showToast.toggle()
                                        print("찍히는지 : \(txtText)")
                                    }
                                }, label: {
                                    Text("Copy")
                                        .font(.subheadline)
                                        .foregroundColor(.accentColor)
                                        .padding()
                                })
                                Button(action: {
                                    if !txtText.isEmpty {
                                        shareText = ShareText(text: txtText)
                                    }
                                }, label: {
                                    Text("공유하기")
                                        .font(.subheadline)
                                })
                            }
                        }
                        .sheet(item: $shareText) { shareText in
                            ShareSheet(items: shareText.text)
                        }
                        VStack {
                            Divider()
                            UITextViewRepresentable(text: $txtText, isFocused: $isFocused, inputHeight: $inputHeight)
                            .frame(height: inputHeight)
                            .padding(.vertical, 10)
                            .focused($focusedField, equals: .txtField)
                            .disabled(isDisable)
                        }
                        .border(isFocused ? Color.accentColor : Color.gray, width: 1)
                            
                    } // vstack
                    .SPIndicator(
                        isPresent: $showToast,
                        title: "Notification",
                        message: "복사되었습니다",
                        duration: 2,
                        preset: .done,
                        haptic: .success
                    )
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

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

//struct DutchPayView_Previews: PreviewProvider {
//    static var previews: some View {
//        DutchPayView(price: "100,000", member: "이순배, 최보미"), payfunc: AddItemFunc())
//
//
//    }
//}
