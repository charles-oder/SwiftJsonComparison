//
//  AnalyzeResultsViewController.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 2/9/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import UIKit

class AnalyzeResutlsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    let reuseId = "test_result_cell"
    var results = [String: [String: TestResult]]() {
        didSet {
            keys = []
            for (key, _) in results {
                keys.append(key)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        processData()
    }
    
    class MinMax {
        
        init() {
            min = Double.greatestFiniteMagnitude
            max = 0.0
        }
        
        var min: Double
        var max: Double
    }
    var minMaxes = [String: MinMax]()
    
    func processData() {
        minMaxes = [:]
        for (_, tests) in results {
            for (testName, result) in tests {
                if minMaxes[testName] == nil {
                    minMaxes[testName] = MinMax()
                }
                if let mean = result.mean {
                    if minMaxes[testName]!.max < mean {
                        minMaxes[testName]!.max = mean
                    }
                    if minMaxes[testName]!.min > mean {
                        minMaxes[testName]!.min = mean
                    }
                }
            }
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    var keys = [String]()

    func numberOfSections(in tableView: UITableView) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        return results[key]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId) as! TestResultCell
        let sectionKey = keys[indexPath.section]
        let testResultSet = results[sectionKey] ?? [:]
        let keyset = Array(testResultSet.keys)
        let key = keyset[indexPath.row]
        let testResult = testResultSet[key]
        cell.nameLabel.text = key
        cell.timeLabel.text = testResult?.meanString
        cell.timeLabel.backgroundColor = getMainColor(max: minMaxes[key]?.max, min:minMaxes[key]?.min, value: testResult?.mean)
        
        let difference = (testResult?.mean ?? 0) - (minMaxes[key]?.min ?? 0)
        cell.timeDifferenceLabel.text = String(format: "+%.6f", difference)
        cell.timeDifferenceLabel.backgroundColor = getDifferenceColor(max: minMaxes[key]?.max, min:minMaxes[key]?.min, value: testResult?.mean)
        return cell
    }
    
    func getMainColor(max: Double?, min: Double?, value: Double?) -> UIColor {
        if value == min {
            return UIColor.green
        } else if value == max {
            return UIColor.red
        } else {
            return UIColor.clear
        }
    }
    
    func getDifferenceColor(max: Double?, min: Double?, value: Double?) -> UIColor {
        guard let maxValue = max else { return UIColor.clear }
        guard let minValue = min else { return UIColor.clear }
        guard let val = value else { return UIColor.clear }
        let range = maxValue - minValue
        let red = ((val - minValue) / range) * 255
        let green = ((maxValue - val) / range) * 255
        let color = UIColor(colorLiteralRed: Float(red), green: Float(green), blue: 0.0, alpha: 1.0)
        //let color = UIColor(colorLiteralRed: 128, green: 128, blue: 0.0, alpha: 1.0)
        return color
    }
    
}

class TestResultCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeDifferenceLabel: UILabel!
    
}
