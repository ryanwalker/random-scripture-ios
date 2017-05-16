//
//  ViewController.swift
//  RandomScripture
//
//  Created by Ryan Walker on 5/6/17.
//  Copyright © 2017 Ryan Walker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scriptureLabel: UILabel!
    
    @IBOutlet var theView: UIView!
    let randomScriptures = ["And it came to pass ... 1",
                            "that I nephi ... 2",
                            "said unto my father ... 3",
                            "I will go ... 4",
                            "and do ... 5"]

    let swipeRightRecognizer = UISwipeGestureRecognizer()
    let swipeLeftRecognizer = UISwipeGestureRecognizer()
    
    var index = -1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeRightRecognizer.direction = .right
        swipeLeftRecognizer.direction = .left
        
        swipeRightRecognizer.addTarget(self, action: #selector(swiped))
        swipeLeftRecognizer.addTarget(self, action: #selector(swiped))

        theView.addGestureRecognizer(swipeRightRecognizer)
        theView.addGestureRecognizer(swipeLeftRecognizer)

        theView.isUserInteractionEnabled = true
    }

    
    func swiped(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            prevScrip()
        case UISwipeGestureRecognizerDirection.left:
            nextScrip()
        default: break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nextScrip()
    }
    
    func nextScrip() {
        if index >= 4 {
            index = 0
        } else {
            index += 1
        }
        scriptureLabel.swipeAnimation(transitionType: kCATransitionFromRight)
        scriptureLabel.text = randomScriptures[index]
    }
    
    func prevScrip() {
        if index <= 0 {
            index = 4
        } else {
            index -= 1
        }
        scriptureLabel.swipeAnimation(transitionType: kCATransitionFromLeft)
        scriptureLabel.text = randomScriptures[index]
    }
    

}

extension UIView {
    
    func swipeAnimation(transitionType: String) {
        let swipeTransition = CATransition()
        
        swipeTransition.type = kCATransitionPush
        swipeTransition.subtype = transitionType
        swipeTransition.duration = 0.5
        swipeTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        swipeTransition.fillMode = kCAFillModeRemoved
        
        self.layer.add(swipeTransition, forKey: "swipeTransition")
        
    }
    
}

