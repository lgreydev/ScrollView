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
    
    // MARK: - Private Methods
    private func configureFor(_ imageSize: CGSize) {
        self.contentSize = imageSize
        setCurrentMaxMinZoomScale()
    }
    
    private func setCurrentMaxMinZoomScale() {
        let boundsSize = self.bounds.size
        let imageSize = imageZoomView.bounds.size
        
        let xScale = boundsSize.width / imageSize.width
        let yScale = boundsSize.height / imageSize.height
        let minScale = min(xScale, yScale)
        
        var maxScale: CGFloat = 1.0
        if minScale < 0.1 { maxScale = 0.3 }
        if minScale >= 0.1 && minScale < 0.5 { maxScale = 0.7 }
        if minScale >= 0.5 { maxScale = max(1.0, minScale)}
        
        self.minimumZoomScale = minScale
        self.maximumZoomScale = maxScale
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
