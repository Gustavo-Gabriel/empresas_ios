//
//  Enterprise.swift
//  empresas_ios
//
//  Created by Gustavo Anjos on 27/01/21.
//

import Foundation

struct EnterpriseList: Codable {
    public var enterprises: [Enterprise]
}

struct Enterprise: Codable {
    public var email_enterprise: String?
    public var facebook: String?
    public var twitter: String?
    public var linkedin: String?
    public var phone: String?
    public var own_enterprise: Bool
    public var enterprise_name: String
    public var photo: String
    public var description: String
    public var city: String
    public var country: String
    public var value: Int
    public var share_price: Double
    public var enterprise_type: EnterpriseType
}

struct EnterpriseType: Codable {
    public var id: Int
    public var enterprise_type_name: String
}
