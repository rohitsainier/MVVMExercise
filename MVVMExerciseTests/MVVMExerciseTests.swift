//
//  MVVMExerciseTests.swift
//  MVVMExerciseTests
//
//  Created by Rohit Saini on 28/02/21.
//

import XCTest
@testable import MVVMExercise

class MVVMExerciseTests: XCTestCase {

    var viewModel: HomeViewModel?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = HomeViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
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
        XCTAssertEqual(company.name,"Romaguera-Cron")
    }
    
    func testFetchUser() throws{
        let userExpectation = expectation(description: "users")
        let session: URLSession = .shared
        var users = [User]()
        session.request(.users, using: Void()) {(result) in
            userExpectation.fulfill()
            switch result{
            case .success(let response):
                users = response
            case .failure(let _):
                users = []
            }
        }
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertNotNil(users)
            XCTAssertTrue(users.count > 0)
            XCTAssertTrue(users.first?.id == 1)
        }
    }
    
    func testMarkFavouriteAndUnFavouriteUser() throws{
        guard
            let path = Bundle.main.path(forResource: "dummy", ofType: "json")
        else { fatalError("Can't find dummy.json file") }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let response = try JSONDecoder().decode([User].self, from: data)
        viewModel?.users = response
        var lastUser = response.last!
        lastUser.isFavourite = true
        viewModel?.updateUserById(user: lastUser)
        
        //Mark last user Favourite
        XCTAssertEqual(viewModel?.users.last?.isFavourite, true)
        
        //Mark last user Non Favourite
        lastUser.isFavourite = false
        viewModel?.updateUserById(user: lastUser)
        XCTAssertEqual(viewModel?.users.last?.isFavourite, false)
        
    }

}
