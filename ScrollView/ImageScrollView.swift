//
//  ImageScrollView.swift
//  ScrollView
//
//  Created by Sergey Lukaschuk on 24.01.2022.
//

import UIKit

class ImageScrollView: UIScrollView, UIScrollViewDelegate {

    private var imageZoomView: UIImageView!
    
    func set(image: UIImage) {
        imageZoomView?.removeFromSuperview()
        imageZoomView = nil
        imageZoomView = UIImageView(image: image)
        self.addSubview(imageZoomView)
        configureFor(image.size)
    }
    
    private func configureFor(_ imageSize: CGSize) {
        self.contentSize = imageSize
//        self.minimumZoomScale = 0.1
//        self.maximumZoomScale = 5.0
        setCurrentMaxMinZoomScale()
    }
    
    private func setCurrentMaxMinZoomScale() {
        let boundsSize = self.bounds.size
        let imageSize = imageZoomView.bounds.size
        
        let xScale = boundsSize.width / imageSize.width
        let yScale = boundsSize.height / imageSize.height
        
        let minScale = min(xScale, yScale)
        
        self.minimumZoomScale = minScale
    }
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIScrollViewDelegate
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        self.imageZoomView
    }
}
