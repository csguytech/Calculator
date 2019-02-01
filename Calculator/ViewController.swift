//
//  ViewController.swift
//  Calculator
//
//  Created by CS Guy on 1/2/19.
//  Copyright © 2019 CS Guy. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var expression: UILabel!
    @IBOutlet weak var answer: UILabel!
    
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var mathArray: [[String]] = []
    var input: String = ""
    var index = 0
    var newNum = true
    var history: [[String]] = []
    
    @IBOutlet weak var historyTbl: UITableView!
    @IBOutlet weak var numberFld: UITextField!
    
    //Number Buttons
    @IBAction func zeroBtn(_ sender: Any) {
        numBtn(btn: "0")
    }
    @IBAction func oneBtn(_ sender: Any) {
        numBtn(btn: "1")
    }
    @IBAction func twoBtn(_ sender: Any) {
        numBtn(btn: "2")    }
    @IBAction func threeBtn(_ sender: Any) {
        numBtn(btn: "3")
    }
    @IBAction func fourBtn(_ sender: Any) {
        numBtn(btn: "4")
    }
    @IBAction func fiveBtn(_ sender: Any) {
        numBtn(btn: "5")
    }
    @IBAction func sixBtn(_ sender: Any) {
        numBtn(btn: "6")
    }
    @IBAction func sevenBtn(_ sender: Any) {
        numBtn(btn: "7")
    }
    @IBAction func eightBtn(_ sender: Any) {
        numBtn(btn: "8")
    }
    @IBAction func nineBtn(_ sender: Any) {
        numBtn(btn: "9")
    }
    @IBAction func dotBtn(_ sender: Any) {
        numBtn(btn: ".")
    }
    
    //Basic Math Buttons
    @IBAction func addBtn(_ sender: Any) {
        funcBtn(btn: "+")
    }
    @IBAction func subtractBtn(_ sender: Any) {
        funcBtn(btn: "-")
    }
    @IBAction func multiplyBtn(_ sender: Any) {
        funcBtn(btn: "*")
    }
    @IBAction func divideBtn(_ sender: Any) {
        funcBtn(btn: "/")
    }
    @IBAction func equalsBtn(_ sender: Any) {
        input = "(" + input + ")"
        var answer: NSNumber
        
        var historyInput = input
        historyInput.removeFirst()
        historyInput.removeLast()
        
        answer = calculate(input: input)
        numberFld.text = answer.stringValue

        history.insert([historyInput, answer.stringValue], at: 0)

        historyTbl.reloadData()
        
        newNum = true
        
    }
    
    
    
    //Function Buttons
    @IBAction func clrBtn(_ sender: Any) {
        input.removeAll()
        updateNumberFld()
    }
    
    
    @IBAction func ceBtn(_ sender: Any) {
        input.removeAll()
        updateNumberFld()
        history.removeAll()
        historyTbl.reloadData()
    }
    @IBAction func ansBtn(_ sender: Any) {
        if(newNum) {
            input.removeAll()
            input.append(history[0][1])
            updateNumberFld()
            newNum = false
        }else {
            input.append(history[0][1])
            updateNumberFld()
        }
    }
    
    @IBAction func backspaceBtn(_ sender: Any) {
        if(input.count == 0) {
            return
        } else {
            input = numberFld.text!
            input.removeLast()
            updateNumberFld()
        }
    }
    
    func numBtn(btn: String) {
        if(newNum) {
            input.removeAll()
            updateNumberFld()
            newNum = false
        }
        input.append(contentsOf: btn)

        updateNumberFld()
    }
    
    func funcBtn(btn: String) {
        newNum = false
        input.append(contentsOf: btn)
        updateNumberFld()
    }

    
    func updateNumberFld() {
        numberFld.text = input
    }
    
    
    //HISTORY TABLE
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
        
        
        let pastFunction = history[indexPath.row]
        cell.expression.text = pastFunction[0]
        cell.answer.text = pastFunction[1]
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(newNum) {
            input = history[indexPath.row][1]
        }else {
            input.append(history[indexPath.row][1])
        }
        
        updateNumberFld()
    }
}


