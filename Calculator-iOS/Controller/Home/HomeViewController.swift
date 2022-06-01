//
//  HomeViewController.swift
//  Calculator-iOS
//
//  Created by Daniel Escandell González on 23/5/22.
//  Copyright © 2022 Daniel Escandell González. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Variables
    private var total: Double = 0
    private var temp: Double = 0
    private var operating = false
    private var decimal = false
    private var operation: OperatingType = .none
    
    //MARK: - Constants
    private enum OperatingType {
        case none, addition, substration, multiplication, division, percent
    }
    
    private let kDecimalSeparator = Locale.current.decimalSeparator //usamos el propio de cada pais
    private let kMaxLength = 9 // tamaño maximo de los numeros
    private let kMaxValue: Double = 999999999
    private let kMinValue: Double = 0.00000001
    
    //MARK: - Outlets
    
    //Result
    @IBOutlet weak var resultLabel: UILabel!
    

    //Numbers
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!
    
    //Operators
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlusMinus: UIButton!
    @IBOutlet weak var operatorPercent: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    @IBOutlet weak var operatorMultiplication: UIButton!
    @IBOutlet weak var operatorSubstration: UIButton!
    @IBOutlet weak var operatorAddition: UIButton!
    @IBOutlet weak var operatorResult: UIButton!
    
    //MARK: - Formateadores
    //Formateador de valores auxiliares
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    //Formateador de valores por pantalla por defecto
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    // MARK: - Initialization
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Seteamos el separador decimal en funcion del pais
        numberDecimal.setTitle(kDecimalSeparator, for: .normal)

    }
    
    //MARK: - Button Action
    @IBAction func operatorAC(_ sender: UIButton) {
    }
    
    @IBAction func operatorPlusMinus(_ sender: UIButton) {
    }
    
    @IBAction func operatorPercent(_ sender: UIButton) {
    }
    
    @IBAction func operatorDivision(_ sender: UIButton) {
    }
    
    @IBAction func operatorMultiplication(_ sender: UIButton) {
    }
    
    @IBAction func operatorSubstration(_ sender: UIButton) {
    }
    
    @IBAction func operatorAddition(_ sender: UIButton) {
    }
    
    @IBAction func operatorResult(_ sender: UIButton) {
    }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
    }
    
    @IBAction func numbersAction(_ sender: UIButton) {
    }
    
    
    //MARK: - Funciones
    
    //Limpiar los valores
    private func clear(){
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        if temp != 0 {
            resultLabel.text = "0"
            temp = 0
        }else {
            total = 0
            result()
        }
    }
    
    //Calcular y mostrar resultado
    private func result(){
        switch operation {
            case .none:
                //Salimos del Switch
                break
            case .addition:
                total = total + temp
                break
            case .substration:
                total = total - temp
                break
            case .multiplication:
                total = total * temp
                break
            case .division:
                total = total / temp
                break
            case .percent:
                temp = temp / 100
                total = temp
                break
        }
        
        if total <= kMaxValue || total >= kMinValue {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
    }
    
}
