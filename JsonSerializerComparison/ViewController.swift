//
//  ViewController.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var analyzeButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var iterationsTextField: UITextField!
    @IBOutlet weak var overlay: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var results = [String: [String: TestResult]]()
    
    var iterations: Int {
        return Int(iterationsTextField.text ?? "10") ?? 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overlay.isHidden = true
        iterationsTextField.text = "1000"
    }
    
    @IBAction func runButtonTapped(_ sender: Any) {
        showOverlay(show: true)
        DispatchQueue(label: "running-tests").async { [weak self] in
            self?.runTests()
            self?.showOverlay(show: false)
            DispatchQueue.main.async { [weak self] in
                self?.analyzeButton.isHidden = false
            }
        }
    }
    
    func showOverlay(show: Bool) {
        DispatchQueue.main.async { [weak self] in
            if show {
                self?.activityIndicator.startAnimating()
            } else {
                self?.activityIndicator.stopAnimating()
            }
            self?.overlay.isHidden = !show
        }
    }
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        let activityController = UIActivityViewController(activityItems: [textView.text], applicationActivities: nil)
        let popover = activityController.popoverPresentationController
        popover?.sourceView = sender
        popover?.sourceRect = sender.bounds
        present(activityController, animated: true, completion: nil)

    }

    func runTests() {
        clearText()
        appendText("Running \(iterations) iterations of each test...\n\n")
        appendText("Test, Average, High, Low, StandardDev\n")
        appendText("\n")
        results = [:]
        let baseTests = BaseTests(iterations: iterations)
        results[baseTests.testName] = baseTests.runTests(dataReceived: { testResult in
            appendText(testResult)
            
        })
        appendText("\n")
        let glossTests = GlossTests(iterations: iterations)
        results[glossTests.testName] = glossTests.runTests(dataReceived: { testResult in
            appendText(testResult)
        })
        appendText("\n")
        let objectMapperTests = ObjectMapperTests(iterations: iterations)
        results[objectMapperTests.testName] = objectMapperTests.runTests(dataReceived: { testResult in
            appendText(testResult)
        })
        appendText("\n")
        let swiftyJsonTests = SwiftyJSONTests(iterations: iterations)
        results[swiftyJsonTests.testName] = swiftyJsonTests.runTests(dataReceived: { testResult in
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let analyzeViewController = segue.destination as? AnalyzeResutlsViewController {
            analyzeViewController.results = results
        }
    }
    
}

