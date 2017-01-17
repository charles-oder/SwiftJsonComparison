//
//  JsonLoader.swift
//  ProphetX
//
//  Created by Charles Oder on 8/22/16.
//  Copyright © 2016 DTN. All rights reserved.
//

import UIKit

public class JsonLoader {

    public func loadTestJSON(jsonFileName: String) -> String {
        let bundle = Bundle(for: type(of: self))
        let fileLocation = bundle.path(forResource: jsonFileName, ofType: "json")!
        let fileContents :String
        do {
            fileContents = try String(contentsOfFile: fileLocation)
        }
        catch {
            assertionFailure("Error: Did not load Test JSON")
            fileContents = ""
        }
        return fileContents
    }
}
