//
//  SYImageVC.swift
//  SYPictureMetadataExample
//
//  Created by Stanislas Chevallier on 09/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import UIKit
import SYPictureMetadata

class SYImageVC: UIViewController {
    
    // MARK: ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateContent()
    }
    
    // MARK: Properties
    var pictureURL: URL? {
        didSet {
            updateContent()
        }
    }
    var index: Int = 0

    // MARK: Views
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textView: UITextView!

    // MARK: Actions
    
    // MARK: Content
    private func updateContent() {
        guard isViewLoaded else { return }
        guard let pictureURL = pictureURL else { return }

        imageView.image = UIImage(contentsOfFile: pictureURL.path)
        
        do {
            let metadata = try SYMetadata(fileURL: pictureURL)
            textView.text = metadata.originalDictionary.jsonString
        }
        catch {
            textView.text = "Couldn't open file: \(error)"
        }
        
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
}
