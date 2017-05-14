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
    let randomScriptures = ["random 1", "random 2", "random 3", "random 4", "random 5"]

    let swipeRightRecognizer = UISwipeGestureRecognizer()
    let swipeLeftRecognizer = UISwipeGestureRecognizer()
    
    var index = 0;
    
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
            print("Right...")
            prevScrip()
        case UISwipeGestureRecognizerDirection.left:
            nextScrip()
            print("Left...")
        default:
            print("Who cares...")
        }
        print("Swiped i guess")
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
        scriptureLabel.text = randomScriptures[index]
    }
    
    func prevScrip() {
        if index <= 0 {
            index = 4
        } else {
            index -= 1
        }
        scriptureLabel.text = randomScriptures[index]
    }
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        print("refresh")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
    }
}

