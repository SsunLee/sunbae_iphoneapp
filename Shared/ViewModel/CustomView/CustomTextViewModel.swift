//
//  CustomTextViewModel.swift
//  sunbae_app (iOS)
//
//  Created by Sunbae lee on 2022/07/12.
//

import Foundation
import SwiftUI

struct UITextViewRepresentable: UIViewRepresentable {
    @Binding var text: String
    @Binding var isFocused: Bool
    @Binding var inputHeight: CGFloat
    
    func makeUIView(context: UIViewRepresentableContext<UITextViewRepresentable>) -> UITextView {
        let textView = UITextView(frame: .zero)
        textView.delegate = context.coordinator
        textView.font = UIFont(name: "Avenir", size: 16)
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return textView
    }
    
    func makeCoordinator() -> UITextViewRepresentable.Coordinator {
        Coordinator(text: self.$text, isFocused: self.$isFocused, inputHeight: $inputHeight)
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<UITextViewRepresentable>) {
        uiView.text = self.text
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        @Binding var text: String
        @Binding var isFocused: Bool
        @Binding var inputHeight: CGFloat
        
        let maxHeight: CGFloat = 250
        
        init(text: Binding<String>, isFocused: Binding<Bool>, inputHeight: Binding<CGFloat>) {
            self._text = text
            self._isFocused = isFocused
            self._inputHeight = inputHeight
        }
        
        func textViewDidChange(_ textView: UITextView) {
            let spacing = textView.font!.lineHeight
            if textView.contentSize.height > inputHeight && inputHeight <= maxHeight - spacing {
                inputHeight += spacing
            } else if text == "" {
                inputHeight = 40
            }
        }
        
        func textViewDidChangeSelection(_ textView: UITextView) {
            self.text = textView.text ?? ""
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            self.isFocused = true
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            self.isFocused = false
        }
    }
}
