//
//  ViewController.swift
//  zappolator
//
//  Created by Matthew Foster on 2/7/16.
//  Copyright © 2016 Matt Foster. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
	
	
	// inputOp: 0=none, +=add, -=sub, *=mul, /=div
	var inputOp:Int = 0
	
	// Display string
	var labelString:String = "0"
	// first input
	var savedNum:Float32 = 0.0
	// current/second input
	var labelNum:Float32 = 0.0
	var decimalEntered:Bool = false
	var lastButtonWasMode:Bool = false
	
	func pressedNumber(num:String){
		labelString = labelString.stringByAppendingString(num)
		updateDisplay()
	}
	
	
	func updateDisplay(){
		print(labelString)
		guard let labelFloat:Float32 = Float32(labelString) else {
			displayLabel.text = "Conversion Failed"
			return
		}
		labelNum = labelFloat
		if floor(labelFloat) == labelFloat {
			guard let labelInt:Int = Int(labelString) else {
				displayLabel.text = "Int Conversion Failed"
				return
			}
			labelString = "\(labelInt)"
		}
		else {displayLabel.text = labelFloat.description}
		displayLabel.text = labelString
	}
	
	func changeMode(newMode:Int){
		if savedNum == 0.0 {
			return
		}
		print(newMode)
		inputOp = newMode
		lastButtonWasMode = true
	}
	
	func clearDisplay(){
		labelString = "0"
		labelNum = 0
		updateDisplay()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBOutlet weak var displayLabel: UILabel!
	
	@IBAction func pressedAllClear(sender: AnyObject) {
		savedNum = 0
		inputOp = 0
		lastButtonWasMode = false
		clearDisplay()
	}
	
	@IBAction func pressedClear(sender: AnyObject) {clearDisplay()}
	
	@IBAction func pressedNegate(sender: AnyObject) {
	}
	
	@IBAction func pressedPercent(sender: AnyObject) {
	}
	
	@IBAction func pressedDecimal(sender: AnyObject) {
		
	}
	
	@IBAction func pressed0(sender: AnyObject) {pressedNumber("0")}
	
	@IBAction func pressed1(sender: AnyObject) {pressedNumber("1")}
	
	@IBAction func pressed2(sender: AnyObject) {pressedNumber("2")}
	
	@IBAction func pressed3(sender: AnyObject) {pressedNumber("3")}
	
	@IBAction func pressed4(sender: AnyObject) {pressedNumber("4")}
	
	@IBAction func pressed5(sender: AnyObject) {pressedNumber("5")}
	
	@IBAction func pressed6(sender: AnyObject) {pressedNumber("6")}
	
	@IBAction func pressed7(sender: AnyObject) {pressedNumber("7")}
	
	@IBAction func pressed8(sender: AnyObject) {pressedNumber("8")}
	
	@IBAction func pressed9(sender: AnyObject) {pressedNumber("9")}
	
	@IBAction func pressedAdd(sender: AnyObject) {changeMode(1)}
	
	@IBAction func pressedSubtract(sender: AnyObject) {changeMode(2)}
	
	@IBAction func pressedMultiply(sender: AnyObject) {changeMode(3)}
	
	@IBAction func pressedDivide(sender: AnyObject) {changeMode(4)}
	
	@IBAction func pressedEqual(sender: AnyObject) {
		// put current numer in float var
		
		print(savedNum)
		print(labelNum)
		print(inputOp)
		if inputOp == 0 || lastButtonWasMode {
			return
		}
		if inputOp == 1 {
			print("\(savedNum + labelNum)")
			savedNum = savedNum + labelNum
		}
		else if inputOp == 2 {
			savedNum = savedNum - labelNum
		}
		else if inputOp == 3 {
			savedNum = savedNum * labelNum
		}
		else if inputOp == 4 {
			if savedNum == 0 {
				displayLabel.text = "Undefined"
				return
			} else if labelNum == 0 {
				displayLabel.text = "Inf"
				return
			}
			savedNum = savedNum / labelNum
		}
		inputOp = 0
		labelNum = savedNum
		labelString = savedNum.description
		updateDisplay()
		lastButtonWasMode = true
	}


}

