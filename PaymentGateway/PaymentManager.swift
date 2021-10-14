//
//  PaymentManager.swift
//  PaymentGateway
//
//  Created by Aakif Nadeem on 11/10/2021.
//

import Foundation
import UIKit
import PayPalCheckout

public protocol PaymentMethod
{
    func performpayment(onComplete: @escaping ((Result<String, Error>)->Void))
}

public class PaymentManager
{
    public static var shared = PaymentManager()
    
    public func processPayment(with paymentMethod: PaymentMethod, onComplete: @escaping ((Result<String, Error>)->Void))
    {
        paymentMethod.performpayment { result in
            onComplete(result)
        }
    }
}

struct PaymentInfo
{
    var balance: Double?
    var description: String?
    var walletCurrency: String?
    var country : String?
    var phoneNumber: String?
}
