//
//  ViewController.swift
//  zappolator
//
//  Created by Matthew Foster on 2/7/16.
//  Copyright © 2016 Matt Foster. All rights reserved.
//

import UIKit

enum modes {
	case NONE
	case ADDITION
	case SUBTRACTION
	case MULTIPLICATION
	case DIVISION
}

class ViewController: UIViewController {
	
	var labelString:String = "0"
	var currentMode:modes = modes.NONE
	var savedNum:Int = 0
	var lastButtonWasMode:Bool = false
	
	func pressedNumber(num:Int){
		
	}
	
	func updateDisplay(){
		
	}
	
	func changeMode(newMode:modes){
		
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
	}
	
	@IBAction func pressedClear(sender: AnyObject) {
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
	}
	
	@IBAction func pressedMultiply(sender: AnyObject) {
	}
	
	@IBAction func pressedAdd(sender: AnyObject) {
	}
	
	@IBAction func pressedSubtract(sender: AnyObject) {
	}
	
	@IBAction func pressedEqual(sender: AnyObject) {
	}


}

