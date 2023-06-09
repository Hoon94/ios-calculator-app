//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    private var expression: String = ""
    private var isResult: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operandLabel.text = "0"
        operatorLabel.text = ""
    }

    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        stackView.subviews.forEach { $0.removeFromSuperview() }
        operandLabel.text = "0"
        operatorLabel.text = ""
        expression = ""
    }
    
    @IBAction func touchUpCleanEntryButton(_ sender: UIButton) {
        operandLabel.text = "0"
    }
    
    @IBAction func touchUpSignButton(_ sender: UIButton) {
        guard let operand = operandLabel.text, operand != "0", operand != "." else {
            return
        }
        guard operand.hasPrefix("-") else {
            operandLabel.text = "-\(operand)"
            return
        }
        
        operandLabel.text = String(operand.suffix(operand.count - 1))
    }
    
    @IBAction func touchUpResultButton(_ sender: UIButton) {
        addStackView()
        expression += configureCurrentFormula()
        var formula: Formula = ExpressionParser.parse(from: expression)
        let result: Double = formula.result()
        operandLabel.text = String(result)
        operatorLabel.text = ""
        expression = ""
    }
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let currentOperand = sender.currentTitle else {
            return
        }
        guard let operand = operandLabel.text, operand != "0" else {
            operandLabel.text = currentOperand
            return
        }

        operandLabel.text = operand + currentOperand
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard operandLabel.text != "0", operandLabel.text != "." else {
            operatorLabel.text = sender.currentTitle
            return
        }

        addStackView()
        expression += configureCurrentFormula()
        operatorLabel.text = sender.currentTitle
        operandLabel.text = "0"
    }
    
    func configureCurrentFormula() -> String {
        guard let operand = operandLabel.text else {
            return ""
        }
        
        return "\(operatorLabel.text ?? "")\(operand)"
    }
    
    func addStackView() {
        let recordedFormulaLabel: [UILabel] = configureItem()
        let content: UIStackView = configureContent(item: recordedFormulaLabel)
        stackView.addArrangedSubview(content)
    }
    
    func configureContent(item formula: [UILabel]) -> UIStackView {
        let content: UIStackView = UIStackView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.axis = .horizontal
        content.alignment = .fill
        content.distribution = .equalSpacing
        content.spacing = 8
        formula.forEach { content.addArrangedSubview($0) }
        
        return content
    }

    func configureItem() -> [UILabel] {
        let recordedOperatorLabel: UILabel = UILabel()
        recordedOperatorLabel.font = .preferredFont(forTextStyle: .title3)
        recordedOperatorLabel.text = operatorLabel.text
        recordedOperatorLabel.textColor = .white
        let recordedOperandLabel: UILabel = UILabel()
        recordedOperandLabel.font = .preferredFont(forTextStyle: .title3)
        recordedOperandLabel.text = operandLabel.text
        recordedOperandLabel.textColor = .white
        
        return [recordedOperatorLabel, recordedOperandLabel]
    }
}

