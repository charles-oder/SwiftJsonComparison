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
        output += "Native JSON Serialization\n"
        output += BaseTests().runTests()
        output += "\n\n\nGloss\n"
        output += GlossTests().runTests()
        output += "\n\n\nObjectMapper\n"
        output += ObjectMapperTests().runTests()
        output += "\n\n\nSwiftyJSON w/ SwiftyJSONAccellorator\n"
        output += SwiftyJSONTests().runTests()
        return output
    }
}

