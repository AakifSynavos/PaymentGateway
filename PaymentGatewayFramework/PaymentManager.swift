//
//  PaymentManager.swift
//  PaymentGatewayFramework
//
//  Created by Aakif Nadeem on 11/10/2021.
//

import Foundation
import UIKit
import PayPalCheckout

public class PaymentManager
{
    public static var shared = PaymentManager()
    
    public func test()
    {
        print("testing framework")
    }
}

struct PaymentMethodModel
{
    var balance: Double
    var description: String
    var walletCurrency: String
    var country : String
    var phoneNumber: String
    var clientID : String
}
