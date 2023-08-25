//
//  LoginViewModel.swift
//  UIKit Ios
//
//  Created by Jorge Alejndro Marcial Galvan on 20/08/23.
//

import UIKit

class LoginViewModel {
    func getLogoImage() -> UIImage {
        return UIImage(named: "ratata")!
    }

    func getUserPlaceholder() -> String {
        return "User"
    }

    func getPasswordPlaceholder() -> String {
        return "Password"
    }

    func getTitleButton() -> String {
        return "Login"
    }
}
