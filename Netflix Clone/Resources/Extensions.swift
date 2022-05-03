//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Gizem Turker on 3.05.2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String  {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
