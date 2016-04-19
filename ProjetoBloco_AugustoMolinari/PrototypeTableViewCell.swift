//
//  PrototypeTableViewCell.swift
//  ProjetoBloco_AugustoMolinari
//
//  Created by Sophia Leslie on 13/04/16.
//  Copyright © 2016 Augusto Molinari. All rights reserved.
//

import UIKit

class PrototypeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelTipo: UILabel!
    @IBOutlet weak var labelNota: UILabel!
    @IBOutlet weak var imagem: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
