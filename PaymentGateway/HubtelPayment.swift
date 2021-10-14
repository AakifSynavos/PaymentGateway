//
//  HubtelPayment.swift
//  PaymentGateway
//
//  Created by Aakif Nadeem on 13/10/2021.
//

import Foundation
import UIKit

public class HubtelPayment: PaymentMethod
{
    public static var shared = HubtelPayment()
    public init() {}
        
    public func setupConfig()
    {

    }
    
    public func performpayment(model: PaymentInfo, onComplete: @escaping ((Result<String, Error>) -> Void)) {
        print("Processing Hubtel Payment")
    }
}
