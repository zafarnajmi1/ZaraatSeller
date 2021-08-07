//
//  Orders.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 1/28/21.
//  Copyright © 2021 User. All rights reserved.
//

import Foundation
struct MyOrders : Codable {
    let message : String?
    let orders : [Orders]?
    let status : Int?
    let success : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case orders = "orders"
        case status = "status"
        case success = "success"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        orders = try values.decodeIfPresent([Orders].self, forKey: .orders)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}


struct Order : Codable {
    let order_id : Int?
    let customer_id : Int?
    let user_id : String?
    let shipping_id : Int?
    let billing_id : Int?
    let payment_method : String?
    let transection_uuid : String?
    let cn_cod : String?
    let order_date : String?
    let status : String?
    let total_price : String?
    let created_at : String?
    let updated_at : String?
    let customer : OrdersCustomer?

    enum CodingKeys: String, CodingKey {

        case order_id = "order_id"
        case customer_id = "customer_id"
        case user_id = "user_id"
        case shipping_id = "shipping_id"
        case billing_id = "billing_id"
        case payment_method = "payment_method"
        case transection_uuid = "transection_uuid"
        case cn_cod = "cn_cod"
        case order_date = "order_date"
        case status = "status"
        case total_price = "total_price"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case customer = "customer"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        order_id = try values.decodeIfPresent(Int.self, forKey: .order_id)
        customer_id = try values.decodeIfPresent(Int.self, forKey: .customer_id)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
        shipping_id = try values.decodeIfPresent(Int.self, forKey: .shipping_id)
        billing_id = try values.decodeIfPresent(Int.self, forKey: .billing_id)
        payment_method = try values.decodeIfPresent(String.self, forKey: .payment_method)
        transection_uuid = try values.decodeIfPresent(String.self, forKey: .transection_uuid)
        cn_cod = try values.decodeIfPresent(String.self, forKey: .cn_cod)
        order_date = try values.decodeIfPresent(String.self, forKey: .order_date)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        total_price = try values.decodeIfPresent(String.self, forKey: .total_price)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        customer = try values.decodeIfPresent(OrdersCustomer.self, forKey: .customer)
    }

}


struct Orders : Codable {
    let item_id : Int?
    let order_id : Int?
    let product_id : Int?
    let price : String?
    let order_quantity : String?
    let variations : String?
    let created_at : String?
    let updated_at : String?
    let product : Product?
    let order : Order?

    enum CodingKeys: String, CodingKey {

        case item_id = "item_id"
        case order_id = "order_id"
        case product_id = "product_id"
        case price = "price"
        case order_quantity = "order_quantity"
        case variations = "variations"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case product = "product"
        case order = "order"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        item_id = try values.decodeIfPresent(Int.self, forKey: .item_id)
        order_id = try values.decodeIfPresent(Int.self, forKey: .order_id)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        order_quantity = try values.decodeIfPresent(String.self, forKey: .order_quantity)
        variations = try values.decodeIfPresent(String.self, forKey: .variations)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        product = try values.decodeIfPresent(Product.self, forKey: .product)
        order = try values.decodeIfPresent(Order.self, forKey: .order)
    }

}


struct OrdersCustomer : Codable {
    let customer_id : Int?
    let first_name : String?
    let last_name : String?
    let email : String?
    let provider_id : String?
    let provider : String?
    let phone : String?
    let password : String?
    let gender : String?
    let picture : String?
    let status : Int?
    let fcm_token : String?
    let created_at : String?
    let updated_at : String?
    let billing : Billing?
    let shipping : Shipping?

    enum CodingKeys: String, CodingKey {

        case customer_id = "customer_id"
        case first_name = "first_name"
        case last_name = "last_name"
        case email = "email"
        case provider_id = "provider_id"
        case provider = "provider"
        case phone = "phone"
        case password = "password"
        case gender = "gender"
        case picture = "picture"
        case status = "status"
        case fcm_token = "fcm_token"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case billing = "billing"
        case shipping = "shipping"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        customer_id = try values.decodeIfPresent(Int.self, forKey: .customer_id)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        provider_id = try values.decodeIfPresent(String.self, forKey: .provider_id)
        provider = try values.decodeIfPresent(String.self, forKey: .provider)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        picture = try values.decodeIfPresent(String.self, forKey: .picture)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        fcm_token = try values.decodeIfPresent(String.self, forKey: .fcm_token)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        billing = try values.decodeIfPresent(Billing.self, forKey: .billing)
        shipping = try values.decodeIfPresent(Shipping.self, forKey: .shipping)
    }

}


