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
    @IBOutlet var scriptureReference: UILabel!
    
    @IBOutlet var theView: UIView!
    let randomScriptures =
        [Scripture(reference: "1 Nephi 3:7", scripture: "And it came to pass ... 1"),
         Scripture(reference: "1 Nephi 3:8", scripture: "that I nephi ... 2"),
         Scripture(reference: "1 Nephi 3:9", scripture: "that I nephi ... 2"),
         Scripture(reference: "Helaman 3:2", scripture: "that I nephi ... 2"),
         Scripture(reference: "D&C 4:1", scripture: "and do the thing which the lord hath commanded, for I know that the lord giveth no commandment unto the children of men save he shall prepare a way for them ... 5")
    ]

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
        scriptureReference.swipeAnimation(transitionType: kCATransitionFromRight)

        let scripture = randomScriptures[index]
        scriptureReference.text = scripture.reference
        scriptureLabel.text = scripture.scripture
        
    }
    
    func prevScrip() {
        if index <= 0 {
            index = 4
        } else {
            index -= 1
        }
        scriptureLabel.swipeAnimation(transitionType: kCATransitionFromLeft)
        scriptureReference.swipeAnimation(transitionType: kCATransitionFromLeft)

        let scripture = randomScriptures[index]
        scriptureReference.text = scripture.reference
        scriptureLabel.text = scripture.scripture

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

