//
//  UIKitTextField.swift
//  SwiftUIDemo
//
//  Created by dan wang on 2020/3/11.
//  Copyright © 2020 dan wang. All rights reserved.
//

import UIKit
import SwiftUI

struct UIKitTextField: UIViewRepresentable {
    // MARK: - Coordinator

    class Coordinator: NSObject, UITextFieldDelegate {

        private let textField: UIKitTextField

        fileprivate init(_ textField: UIKitTextField) {
            self.textField = textField

            super.init()
        }

        @objc fileprivate func editingChanged(_ sender: UITextField) {
            let text = sender.text ?? ""
            textField.text = text
            textField.onEditingChanged(text)
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            self.textField.onEditingBegin()
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            self.textField.onEditingEnd()
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.textField.onReturnKeyPressed()
        }

    }

    // MARK: - Properties

    @Binding private var text: String
    private let onEditingChanged: (String) -> Void
    private let onEditingBegin: () -> Void
    private let onEditingEnd: () -> Void
    private let onReturnKeyPressed: () -> Bool

    // MARK: - Initializers

    init(text: Binding<String>,
         onEditingChanged: @escaping (String) -> Void = { _ in },
         onEditingBegin: @escaping  () -> Void = {},
         onEditingEnd: @escaping  () -> Void = {},
         onReturnKeyPressed: @escaping  () -> Bool = { true }) {
        _text = text
        self.onEditingChanged = onEditingChanged
        self.onEditingBegin = onEditingBegin
        self.onEditingEnd = onEditingEnd
        self.onReturnKeyPressed = onReturnKeyPressed
    }

    // MARK: - UIViewRepresentable methods

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        textField.addTarget(context.coordinator, action: #selector(Coordinator.editingChanged(_:)), for: .editingChanged)
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }

}
