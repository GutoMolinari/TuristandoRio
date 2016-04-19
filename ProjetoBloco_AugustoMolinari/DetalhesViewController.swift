//
//  DetalhesViewController.swift
//  ProjetoBloco_AugustoMolinari
//
//  Created by Sophia Leslie on 13/04/16.
//  Copyright © 2016 Augusto Molinari. All rights reserved.
//

import UIKit
import MapKit

class DetalhesViewController: UIViewController {
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelTipo: UILabel!
    @IBOutlet weak var labelNota: UILabel!
    @IBOutlet weak var labelBairro: UILabel!
    @IBOutlet weak var labelEndereco: UILabel!
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    var coordinate: CLLocationCoordinate2D?
    var infosPonto: NSDictionary?
    var indexBairro = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getInfos()
        makeMap()
    }
    
    func getInfos() {
        labelTitulo.text = infosPonto!["nome"] as? String
        labelTipo.text = "Tipo: " + (infosPonto!["tipo"] as? String)!
        labelBairro.text = "Bairro: " + (infosPonto!["bairro"] as? String)!
        labelNota.text = "Nota: " + (infosPonto!["nota"] as? String)!
        labelEndereco.text = infosPonto!["endereco"] as? String
        imagem.image = UIImage(named: (infosPonto!["imagem"] as? String)!)
    }
    
    func makeMap() {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(labelEndereco.text!)
            { (placemarks, error) in
                if let place = placemarks?[0] {
                    let location:CLLocation = place.location!
                    let coords = location.coordinate
                    let span = MKCoordinateSpan(latitudeDelta: 0.030, longitudeDelta: 0.030)
                    
                    let region = MKCoordinateRegion(center: coords, span: span)
                    self.mapView.region = region
                    
                    self.makePin(coords)
                }
        }
    }
    
    func makePin(coords: CLLocationCoordinate2D) {
        let pin = MKPointAnnotation()
        pin.coordinate = coords
        pin.title = self.labelTitulo.text!
        pin.subtitle = self.labelEndereco.text!
        self.mapView.addAnnotation(pin)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! PontosTurViewController
        controller.indexBairro = indexBairro
    }
}