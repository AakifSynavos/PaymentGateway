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
    
    public func setupConfig(clientID: String, returnUrl: String)
    {
        self.clientId = clientID
        self.returnUrl = returnUrl
        
        let config = CheckoutConfig(
                clientID: self.clientId,
                returnUrl: self.returnUrl,
                environment: .sandbox
            )
            Checkout.set(config: config)
    }
    
    public func performpayment(model: PaymentInfo, onComplete: @escaping ((Result<String, Error>) -> Void)) {
        
        
        print("Processing Paypal Payment")
        Checkout.setCreateOrderCallback { createOrderAction in
            let amount = PurchaseUnit.Amount(currencyCode: .usd, value: String(model.amount ?? 0.0))
            let purchaseUnit = PurchaseUnit(amount: amount)
            let order = OrderRequest(intent: .capture, purchaseUnits: [purchaseUnit])
            
            createOrderAction.create(order: order)
        }
        
        Checkout.setOnApproveCallback { approval in
            approval.actions.capture { (response, error) in
                
                if (error == nil)
                {
                    onComplete(.success("Order successfully captured: \(String(describing: response?.data))"))
                }
                else
                {
                    onComplete(.failure("Order failure captured: \(String(describing: error))" as! Error))
                }
            }
        }
        
        Checkout.setOnCancelCallback {
            onComplete(.failure(errorDescriptions.unable))
        }
        
        Checkout.setOnErrorCallback { error in
            onComplete(.failure(error as! Error))
        }
        
        onComplete(.failure(errorDescriptions.unable))
    }
}

enum errorDescriptions: String, Error
{
    case unable = "Unable to fetch Data"
}
