//
//  ViewController.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let textView = UITextView(frame: view.bounds.insetBy(dx: 10, dy: 50))
        
        textView.text = runTests()
        view.addSubview(textView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    func runTests() -> String {
        var output = ""
        output += BaseTests().runTests()
        return output
    }
}

