//
//  ViewController.swift
//  ProjetoBloco_AugustoMolinari
//
//  Created by Sophia Leslie on 13/04/16.
//  Copyright © 2016 Augusto Molinari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {    
    @IBOutlet weak var tableView: UITableView!
    var listaBairros: NSArray?
    var indexBairro = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bundlePath = NSBundle.mainBundle().pathForResource("pontosTuristicosBairros", ofType: "plist") {
            if let dicionario = NSDictionary(contentsOfFile: bundlePath) {
                listaBairros = dicionario["bairros"] as? NSArray
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (listaBairros?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("bairros", forIndexPath: indexPath)
        
        if let bairro = listaBairros![indexPath.row] as? NSArray {
            cell.textLabel?.text = bairro[0] as? String
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        indexBairro = indexPath.row
        return indexPath
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let _ = tableView.indexPathForSelectedRow {
            let controller = segue.destinationViewController as! PontosTurViewController
            controller.indexBairro = indexBairro
        }
    }
}
