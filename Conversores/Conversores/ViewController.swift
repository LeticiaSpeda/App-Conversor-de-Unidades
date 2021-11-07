//
//  ViewController.swift
//  Conversores
//
//  Created by Paolo Prodossimo Lopes on 01/11/21.
//  Copyright © 2021 Leticia de Oliveira Speda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var TexField: UITextField!
    @IBOutlet weak var ButtonCelsius: UIButton!
    @IBOutlet weak var ButtonFarenheint: UIButton!
 
    @IBOutlet weak var Result: UILabel!
    @IBOutlet weak var UnidadeDeMedida: UILabel!
    @IBOutlet weak var Unidade: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func ShowNext(_ sender: UIButton) {
        switch Unidade.text! {
        case "Temperatura" :
            Unidade.text = "Peso"
            ButtonCelsius.setTitle("Kilograma", for: .normal)
            ButtonFarenheint.setTitle("Libra", for: .normal)
        case "Peso" :
            Unidade.text = "Moeda"
            ButtonCelsius.setTitle("Real", for: .normal)
            ButtonFarenheint.setTitle("Dolar", for: .normal)
        case "Moeda" :
            Unidade.text = "Distancia"
            ButtonCelsius.setTitle("Metro", for: .normal)
            ButtonFarenheint.setTitle("Kilometro", for: .normal)
        default:
            Unidade.text = "Temperatura"
            ButtonCelsius.setTitle("Celsius", for: .normal)
            ButtonFarenheint.setTitle("Farenheint", for: .normal)
        }
        Convert(nil)
        
    }
    @IBAction func Convert( _ sender: UIButton?) {
        if let sender = sender {
            if sender == ButtonCelsius {
                ButtonFarenheint.alpha = 0.5
            } else {
                ButtonCelsius.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        switch Unidade.text! {
        case "Temperatura" :
            calcTemperatura()
        case "Peso" :
            calcPeso()
        case "Moeda" :
            calcMoeda()
        default:
            calcDistancia()
        }
        
    }
    func calcTemperatura () {
        guard let temperature = Double (TexField.text!) else {return}
        if ButtonCelsius.alpha == 1.0 {
            UnidadeDeMedida.text = "Farenheint"
            Result.text = String (temperature * 1.8 + 32.0)
        } else {
            UnidadeDeMedida.text = "Celsius"
            Result.text = String ((temperature - 32.0) / 1.8)
        }
    }
    
    
    func calcPeso () {
        guard let peso = Double (TexField.text!) else {return}
        if ButtonCelsius.alpha == 1.0 {
            UnidadeDeMedida.text = "Libra"
            Result.text = String (peso / 2.2046)
        }else{
            UnidadeDeMedida.text = "Kilograma"
            Result.text = String (peso * 2.2046)
        }
    }
    func calcMoeda () {
        guard let moeda = Double(TexField.text!) else {return}
        if ButtonCelsius.alpha == 1.0 {
            UnidadeDeMedida.text = "Dolár"
            Result.text = String (moeda / 3.5)
        }else{
            UnidadeDeMedida.text = "Real"
                       Result.text = String (moeda * 3.5)
        }
    }
    func calcDistancia () {
        guard let distancia = Double(TexField.text!) else {return}
        if ButtonCelsius.alpha == 1.0 {
            UnidadeDeMedida.text = "Kilometro"
            Result.text = String (distancia / 1000.0)
        }else{
            UnidadeDeMedida.text = "Metros"
            Result.text = String (distancia * 1000.0)
    }

}
}
