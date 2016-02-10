//
//  ViewController.swift
//  zappolator
//
//  Created by Matthew Foster on 2/7/16.
//  Copyright © 2016 Matt Foster. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
	
	var isFirstDigit = true
	// inputOp: ==none, +=add, -=sub, ×=mul, /=div
	var inputOp:String = "="
	// first input
	var savedNum:Double = 0.0
	// current/second input
	var displayVal:Double {
		get{
			return NSNumberFormatter().numberFromString(displayLabel.text!)!.doubleValue
		}
		set {
			displayLabel.text = "\(newValue)"
			isFirstDigit = true
			inputOp = "="
		}
	}

	func allClear(){
		savedNum = 0
		displayVal = 0
		inputOp = "="
		isFirstDigit = true
	}
	
	@IBOutlet weak var displayLabel: UILabel!
	
	@IBAction func pressedNumber(sender: UIButton){
		let myNum = sender.currentTitle!
		displayLabel.text = isFirstDigit ? myNum : displayLabel.text! + myNum
		isFirstDigit = false
	}
	
	@IBAction func pressedAllClear(sender: AnyObject) {
		allClear()
	}
	
	@IBAction func pressedClear(sender: AnyObject) {
		let tempOp = inputOp
		displayVal = 0
		inputOp = tempOp
		isFirstDigit = true
	}
	
	@IBAction func pressedNegate(sender: AnyObject) {
		displayVal = displayVal * -1
	}
	
	@IBAction func pressedOperand(sender: UIButton) {
		inputOp = sender.currentTitle!
		print(displayVal)
		savedNum = displayVal
		isFirstDigit = true
	}
	
	@IBAction func pressedEqual(sender: AnyObject) {
//		print(savedNum)
//		print(inputOp)
//		print(displayVal)
//		print(sender.currentTitle!)
		if inputOp == "+"{
			displayVal = savedNum + displayVal
		}
		else if inputOp == "-"{
			displayVal = savedNum - displayVal
		}
		else if inputOp == "×"{
			displayVal = savedNum * displayVal
		}
		else if inputOp == "÷"{
			if displayVal == 0{
				allClear()
				displayLabel.text = "Error"
			}
//			else if savedNum == 0{
//				allClear()
//				displayLabel.text = "∞"
//			}
			else {
				displayVal = savedNum / displayVal
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

