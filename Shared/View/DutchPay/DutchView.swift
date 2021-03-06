//
//  DutchView.swift
//  sunbae_app (iOS)
//
//  Created by Sunbae lee on 2022/07/15.
//

import SwiftUI
import SPIndicator
import UIKit


struct DutchView: View {
    @ObservedObject var sun =  DutchInfo()
    @FocusState private var focusedField: Field?
    @State var payResult: String = ""
    @State private var showToast = false
    @State private var inputHeight: CGFloat = 200
    @State private var isFocused: Bool = false
    @Binding var text: String
    @State var outString: String = ""
    @State var shareText: ShareText?

    @State var showShare: Bool = false
    
    init(text: Binding<String>) {
        self._text = text
    }
    enum Field: Hashable {
        case priceField, memberField, txtField
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollViewReader { value in
                ScrollView {
                    VStack (alignment: .leading, spacing: 10) {
                        HStack {
                            Text("π λμΉνμ΄ κ³μ°κΈ°")
                                .font(.subheadline.bold())
                            Spacer()
                            Button(action: {
                                sun.addItem(title: "", member: [""], price: "")
                                focusedField = nil
                            },label: {
                                HStack {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.green)
                                        .frame(width: 50, height: 50)
                                } // hstack
                            }) // button
                            .onChange(of: sun.dutchdatas.count) { count in
                                withAnimation {
                                    value.scrollTo(count - 1)
                                }
                            }
                        }
                        .padding(5)
                        Divider()
                        if (sun.dutchdatas.count == 0) {
                            Spacer()
                            VStack {
                                HStack {
                                    Spacer()
                                    Text("μ μ°ν  μ μλ κ±°λκ° μμ΅λλ€.")
                                        .font(.subheadline)
                                        .foregroundColor(Color.gray)
                                    .padding()
                                    Spacer()
                                }
                            }
                            .frame(alignment: .bottom)
                        }
                    } // vstack
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
                                Text("μ μ° \(Int(index+1))νμ°¨ π€©")
                                    .font(.subheadline)
                                    .padding()
                                    .foregroundColor(.accentColor)
                                Spacer()
                            } // hstack
                            TextField("μ μ° κΈμ‘", text: $sun.dutchdatas[index].price)
                                .padding(8)
                                .background(Color(uiColor: .secondarySystemBackground))
                                .font(.subheadline)
                                .cornerRadius(8)
                                .keyboardType(.numberPad)
                                .submitLabel(.next)
                                .focused($focusedField, equals: .priceField)
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
                                        TextField("μ μ° λ©€λ²", text:$sun.dutchdatas[index].members[m_index])
                                            .padding(8)
                                            .background(Color(uiColor: .secondarySystemBackground))
                                            .font(.subheadline)
                                            .cornerRadius(8)
                                            .submitLabel(.next)
                                            .focused($focusedField, equals: .memberField)
                                    } // hstack
                                } // foreach 1
                                HStack {
                                    Button(action: {
                                        sun.addMember(indexArray: index, member: "")
                                    }, label: {
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.green)
                                            .padding(.horizontal)
                                    })
                                    Text("μΈμ μΆκ°νκΈ°")
                                        .font(.subheadline)
                                        .padding()
                                    Spacer()
                                } // hstack
                            Divider()
                        } // vstack
                    }
                    Button(action: {
                        focusedField = nil
                        text = sun.getDutchInfo()
                    }, label: {
                            Text("μ μ°νκΈ°")
                                .frame(width: geo.size.width, height: 50)
                                .background(sun.btnColor)
                                .foregroundColor(Color.white)
                                .cornerRadius(15)
                    }).disabled(sun.isDisabled())
                    Spacer()
                    Divider()
                    VStack {
                        HStack {
                            Text("Result")
                                .font(.subheadline)
                            .foregroundColor(Color.accentColor)
                            Spacer()
                            Button(action: {
                                if !text.isEmpty {
                                    UIPasteboard.general.string = text
                                    showToast.toggle()
                                }
                            }, label: {
                                Text("Copy")
                                    .font(.subheadline)
                                    .foregroundColor(.accentColor)
                                    .padding()
                            })
                            Button(action: {
                                outString = sun.getDutchInfo()
                                shareText = ShareText(text: outString)
                                showShare = sun.isDisabled() ? false : true
                            }, label: {
                                Text("κ³΅μ νκΈ°")
                                    .font(.subheadline)
                            })
                        }
                    }
                    .sheet(isPresented: $showShare) {
                        ActivityView(text: outString)
                    }
                    .SPIndicator(
                        isPresent: $showToast,
                        title: "Notification",
                        message: "λ³΅μ¬λμμ΅λλ€",
                        duration: 2,
                        preset: .done,
                        haptic: .success
                    )
                    VStack {
                        Divider()
                        UITextViewRepresentable(text: $text, isFocused: $isFocused, inputHeight: $inputHeight)
                          .frame(height: inputHeight)
                          .padding(.vertical, 10)
                          .focused($focusedField, equals: .txtField)
                          .disabled(sun.isDisabled())
                    }
                    .border(isFocused ? Color.accentColor : Color.gray, width: 1)
                }
            } // scrollview
        } // geometry
        .padding()
    } // body
} // end

// 1. Activity View
struct ActivityView: UIViewControllerRepresentable {
    let text: String

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: [text], applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {}
}

// 2. Share Text
struct ShareText: Identifiable {
    let id = UUID()
    let text: String
}

//struct DutchView_Previews: PreviewProvider {
//    static var previews: some View {
//        DutchView()
//
//    }
//}
