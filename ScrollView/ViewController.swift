//
//  ViewController.swift
//  ScrollView
//
//  Created by Sergey Lukaschuk on 24.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var imageScrollView: ImageScrollView!
    
    private var urlAddress = "https://www.apple.com/newsroom/images/live-action/rosenthaler-strasse-store-opening/Apple_nso-rosenthaler-strasse_Hero_11302021_Full-Bleed-Image.jpg.large_2x.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageScrollView = ImageScrollView(frame: view.bounds)
        view.addSubview(imageScrollView)
        setupImageScrollView()
        
        guard let image = getImage(from: urlAddress) else { fatalError() }
        self.imageScrollView.set(image: image)
    }
    
    // MARK: - Private Methods
    private func setupImageScrollView() {
        imageScrollView.translatesAutoresizingMaskIntoConstraints = false
        imageScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    private func getImage(from address: String) -> UIImage? {
        var image: UIImage!
        guard let url = URL(string: address) else { fatalError() }
        do {
            let imageData = try Data(contentsOf: url)
            image = UIImage(data: imageData)
        } catch let errorData {
            print(errorData.localizedDescription)
        }
        return image
    }
}
