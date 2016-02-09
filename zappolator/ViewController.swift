//
//  ViewController.swift
//  zappolator
//
//  Created by Matthew Foster on 2/7/16.
//  Copyright © 2016 Matt Foster. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
	
	var labelString:String = "0"
	var currentMode:Character = "0"
	var inputOp:Int = 0
	// currentMode: 0=none, +=add, -=sub, *=mul, /=div
	var labelNum:Float32 = 0.0
	var savedNum:Float32 = 0
	var lastButtonWasMode:Bool = false
	
	func pressedNumber(num:Float32){
		if(lastButtonWasMode){
			lastButtonWasMode = false
			labelNum = num
		}
		if labelNum == 0 {
			labelNum = num		}
		else {
			let newNum:Float32 = labelNum * 10
			labelNum = newNum + num
			labelString = labelNum.description
		}
		updateDisplay()
	}
	
	func updateDisplay(){
		labelString = labelNum.description
		if inputOp == 0 {
			savedNum = labelNum
		}
		displayLabel.text = labelNum.description
	}
	
	func changeMode(newMode:Int){
		if savedNum == 0 {
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
	
	@IBAction func pressedClear(sender: AnyObject) {
		clearDisplay()
	}
	
	@IBAction func pressedNegate(sender: AnyObject) {
	}
	
	@IBAction func pressed0(sender: AnyObject) {pressedNumber(0)}
	
	@IBAction func pressed1(sender: AnyObject) {pressedNumber(1)}
	
	@IBAction func pressed2(sender: AnyObject) {pressedNumber(2)}
	
	@IBAction func pressed3(sender: AnyObject) {pressedNumber(3)}
	
	@IBAction func pressed4(sender: AnyObject) {pressedNumber(4)}
	
	@IBAction func pressed5(sender: AnyObject) {pressedNumber(5)}
	
	@IBAction func pressed6(sender: AnyObject) {pressedNumber(6)}
	
	@IBAction func pressed7(sender: AnyObject) {pressedNumber(7)}
	
	@IBAction func pressed8(sender: AnyObject) {pressedNumber(8)}
	
	@IBAction func pressed9(sender: AnyObject) {pressedNumber(9)}
	
	@IBAction func pressedPercent(sender: AnyObject) {
	}
	
	@IBAction func pressedDecimal(sender: AnyObject) {
	}
	
	@IBAction func pressedDivide(sender: AnyObject) {
		changeMode(4)
	}
	
	@IBAction func pressedMultiply(sender: AnyObject) {
		changeMode(3)
	}
	
	@IBAction func pressedAdd(sender: AnyObject) {
		changeMode(1)
	}
	
	@IBAction func pressedSubtract(sender: AnyObject) {
		changeMode(2)
	}
	
	@IBAction func pressedEqual(sender: AnyObject) {
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

