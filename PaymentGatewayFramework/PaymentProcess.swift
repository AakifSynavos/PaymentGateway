//
//  PaymentProcess.swift
//  PaymentGatewayFramework
//
//  Created by Aakif Nadeem on 11/10/2021.
//

import Foundation
import UIKit

public class PaymentProcess
{
    public static var shared = PaymentProcess()
    
    // Complete Paypal Integration Here
    func PaypalIntegration(clientID: String, onComplete: @escaping ((Result<String, Error>)->Void))
    {
        print("Working on Paypal using clientID: ", clientID)
    }
    
    // Complete Wallet Integration Here
    func WalletIntegration(walletKey: String, onComplete: @escaping ((Result<String, Error>)->Void))
    {
        print("Working on Wallet using walletKey: ", walletKey)
    }
    
    // Complete MobileMoney Integration Here
    func MobileMoneyIntegration(phoneNumber: String, onComplete: @escaping ((Result<String, Error>)->Void))
    {
        print("Working on Mobile Money using Phone Number: ", phoneNumber)
    }
    
    //SetupData Function
    enum PaymentMethodSetupData
    {
        case Paypal(clientID: String)
        case Wallet(walletKey: String)
        case MobileMoney(phoneNumber: String)
    }
    
    //Payment Callbacks
    func PaymentCallback(data: PaymentMethodSetupData, onComplete: @escaping ((Result<String, Error>)->Void))
    {
        switch data {
            
        case .Paypal(let clientID):
            PaypalIntegration(clientID: clientID) { result in
                onComplete(result)
            }
            
        case .Wallet(walletKey: let walletKey):
            WalletIntegration(walletKey: walletKey){ result in
                onComplete(result)
            }
            
        case .MobileMoney(phoneNumber: let phoneNum):
            MobileMoneyIntegration(phoneNumber: phoneNum){ result in
                onComplete(result)
            }
        }
    }
    
    //Sample Function Testing
    public func testing()
    {
        let data = PaymentMethodSetupData.Paypal(clientID: "Asd123")
        PaymentCallback(data: data) { response in
            switch response {
            case .success(_):
                print("Payment Successful")
                break
                
            case .failure(let error):
                print("Payment Failure \(error.localizedDescription)")
            }
        }
    }
}

