//
//  Amigo.swift
//  secondApp
//
//  Created by Aula11 on 23/10/19.
//  Copyright © 2019 Jose Antonio Parra Sánchez. All rights reserved.
//

import UIKit

class Amigo: NSObject, NSCoding{
    
    //MARK: Atributos
    var nombre: String
    var foto: UIImage?
    var gradoAfinidad: Int
    
    
    required convenience init?(coder decoder: NSCoder){
        let nombre = decoder.decodeObject(forKey: "Nombre") as! String
        let foto = decoder.decodeObject(forKey: "Foto") as? UIImage
        let gradoAfinidad = decoder.decodeInteger(forKey: "GradoAfinidad")
        self.init(nombre: nombre, foto: foto, gAfinidad: gradoAfinidad)
    }
    
    
    init?(nombre: String, foto: UIImage?, gAfinidad: Int){
        if nombre.isEmpty || gAfinidad < 0 {
            return nil
        }
        self.nombre = nombre
        self.foto = foto
        self.gradoAfinidad = gAfinidad
        super.init() }
    
    func encode(with coder: NSCoder) {
        coder.encode(nombre, forKey: "Nombre")
        coder.encode(foto, forKey: "Foto")
        coder.encode(gradoAfinidad, forKey: "GradoAfinidad")
    }
    
    
  /*  required convenience init?(coder decoder: NSCoder){
        
        let nombre = decoder.decodeObject(forKey: "Nombre") as! String
        let foto = decoder.decodeObject(forKey: "Foto") as? UIImage
        let gradoAfinidad = decoder.decodeInteger(forKey: "GradoAfinidad")
        self.init(nombre: nombre, foto: foto, gAfinidad: gradoAfinidad)

        if nombre.isEmpty || gradoAfinidad < 0 {
            return nil
        }
        self.nombre = nombre
        self.foto = foto
        self.gradoAfinidad = gAfinidad
        super.init()
    }
    
    
    func encode(with coder: NSCoder) {
        coder.encode(nombre, forKey: "Nombre")
        coder.encode(foto, forKey: "Foto")
        coder.encode(gradoAfinidad, forKey: "GradoAfinidad")
    }
    
    */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    //MARK: Atributos
    var nombre: String
    var foto: UIImage?
    var gradoAfinidad: Int
    
    //MARK: Inicialización
    init?(nombre: String, foto: UIImage?, gAfinidad: Int){
        self.nombre = nombre
        self.foto = foto
        self.gradoAfinidad = gAfinidad
        
        if nombre.isEmpty || gAfinidad < 0 || gAfinidad > 5{
            return nil
        }
    }
 */
}
