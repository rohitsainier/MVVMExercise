//
//  HomeModel.swift
//  VIPERModule
//
//  Created by Rohit Saini on 27/02/21.
//

// MARK: - User
struct User: Codable {
    let id: Int
    let name, username, email: String
    let address: Address?
    let phone, website: String
    let company: Company?
    var isFavourite:Bool
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id  = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        username = try values.decodeIfPresent(String.self, forKey: .username) ?? ""
        email = try values.decodeIfPresent(String.self, forKey: .email) ?? ""
        address = try values.decodeIfPresent(Address.self, forKey: .address) ?? nil
        phone = try values.decodeIfPresent(String.self, forKey: .phone) ?? ""
        website = try values.decodeIfPresent(String.self, forKey: .website) ?? ""
        company = try values.decodeIfPresent(Company.self, forKey: .company) ?? nil
        isFavourite = try values.decodeIfPresent(Bool.self, forKey: .isFavourite) ?? false
    }
    
    init(id: Int, name: String, username: String, email: String, address: Address?, phone: String, website: String, company: Company?, isFavourite: Bool) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
        self.isFavourite = isFavourite
    }
    
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        street = try values.decodeIfPresent(String.self, forKey: .street) ?? ""
        suite = try values.decodeIfPresent(String.self, forKey: .suite) ?? ""
        city = try values.decodeIfPresent(String.self, forKey: .city) ?? ""
        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode) ?? ""
        geo = try values.decodeIfPresent(Geo.self, forKey: .geo) ?? nil
    }
    
    init(street: String, suite: String, city: String, zipcode: String, geo: Geo?) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
}

// MARK: - Geo
struct Geo: Codable {
    
    let lat, lng: String
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(String.self, forKey: .lat) ?? ""
        lng = try values.decodeIfPresent(String.self, forKey: .lng) ?? ""
    }
    
     init(lat: String, lng: String) {
        self.lat = lat
        self.lng = lng
    }
}

// MARK: - Company
struct Company: Codable {
    
    let name, catchPhrase, bs: String
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        catchPhrase = try values.decodeIfPresent(String.self, forKey: .catchPhrase) ?? ""
        bs = try values.decodeIfPresent(String.self, forKey: .bs) ?? ""
    }
    
    init(name: String, catchPhrase: String, bs: String) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
}


