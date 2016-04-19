//
//  PontosTurViewController.swift
//  ProjetoBloco_AugustoMolinari
//
//  Created by Sophia Leslie on 13/04/16.
//  Copyright © 2016 Augusto Molinari. All rights reserved.
//

import UIKit

class PontosTurViewController: UIViewController, UITableViewDelegate {    
    @IBOutlet weak var tableView: UITableView!
    var listaBairros: NSArray?
    var pontosTuristicos: NSArray = []
    var pontoTuristico: NSDictionary?
    var indexBairro = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bundlePath = NSBundle.mainBundle().pathForResource("pontosTuristicosBairros", ofType: "plist") {
            if let dicionario = NSDictionary(contentsOfFile: bundlePath) {
                listaBairros = dicionario["bairros"] as? NSArray
            }
        }
        
        if let list = listaBairros![indexBairro] as? NSArray {
            pontosTuristicos = list[1] as! NSArray
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pontosTuristicos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:PrototypeTableViewCell = tableView.dequeueReusableCellWithIdentifier("placeCell", forIndexPath: indexPath) as! PrototypeTableViewCell
        
        if let lugar:NSDictionary = pontosTuristicos[indexPath.row] as? NSDictionary {
            pontoTuristico = lugar
        }
        
        cell.labelTitulo.text = pontoTuristico!["nome"] as? String
        cell.labelTipo.text = pontoTuristico!["tipo"] as? String
        cell.labelNota.text = "Nota: " + (pontoTuristico!["nota"] as? String)!
        cell.imagem.image = UIImage(named: (pontoTuristico!["imagem"] as? String)!)
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let index = tableView.indexPathForSelectedRow {
            let controller = segue.destinationViewController as! DetalhesViewController
            controller.infosPonto = pontosTuristicos[index.row] as? NSDictionary
            
            controller.indexBairro = indexBairro
        }
    }
}