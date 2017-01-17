//
//  ObjectMapperTests.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import XCTest
import ObjectMapper

class ObjectMapperTests: XCTestCase {
    
    
    func deserializeLargeComplexObject(jsonString: String) -> LargeComplexFile? {
        return Mapper<OMLargeComplexFile>().map(JSONString: jsonString)
    }
    
    func serializeLargeComplexObject(_ object: LargeComplexFile) -> String? {
        return (object as? OMLargeComplexFile)?.toJSONString()
    }
    
    func testSerializeLargeComplexObject1000Times() {
        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "LargeComplexFIle")
        
        let testObject = self.deserializeLargeComplexObject(jsonString: jsonString) as? OMLargeComplexFile
        var jsonOutput: String?
        
        self.measure {
            for _ in 1...1000 {
                jsonOutput = self.serializeLargeComplexObject(testObject!)
            }
        }
        
        XCTAssertEqual(true, jsonOutput?.contains("5% of more than 50 bags"))
        
    }
    
    func testDeserializeLargeComplexObject1000Times() {
        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "LargeComplexFIle")
        
        var testObject: LargeComplexFile!
        self.measure {
            for _ in 1...1000 {
                testObject = self.deserializeLargeComplexObject(jsonString: jsonString)
            }
        }


        XCTAssertEqual(4, testObject?.orders.count)
        XCTAssertEqual(4, testObject?.total)
        XCTAssertEqual(4, testObject?.unfilteredTotal)
        
        guard let _  = testObject?.orders.first else {
            XCTFail("Not enough orders")
            return
        }
        let order_1 = testObject?.orders.removeFirst()
        XCTAssertEqual(3, order_1?.orderId)
        XCTAssertEqual("2016-04-26", order_1?.date)
        XCTAssertEqual("pending", order_1?.status)
        XCTAssertEqual(1, order_1?.orderForm?.orderFormId)
        XCTAssertEqual("Order Form", order_1?.orderForm?.name)
        XCTAssertEqual(1, order_1?.orderForm?.active)
        XCTAssertEqual(1, order_1?.orderForm?.season?.id)
        XCTAssertEqual("Spring 2016", order_1?.orderForm?.season?.name)
        XCTAssertEqual(2016, order_1?.orderForm?.season?.year)
        XCTAssertEqual(1, order_1?.orderForm?.salesTerritories.count)
        XCTAssertEqual(1, order_1?.orderForm?.salesTerritories.first?.id)
        XCTAssertEqual("North Territory", order_1?.orderForm?.salesTerritories.first?.name)
        XCTAssertEqual(1, order_1?.orderForm?.solutions.count)
        XCTAssertEqual(1, order_1?.orderForm?.solutions.first?.solutionId)
        XCTAssertEqual("DK-01", order_1?.orderForm?.solutions.first?.displayName)
        XCTAssertEqual(1, order_1?.orderForm?.solutions.first?.deviations.count)
        XCTAssertEqual("+-1%", order_1?.orderForm?.solutions.first?.deviations.first)
        XCTAssertEqual(2, order_1?.orderForm?.solutions.first?.category?.id)
        XCTAssertEqual("Nutrient Management", order_1?.orderForm?.solutions.first?.category?.name)
        XCTAssertEqual(1, order_1?.orderForm?.solutions.first?.discountPrograms.count)
        XCTAssertEqual(1, order_1?.orderForm?.solutions.first?.discountPrograms.first?.discountId)
        XCTAssertEqual("Volume Volume Volume", order_1?.orderForm?.solutions.first?.discountPrograms.first?.name)
        XCTAssertEqual("5% of more than 50 bags", order_1?.orderForm?.solutions.first?.discountPrograms.first?.programDescription)
        XCTAssertEqual(1, order_1?.orderForm?.solutions.first?.discountPrograms.first?.active)
        XCTAssertEqual("%-5.00volume(50)", order_1?.orderForm?.solutions.first?.discountPrograms.first?.operation)
        XCTAssertEqual(1, order_1?.orderForm?.paymentTerms.count)
        XCTAssertEqual(1, order_1?.orderForm?.paymentTerms.first?.paymentTermId)
        XCTAssertEqual("Prepay discount", order_1?.orderForm?.paymentTerms.first?.name)
        XCTAssertEqual("3% off", order_1?.orderForm?.paymentTerms.first?.paymentTermDescription)
        XCTAssertEqual(1, order_1?.orderForm?.paymentTerms.first?.active)
        XCTAssertEqual("%-3.00", order_1?.orderForm?.paymentTerms.first?.operation)
        XCTAssertEqual("small print goes here", order_1?.orderForm?.templateTerms)
        XCTAssertEqual("2016-04-26", order_1?.orderForm?.createdDateString)
        XCTAssertEqual(1, order_1?.orderForm?.createdById)
        XCTAssertEqual("2016-04-26", order_1?.orderForm?.modifiedDateString)
        XCTAssertEqual(1, order_1?.orderForm?.modifiedById)
        XCTAssertEqual(1, order_1?.idOrderForm)
        XCTAssertEqual(1234.56, order_1?.total)
        XCTAssertEqual(1, order_1?.items?.count)
        XCTAssertEqual(5, order_1?.items?.first?.idSolution)
        XCTAssertEqual("DK-01", order_1?.items?.first?.displayName)
        XCTAssertEqual(1258.92, order_1?.items?.first?.subTotal)
        XCTAssertEqual(156, order_1?.items?.first?.quantity)
        XCTAssertEqual(1, order_1?.items?.first?.idDiscountProgram)
        XCTAssertEqual(8.07, order_1?.items?.first?.price)
        XCTAssertEqual(1, order_1?.customer?.id)
        XCTAssertEqual("George Sanders", order_1?.customer?.displayName)
        XCTAssertEqual(30, order_1?.salesRep?.id)
        XCTAssertEqual("Jason Fossella", order_1?.salesRep?.displayName)
        XCTAssertEqual("Some text", order_1?.note)
        XCTAssertEqual("2016-04-26", order_1?.startDeliveryDate)
        XCTAssertEqual("2016-07-24", order_1?.endDeliveryDate)
        XCTAssertEqual("2016-04-26T15:19:21+00:00", order_1?.createdDate)
        XCTAssertEqual(1, order_1?.createdById)
        XCTAssertEqual("2016-04-26T15:19:21+00:00", order_1?.modifiedDate)
        XCTAssertEqual(1, order_1?.modifiedId)
        
        
    }
    
}
