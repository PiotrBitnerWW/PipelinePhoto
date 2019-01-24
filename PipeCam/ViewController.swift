//
//  ViewController.swift
//  PipeCam
//
//  Created by Piotr Bitner on 23/01/2019.
//  Copyright © 2019 Piotr Bitner. All rights reserved.
//

import UIKit

protocol TakingPhoto: class {
  func photoTaken(data: Data?)
}

class ViewController: UIViewController, TakingPhoto {

  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func takePhotoAction(sender: UIButton) {
    takePhoto()
  }

  func takePhoto() {
    
    let ctrl = self.storyboard!.instantiateViewController(withIdentifier: "CameraViewController") as! CameraViewController
    ctrl.modalTransitionStyle = .flipHorizontal
    ctrl.modalPresentationStyle = .fullScreen
    ctrl.delegate = self;
    self.present(ctrl, animated: true) {
      
    }
    
  }
  
  func photoTaken(data: Data?){
    if let imageData = data {
      let image = UIImage(data: imageData)
      imageView.alpha = 1.0
      imageView.image = image
    }
  }
  
}

