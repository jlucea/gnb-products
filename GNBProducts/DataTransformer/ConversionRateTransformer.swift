//
//  ConversionRateTransformer.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 6/2/23.
//

import Foundation

class ConversionRateTransformer {
    
    //
    // Parses an Array of conversion rates from a JSON formatted data block
    //
    func transform(ratesJSON: Data) -> [ConversionRate]? {
        do {
            let rates = try JSONDecoder().decode([ConversionRate].self, from: ratesJSON)

            print("\(rates.count) rates decoded")
            return rates
            
        } catch {
            print("JSON decoding error")
            return nil
        }
    }
    
    
    func conversionRate(from: String, to: String, currencyRates: [ConversionRate]) -> Double? {
        
        // Check for direct conversion
        for currencyRate in currencyRates {
            if currencyRate.from == from && currencyRate.to == to {
                return currencyRate.rate
            }
        }
        
        // Check for composed conversion
        for currencyRate in currencyRates {
            if currencyRate.from == from {
                if let rate = conversionRate(from: currencyRate.to, to: to, currencyRates: currencyRates) {
                    return rate * currencyRate.rate
                }
            }
        }
        
        return nil
    }

    
    func calculateTotalAmountInEuros(transactions: [Transaction], rates: [ConversionRate]) -> Double {
        var total : Double = 0
        for transaction in transactions {
            if transaction.currency != "EUR" {
                if let rate = conversionRate(from: transaction.currency, to: "EUR", currencyRates: rates) {
                    total += transaction.amount * rate
                }
            } else {
                total += transaction.amount
            }
        }
        return total
    }
    
    
    
}
