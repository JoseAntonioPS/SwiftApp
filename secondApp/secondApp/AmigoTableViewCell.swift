//
//  AmigoTableViewCell.swift
//  secondApp
//
//  Created by Aula11 on 5/11/19.
//  Copyright © 2019 Jose Antonio Parra Sánchez. All rights reserved.
//

import UIKit

class AmigoTableViewCell: UITableViewCell {

    //MARK: Propiedades

    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var evaluacion: EvaluationControl!
 
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
