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
    func performpayment(model: PaymentInfo, onComplete: @escaping ((Result<String, Error>)->Void))
}

public class PaymentManager
{
    public static var shared = PaymentManager()
    
    public func processPayment(with paymentMethod: PaymentMethod, model: PaymentInfo, onComplete: @escaping ((Result<String, Error>)->Void))
    {
        paymentMethod.performpayment(model: model) { result in
            onComplete(result)
        }
    }
}

public struct PaymentInfo
{
    var amount: Double?
    var curreny: String?
    var purpose: String?
    var description: String?
    var walletCurrency: String?
    var balance: Double?
    var country : String?
    var phoneNumber: String?
    
    public init() {

    }
}
