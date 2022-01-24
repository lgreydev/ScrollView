//
//  ViewController.swift
//  ScrollView
//
//  Created by Sergey Lukaschuk on 24.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: 2880, height: 1620)
        
        guard let url = URL(string: "https://www.apple.com/newsroom/images/live-action/rosenthaler-strasse-store-opening/Apple_nso-rosenthaler-strasse_Hero_11302021_Full-Bleed-Image.jpg.large_2x.jpg") else { return }
        
        do {
            let imageData = try Data(contentsOf: url)
            guard let image = UIImage(data: imageData) else { fatalError() }
            let imageView = UIImageView(image: image)
            
            scrollView.contentSize = imageView.frame.size
            scrollView.minimumZoomScale = 0.1
            scrollView.addSubview(imageView)
        } catch let errorData {
            print(errorData.localizedDescription)
        }
        
    
    }

}
