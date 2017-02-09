//
//  ViewController.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.frame = view.bounds.insetBy(dx: 10, dy: 50)
        view.addSubview(textView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue(label: "running-tests").async { [weak self] in
            self?.runTests()
        }
    }

    func runTests() {
        clearText()
        appendText("Test, Average, High, Low, StandardDev\n")
        appendText("\n")
        BaseTests().runTests(dataReceived: { testResult in
            appendText(testResult)
        })
        appendText("\n")
        GlossTests().runTests(dataReceived: { testResult in
            appendText(testResult)
        })
        appendText("\n")
        ObjectMapperTests().runTests(dataReceived: { testResult in
            appendText(testResult)
        })
        appendText("\n")
        SwiftyJSONTests().runTests(dataReceived: { testResult in
            appendText(testResult)
        })
    }
    
    func clearText() {
        DispatchQueue.main.async { [weak self] in
            self?.textView.text = ""
        }
    }
    
    func appendText(_ text: String) {
        DispatchQueue.main.async { [weak self] in
            guard let view = self?.textView else { return }
            view.text = view.text + text
        }
    }
    
}

