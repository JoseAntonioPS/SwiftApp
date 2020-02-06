//
//  secondAppTests.swift
//  secondAppTests
//
//  Created by Aula11 on 8/10/19.
//  Copyright © 2019 Jose Antonio Parra Sánchez. All rights reserved.
//

import XCTest
import UIKit
@testable import secondApp

class secondAppTests: XCTestCase {

    func testAmigo() {
        let posibleAmigo = Amigo(nombre: "Paco", foto: nil, gAfinidad: 5)
        XCTAssertNotNil(posibleAmigo)
        
        let posibleAmigo2 = Amigo(nombre: "", foto: nil, gAfinidad: 3)
        XCTAssertNil(posibleAmigo2, "Campo de Nombre vacío")
        
        let posibleAmigo3 = Amigo(nombre: "Besugo", foto: nil, gAfinidad: -2)
        XCTAssertNil(posibleAmigo3, "El Grado de Afinidad no puede ser negativo.")
        
        let posibleAmiga = Amigo(nombre: "Arañita", foto: nil, gAfinidad: 6)
        XCTAssertNil(posibleAmiga, "El Grado de Afinidad no puede ser mayor que 5.")
    }
}
