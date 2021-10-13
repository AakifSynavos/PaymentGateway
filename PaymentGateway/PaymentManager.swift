//
//  PaymentManager.swift
//  PaymentGateway
//
//  Created by Aakif Nadeem on 11/10/2021.
//

import Foundation
import UIKit
import PayPalCheckout

public protocol PaymentProcessProtocol
{
    func performpayment(onComplete: @escaping ((Result<String, Error>)->Void))
}

public class PaymentManager
{
    public static var shared = PaymentManager()
    
    public func processPayment(object: PaymentProcessProtocol, onComplete: @escaping ((Result<String, Error>)->Void))
    {
        object.performpayment { result in
            onComplete(result)
        }
    }
}

struct PaymentModel
{
    var balance: Double?
    var description: String?
    var walletCurrency: String?
    var country : String?
    var phoneNumber: String?
}
