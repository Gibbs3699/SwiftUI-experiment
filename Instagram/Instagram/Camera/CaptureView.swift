//
//  CaptureView.swift
//  Instagram
//
//  Created by TheGIZzz on 21/9/2565 BE.
//

import Foundation
import SwiftUI

struct CaptureView: UIViewControllerRepresentable {
    
    @Binding var isUsingCamera: Bool
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    typealias UIViewControllerType = UIImagePickerController
    
    init(isShown: Binding<Bool>, image: Binding<Image?>, isUsingCamera: Binding<Bool>) {
        _isShown = isShown
        _image = image
        _isUsingCamera = isUsingCamera
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image, isUsingCamera: $isUsingCamera)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureView>) -> UIImagePickerController {

        let picker = UIImagePickerController()
        picker.sourceType = isUsingCamera ? .camera : .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        //
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var isUsingCamera: Bool
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    init(isShown: Binding<Bool>, image: Binding<Image?>, isUsingCamera: Binding<Bool>) {
        _isShown = isShown
        _image = image
        _isUsingCamera = isUsingCamera
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let uiimage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        image = Image(uiImage: uiimage)
        isShown = false
    }
}
