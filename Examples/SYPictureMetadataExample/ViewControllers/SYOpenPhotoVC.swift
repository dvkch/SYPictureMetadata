//
//  SYOpenPhotoVC.swift
//  SYPictureMetadataExample
//
//  Created by Stanislas Chevallier on 02/02/2021.
//  Copyright © 2021 Syan.me. All rights reserved.
//

import UIKit
import PhotosUI
import SYPictureMetadata

class SYOpenPhotoVC : UIViewController {
    
    // MARK: ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        updateContent()
    }
    
    // MARK: Properties
    private var asset: PHAsset? {
        didSet {
            updateContent()
        }
    }
    
    // MARK: Views
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textView: UITextView!

    // MARK: Actions
    @IBAction private func openButtonTap() {
        askPermission {
            self.showPicker()
        }
    }
    
    private func askPermission(success: @escaping () -> Void) {
        let status = PHPhotoLibrary.authorizationStatus()
        if status == .authorized {
            return success()
        }
        PHPhotoLibrary.requestAuthorization { (newStatus) in
            if (newStatus == PHAuthorizationStatus.authorized) {
                DispatchQueue.main.async {
                    success()
                }
            } else {
                let alert = UIAlertController(title: "Access Denied", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    private func showPicker() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary) ?? []
        present(picker, animated: true, completion: nil)
    }
    
    // MARK: Content
    private func updateContent() {
        guard let asset = asset else {
            title = "Open Photo"
            imageView.image = nil
            textView.text = nil
            return
        }
        
        PHImageManager.default().requestImage(for: asset, targetSize: imageView.bounds.size, contentMode: .aspectFit, options: nil) { (image, _) in
            self.imageView.image = image
        }
        
        SYMetadata.metadata(asset: asset, networkAccessAllowed: false) { (metadata, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            }
            else if let metadata = metadata {
                self.textView.text = [
                    "CAPTION: \(asset.assetCaption ?? "")",
                    metadata.originalDictionary.jsonString
                ].joined(separator: "\n\n")
            }
        }
    }
}

extension SYOpenPhotoVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        self.asset = info[.phAsset] as? PHAsset
    }
}
