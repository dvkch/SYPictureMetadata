//
//  SYSummaryVC.swift
//  SYPictureMetadataExample
//
//  Created by Stanislas Chevallier on 09/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import UIKit
import SYKit
import SYPictureMetadata
import Photos

class SYSummaryVC: UIViewController {
    
    // MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCell(SYSummaryCell.self, xib: false)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: Views
    @IBOutlet private var tableView: UITableView!
    
    // MARK: Data
    private enum Section: Int, CaseIterable {
        case supportedKeys
        case dataSetAnalysis
    }

    // MARK: Image analysis

    // Supported keys
    private func detailedSupportedKeys() -> String {
        let imageIO = Keys.imageIO.read().count
        let supported = Keys.supported.read().count
        let unsupported = Keys.unsupported.read().count
        let ratio = Int(Float(supported) / Float(imageIO) * 100)

        var details = [String]()
        details.append("ImageIO keys: \(imageIO)")
        details.append("Supported keys: \(supported)")
        details.append("Unsupported keys: \(unsupported)")
        details.append("Current support: \(ratio)%")
        return details.joined(separator: "\n")
    }

    // Determine files that have the most data for tests
    private func detailedAnalyzeOfImagesSet() -> String {
        var details = [String]()
        
        // first we load all metadatas
        var metadatas = [URL: SYMetadata]()
        var unreadableFiles = [URL]()
        for file in TestFile.allCases {
            do {
                let metadata = try SYMetadata(fileURL: file.url)
                metadatas[file.url] = metadata
            }
            catch {
                unreadableFiles.append(file.url)
            }
        }
        
        // add to log
        if unreadableFiles.count > 0 {
            details.append("Couldn't read metadata for files:")
            details.append(contentsOf: unreadableFiles.map { " - " + $0.path })
            details.append("")
        }
        
        // detect images that have the same list of keys
        var keySets = [[String]: [URL]]()
        for (url, metadata) in metadatas {
            let keys = metadata.originalDictionary.allKeyPaths.sorted()
            var urlsWithSameKeys = keySets[keys] ?? []
            urlsWithSameKeys.append(url)
            keySets[keys] = urlsWithSameKeys
        }
        
        for (set, urls) in keySets {
            guard urls.count > 1 else { continue }

            // add to log
            details.append("Images using same set of metadata keys:")
            details.append(contentsOf: urls.map { " - " + $0.lastPathComponent })
            details.append("")
            
            // remove from further analysis
            keySets.removeValue(forKey: set)
        }
        

        // now we compare each metadata to each other ones to determine if a file is
        // pertinent (i.e. it has some metadata that no other have)
        var readKeys = Set<String>()
        var uniquesKeysByFile = [URL: Int]()
        
        for (url1, metadata1) in metadatas {
            var uniqueKeys = Set<String>(metadata1.originalDictionary.allKeyPaths)
            readKeys = readKeys.union(uniqueKeys)
            
            for (url2, metadata2) in metadatas {
                guard url1 != url2 else { continue }
                
                let keys2 = Set<String>(metadata2.originalDictionary.allKeyPaths)
                uniqueKeys = uniqueKeys.subtracting(keys2)
            }
            
            uniquesKeysByFile[url1] = uniqueKeys.count
        }
        
        // add useless files to log
        let uselessFiles = uniquesKeysByFile.filter { $0.value == 0 }.keys
        if uselessFiles.count > 0 {
            details.append("Images using keys all present in other files of the set (e.g. not relevant):")
            details.append(contentsOf: uselessFiles.map { " - " + $0.lastPathComponent })
            details.append("")
        }
        uniquesKeysByFile = uniquesKeysByFile.filter { $0.value > 0 }
        
        // add unique keys count to log
        details.append("Number of unique keys by file:")
        details.append(contentsOf: uniquesKeysByFile.map { " - \($0.value) for \($0.key.lastPathComponent)" })
        details.append("")

        // add total keys to log
        details.append("Currrent set of files uses \(readKeys.count) keys out of \(Keys.supported.read().count) supported")
        
        return details.joined(separator: "\n")
    }
}

extension SYSummaryVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch Section(rawValue: section)! {
        case .dataSetAnalysis:  return "Data set analysis"
        case .supportedKeys:    return "Supported keys"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section)! {
        case .dataSetAnalysis:  return 1
        case .supportedKeys:    return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(SYSummaryCell.self, for: indexPath)
        
        switch Section(rawValue: indexPath.section)! {
        case .supportedKeys:
            cell.textLabel?.text = nil
            cell.detailTextLabel?.text = detailedSupportedKeys()
        case .dataSetAnalysis:
            cell.textLabel?.text = nil
            cell.detailTextLabel?.text = detailedAnalyzeOfImagesSet()
        }
        return cell
    }
}

extension SYSummaryVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
