//
//  MVVMExerciseTests.swift
//  MVVMExerciseTests
//
//  Created by Rohit Saini on 28/02/21.
//

import XCTest
@testable import MVVMExercise

class MVVMExerciseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testUserListResponse() throws {
        guard
            let path = Bundle.main.path(forResource: "dummy", ofType: "json")
        else { fatalError("Can't find dummy.json file") }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let response = try JSONDecoder().decode([User].self, from: data)
        XCTAssertNotNil(response)
        XCTAssertTrue(response.count > 0)
        XCTAssertEqual(response.count, 10)
        
         let lastUser = response.last!
        
        XCTAssertEqual(lastUser.id, 10)
        XCTAssertEqual(lastUser.email, "Rey.Padberg@karina.biz")
        XCTAssertEqual(lastUser.name, "Clementina DuBuque")
        XCTAssertEqual(lastUser.username,"Moriah.Stanton")
        
        let firstUser = response.first!
        
        XCTAssertEqual(firstUser.id, 1)
        XCTAssertEqual(firstUser.email, "Sincere@april.biz")
        XCTAssertEqual(firstUser.name, "Leanne Graham")
        XCTAssertEqual(firstUser.username,"Bret")
        
        let address = response.first!.address!
        
        XCTAssertNotNil(address)
        XCTAssertEqual(address.city,"Gwenborough")
        
        let company = response.first!.company!
        
        XCTAssertNotNil(company)
        XCTAssertEqual(company.name,"Romaguera-Crona")
    }
    
    

}
