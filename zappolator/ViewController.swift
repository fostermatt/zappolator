//
//  ViewController.swift
//  zappolator
//
//  Created by Matthew Foster on 2/7/16.
//  Copyright © 2016 Matt Foster. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
	
	private var urlString:String = "http://m.wolframalpha.com"
	
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
		urlString = "http://m.wolframalpha.com"
	}
	
	@IBOutlet weak var displayLabel: UILabel!
	
	@IBAction func pressedNumber(sender: UIButton){
		buttonBorders(sender)
		let myNum = sender.currentTitle!
		displayLabel.text = isFirstDigit ? myNum : displayLabel.text! + myNum
		isFirstDigit = false
	}
	
	@IBAction func pressedAllClear(sender: AnyObject) {
		buttonBorders(sender)
		allClear()
	}
	
	@IBAction func pressedClear(sender: AnyObject) {
		buttonBorders(sender)
		let tempOp = inputOp
		displayVal = 0
		inputOp = tempOp
		isFirstDigit = true
	}
	
	@IBAction func pressedNegate(sender: AnyObject) {
		buttonBorders(sender)
		displayVal = displayVal * -1
	}
	
	@IBAction func pressedOperand(sender: UIButton) {
		if inputOp != "=" {
			pressedEqual(sender)
		}
		else {
			buttonBorders(sender)
		}
		inputOp = sender.currentTitle!
		savedNum = displayVal
		isFirstDigit = true
	}
	
	@IBAction func pressedEqual(sender: AnyObject) {
//		print(savedNum)
//		print(inputOp)
//		print(displayVal)
//		print(sender.currentTitle!)
		buttonBorders(sender)
		let stringDisplayVal:String = displayVal.description
		if urlString == "http://m.wolframalpha.com" {
			urlString += "/input/?i=" + savedNum.description
		}
		if inputOp == "+"{
			displayVal = savedNum + displayVal
			urlString += "+%2B+" + stringDisplayVal
			print(urlString)
		}
		else if inputOp == "-"{
			displayVal = savedNum - displayVal
			urlString += "+-+" + stringDisplayVal
			print(urlString)
		}
		else if inputOp == "×"{
			displayVal = savedNum * displayVal
			urlString += "+*+" + stringDisplayVal
			print(urlString)
		}
		else if inputOp == "÷"{
			if displayVal == 0{
				allClear()
				displayLabel.text = "Error"
				urlString = "http://m.wolframalpha.com"
			}
//			else if savedNum == 0{
//				allClear()
//				displayLabel.text = "∞"
//			}
			else {
				displayVal = savedNum / displayVal
				urlString += "+/+" + stringDisplayVal
				print(urlString)
			}
		}
		
	}
	
	@IBOutlet weak var acButton: UIButton!
	@IBOutlet weak var cButton: UIButton!
	@IBOutlet weak var negButton: UIButton!
	@IBOutlet weak var button7: UIButton!
	@IBOutlet weak var button8: UIButton!
	@IBOutlet weak var button9: UIButton!
	@IBOutlet weak var button4: UIButton!
	@IBOutlet weak var button5: UIButton!
	@IBOutlet weak var button6: UIButton!
	@IBOutlet weak var subButton: UIButton!
	@IBOutlet weak var button1: UIButton!
	@IBOutlet weak var button2: UIButton!
	@IBOutlet weak var button3: UIButton!
	@IBOutlet weak var addButton: UIButton!
	@IBOutlet weak var button0: UIButton!
	@IBOutlet weak var equalButton: UIButton!
	@IBOutlet weak var divButton: UIButton!
	@IBOutlet weak var multButton: UIButton!
	@IBOutlet weak var waButton: UIButton!
	
	@IBAction func touchButton(sender: AnyObject) {
//		sender.layer.borderColor = UIColor.grayColor().CGColor
		sender.layer.borderWidth = 2
	}
	
	@IBAction func waSafariview(sender: AnyObject) {
		buttonBorders(sender)
		if urlString != "http://m.wolframalpha.com" {
			urlString += "&x=0&y=0"
		}
		let svc = SFSafariViewController(URL: NSURL(string:self.urlString)!)
		self.presentViewController(svc, animated: true, completion: nil)
		urlString = "http://m.wolframalpha.com"
	}

	@IBAction func buttonBorders(sender: AnyObject){
		sender.layer.borderColor = UIColor.blackColor().CGColor
		sender.layer.borderWidth = 1
	}

	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		buttonBorders(acButton)
		buttonBorders(cButton)
		buttonBorders(negButton)
		buttonBorders(button7)
		buttonBorders(button8)
		buttonBorders(button9)
		buttonBorders(button4)
		buttonBorders(button5)
		buttonBorders(button6)
		buttonBorders(subButton)
		buttonBorders(button1)
		buttonBorders(button2)
		buttonBorders(button3)
		buttonBorders(addButton)
		buttonBorders(button0)
		buttonBorders(equalButton)
		buttonBorders(divButton)
		buttonBorders(multButton)
		buttonBorders(waButton)
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBOutlet weak var AC: UIButton!

}

