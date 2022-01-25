//
//  ImageScrollView.swift
//  ScrollView
//
//  Created by Sergey Lukaschuk on 24.01.2022.
//

import UIKit

class ImageScrollView: UIScrollView {

    private var imageZoomView: UIImageView!
    
    func set(image: UIImage) {
        imageZoomView?.removeFromSuperview()
        imageZoomView = nil
        imageZoomView = UIImageView(image: image)
        self.addSubview(imageZoomView)
        configureFor(image.size)
    }
    
    func configureFor(_ imageSize: CGSize) {
        self.contentSize = imageSize
    }
}
