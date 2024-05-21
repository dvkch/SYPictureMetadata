//
//  SYImagesVC.swift
//  SYPictureMetadataExample
//
//  Created by Stanislas Chevallier on 09/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import UIKit
import SYPictureMetadata
import SYPictureMetadataTestAssets

class SYImagesVC : UIPageViewController {
    // MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        loadURLs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        openIndex(0, animated: false, forceForwardAnimation: false)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: Properties
    private var nextIndex: Int = 0
    private var currentIndex: Int = 0 {
        didSet {
            navigationItem.title = urls[currentIndex].lastPathComponent
        }
    }
    private var urls: [URL] = [] {
        didSet {
            openIndex(currentIndex, animated: false, forceForwardAnimation: false)
        }
    }
    
    // MARK: Content
    private func loadURLs() {
        self.urls = TestFile.allCases.map(\.url)
    }
    
    // MARK: Child ViewControllers
    private func viewController(at newIndex: Int) -> SYImageVC? {
        guard urls.count > 0 else { return nil }
        let index = (newIndex + urls.count) % urls.count
        guard index < urls.count else { return nil }
        let url = urls[index]
        
        let vc = SYImageVC()
        vc.pictureURL = url
        vc.index = index
        
        return vc
    }
    
    private func openIndex(_ index: Int, animated: Bool, forceForwardAnimation: Bool) {
        guard let vc = viewController(at: index) else { return }
        
        var direction = UIPageViewController.NavigationDirection.forward
        if (index < currentIndex && !forceForwardAnimation) {
            // going backwards
            direction = .reverse
        }

        currentIndex = index
        setViewControllers([vc], direction: direction, animated: animated, completion: nil)
    }
}

extension SYImagesVC : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // disable infinity scroll when only has a single item
        if urls.count < 2 { return nil }
        
        guard let prevVC = viewController as? SYImageVC else { return nil }
        return self.viewController(at: prevVC.index - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // disable infinity scroll when only has a single item
        if urls.count < 2 { return nil }
        
        guard let prevVC = viewController as? SYImageVC else { return nil }
        return self.viewController(at: prevVC.index + 1)
    }
}

extension SYImagesVC : UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let vc = pendingViewControllers.first as? SYImageVC {
            nextIndex = vc.index
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            currentIndex = nextIndex
        }
        nextIndex = 0
    }
}

