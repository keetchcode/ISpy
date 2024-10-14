//
//  ViewController.swift
//  ISpy
//
//  Created by Wesley Keetch on 10/14/24.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

  @IBOutlet weak var scrollView: UIScrollView!

  @IBOutlet weak var imageView: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    scrollView.delegate = self
  }

  override func viewDidAppear(_ animated: Bool) {
    updateZoomForSize(size: view.bounds.size)
  }

  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return imageView
  }

  func updateZoomForSize(size: CGSize) {
    let widthScale = size.width / imageView.bounds.width
    let heightScale = size.height / imageView.bounds.height
    let scale = min(widthScale, heightScale)
    scrollView.minimumZoomScale = scale
    scrollView.zoomScale = scale
  }
}

