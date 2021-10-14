//
//  PaypalPayment.swift
//  PaymentGateway
//
//  Created by Aakif Nadeem on 13/10/2021.
//

import Foundation
import UIKit
import PayPalCheckout

public class PaypalPayment: PaymentMethod
{
    public static var shared = PaypalPayment()
    public init() {}
    
    var clientId: String = ""
    var returnUrl: String = ""
    
    func setupConfig(id: String, url: String)
    {
        self.clientId = id
        self.returnUrl = url
        let config = CheckoutConfig(
              clientID: clientId,
              returnUrl: returnUrl,
              environment: .sandbox
            )
            Checkout.set(config: config)
    }
    
    public func performpayment(onComplete: @escaping ((Result<String, Error>) -> Void)) {
        print("Processing Paypal Payment")
        onComplete(.success("Successfull"))
    }
}
