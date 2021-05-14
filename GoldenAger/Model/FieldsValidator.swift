//
//  MoyaService.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 13.05.2021.
//

import Foundation

class ValidationError: Error {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}

protocol ValidatorConvertible {
    func validated(_ value: String) throws -> String
}

enum ValidatorType {
    case phone
    case password
    case name
    case surname
    case requiredField(field: String)

}

enum ValidatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .phone: return PhoneValidator()
        case .password: return PasswordValidator()
        case .name: return NameValidator()
        case .surname: return SurNameValidator()
        case .requiredField(let fieldName): return RequiredFieldValidator(fieldName)
    
        }
    }
}



struct RequiredFieldValidator: ValidatorConvertible {
    private let fieldName: String
    
    init(_ field: String) {
        fieldName = field
    }
    
    func validated(_ value: String) throws -> String {
        guard !value.isEmpty else {
            throw ValidationError("Це поле не може бути пустим" + fieldName)
        }
        return value
    }
}

struct NameValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError("Ім'я не може бути пустим")}
       
        return value
    }
}

struct SurNameValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError("Прізвище не може бути пустим")}
       
        return value
    }
}

struct PasswordValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError("Пароль не може бути пустим")}
        guard value.count >= 6 else { throw ValidationError("Пароль має містити мінімум 6 символів") }
        
        do {
            if try NSRegularExpression(pattern: "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$",  options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Пароль має бути більшим за 6 символів містити одну цифру та один спеціальний символ")
            }
        } catch {
            throw ValidationError("Пароль має бути більшим за 6 символів містити одну цифру та один спеціальний символ")
        }
        return value
    }
}

struct PhoneValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        do {
            if try NSRegularExpression(pattern: "^380[5-9][0-9]\\d{7}$m", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Телефон має бути заданим у форматі 380XXXXXXXXX")
            }
        } catch {
            throw ValidationError("Телефон має бути заданим у форматі 380XXXXXXXXX")
        }
        return value
    }
}