struct Billing : Codable {
    let billing_id : Int?
    let customer_id : Int?
    let billing_address : String?
    let billing_phone : String?
    let billing_person_name : String?
    let billing_country : String?
    let billing_state : String?
    let billing_city : String?
    let billing_zipcode : String?
    let billing_longitude : String?
    let billing_latitude : String?
    let billing_status : String?
    let address_type : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case billing_id = "billing_id"
        case customer_id = "customer_id"
        case billing_address = "billing_address"
        case billing_phone = "billing_phone"
        case billing_person_name = "billing_person_name"
        case billing_country = "billing_country"
        case billing_state = "billing_state"
        case billing_city = "billing_city"
        case billing_zipcode = "billing_zipcode"
        case billing_longitude = "billing_longitude"
        case billing_latitude = "billing_latitude"
        case billing_status = "billing_status"
        case address_type = "address_type"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        billing_id = try values.decodeIfPresent(Int.self, forKey: .billing_id)
        customer_id = try values.decodeIfPresent(Int.self, forKey: .customer_id)
        billing_address = try values.decodeIfPresent(String.self, forKey: .billing_address)
        billing_phone = try values.decodeIfPresent(String.self, forKey: .billing_phone)
        billing_person_name = try values.decodeIfPresent(String.self, forKey: .billing_person_name)
        billing_country = try values.decodeIfPresent(String.self, forKey: .billing_country)
        billing_state = try values.decodeIfPresent(String.self, forKey: .billing_state)
        billing_city = try values.decodeIfPresent(String.self, forKey: .billing_city)
        billing_zipcode = try values.decodeIfPresent(String.self, forKey: .billing_zipcode)
        billing_longitude = try values.decodeIfPresent(String.self, forKey: .billing_longitude)
        billing_latitude = try values.decodeIfPresent(String.self, forKey: .billing_latitude)
        billing_status = try values.decodeIfPresent(String.self, forKey: .billing_status)
        address_type = try values.decodeIfPresent(String.self, forKey: .address_type)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}


struct Shipping : Codable {
    let shipping_id : Int?
    let customer_id : Int?
    let shipping_address : String?
    let shipping_phone : String?
    let shipping_person_name : String?
    let shipping_country : String?
    let shipping_state : String?
    let shipping_city : String?
    let shipping_zipcode : String?
    let shipping_longitude : String?
    let shipping_latitude : String?
    let shipping_status : String?
    let address_type : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case shipping_id = "shipping_id"
        case customer_id = "customer_id"
        case shipping_address = "shipping_address"
        case shipping_phone = "shipping_phone"
        case shipping_person_name = "shipping_person_name"
        case shipping_country = "shipping_country"
        case shipping_state = "shipping_state"
        case shipping_city = "shipping_city"
        case shipping_zipcode = "shipping_zipcode"
        case shipping_longitude = "shipping_longitude"
        case shipping_latitude = "shipping_latitude"
        case shipping_status = "shipping_status"
        case address_type = "address_type"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        shipping_id = try values.decodeIfPresent(Int.self, forKey: .shipping_id)
        customer_id = try values.decodeIfPresent(Int.self, forKey: .customer_id)
        shipping_address = try values.decodeIfPresent(String.self, forKey: .shipping_address)
        shipping_phone = try values.decodeIfPresent(String.self, forKey: .shipping_phone)
        shipping_person_name = try values.decodeIfPresent(String.self, forKey: .shipping_person_name)
        shipping_country = try values.decodeIfPresent(String.self, forKey: .shipping_country)
        shipping_state = try values.decodeIfPresent(String.self, forKey: .shipping_state)
        shipping_city = try values.decodeIfPresent(String.self, forKey: .shipping_city)
        shipping_zipcode = try values.decodeIfPresent(String.self, forKey: .shipping_zipcode)
        shipping_longitude = try values.decodeIfPresent(String.self, forKey: .shipping_longitude)
        shipping_latitude = try values.decodeIfPresent(String.self, forKey: .shipping_latitude)
        shipping_status = try values.decodeIfPresent(String.self, forKey: .shipping_status)
        address_type = try values.decodeIfPresent(String.self, forKey: .address_type)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
