//
//  EvaluationControl.swift
//  secondApp
//
//  Created by Aula11 on 22/10/19.
//  Copyright © 2019 Jose Antonio Parra Sánchez. All rights reserved.
//

import UIKit

class EvaluationControl: UIView {
    
    //MARK: Atributos
    var botones: [UIButton] = [UIButton]()
    
    var gradoAfinidad = 0 {
        didSet{
            for (i, botonI) in botones.enumerated(){
                botonI.isSelected = gradoAfinidad > i
            }
        }
    }
    //MARK: Inicialización
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        var boton: UIButton
        for i in 0..<5{
           boton = UIButton(frame:  CGRect(x: 0, y: 0, width: frame.height, height: frame.height))
            boton.setImage(UIImage(named: "Estrella Vacia"), for: .normal)
            boton.setImage(UIImage(named: "Estrella Rellena"), for: .selected)
        boton.adjustsImageWhenHighlighted = false
            boton.addTarget(self, action: #selector(btnEval), for: .touchUpInside)
            boton.tag += i
            botones += [boton]
            addSubview(boton)
        }
    }

    override var intrinsicContentSize: CGSize{
        return CGSize(width: 240, height: 44)
    }
    override func layoutSubviews() {
        for (i, boton) in botones.enumerated(){
            boton.frame.origin.x = CGFloat(i * (44 + 5))
        }
    }
    
    //MARK: Actions
    @objc func btnEval(boton: UIButton) {
        
        if gradoAfinidad == 1 && boton == botones[0]{
            botones[0].isSelected = false
        }else{
        gradoAfinidad = botones.index(of: boton)! + 1
        }
    }
}
