//
//  TestResult.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 2/9/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Foundation

public struct TestResult {
    let values: [Double]
}

public extension TestResult {

    static var serializeLargeComplexObject: String {
        return "SerializeLargeComplexObject"
    }
    static var deserializeLargeComplexObject: String {
        return "DeserializeLargeComplexObject"
    }
    static var serializeMediumFile: String {
        return "SerializeMediumFile"
    }
    static var deserializeMediumFile: String {
        return "DeserializeMediumFile"
    }
    static var serializeLargeSimpleArray: String {
        return "SerializeLargeSimpleArray"
    }
    static var deserializeLargeSimpleArray: String {
        return "DeserializeLargeSimpleArray"
    }
}

public extension TestResult {
    var max: Double? {
        return values.max()
    }
    
    var maxString: String {
        if let x = max {
            return String(format: "%.6f", x)
        }
        return "--"
    }
    
    var min: Double? {
        return values.min()
    }
    
    var minString: String {
        if let x = min {
            return String(format: "%.6f", x)
        }
        return "--"
    }
    
    var mean: Double? {
        return simpleAverage(values)
    }
    
    var meanString: String {
        if let x = mean {
            return String(format: "%.6f", x)
        }
        return "--"
    }
    
    private func sum(_ valueList: [Double]) -> Double {
        var total = 0.0
        for val in valueList {
            total += val
        }
        return total
    }
    
    private func simpleAverage(_ valueList: [Double]) -> Double? {
        guard valueList.count > 0 else {
            return nil
        }
        return sum(valueList) / Double(valueList.count)
    }
    
    var standardDeviation: Double? {
        guard let mean = self.mean else {
            return nil
        }
        var squares = [Double]()
        for val in values {
            let x = val - mean
            squares.append(x * x)
        }
        guard let standardDevMean = simpleAverage(squares) else {
            return nil
        }
        
        return sqrt(standardDevMean)
    }
    
    var standardDeviationString: String {
        if let x = standardDeviation {
            return String(format: "%.6f", x)
        }
        return "--"
    }
    
}
