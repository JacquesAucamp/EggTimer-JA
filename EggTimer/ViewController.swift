//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// normal variables to store hardness and times
//	let softTime = 5
//	let mediumTime = 7
//	let hardTime = 12
	// Dictionary to store the hardness and times
	let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
	var seconds: Int = 0
	var timer = Timer()
	var totalTime = 0
	var secondsPassed = 0
	var percentFinished = 0.0
	@IBOutlet weak var ProgressBar: UIProgressView!
	@IBOutlet weak var TimerView: UILabel!
	@IBOutlet weak var titleLabel: UILabel!
	
	@IBAction func hardnessSelected(_ sender: UIButton) {
		
		// end with a ! to ignore the fact that currentTitle is an optional and could contain a nil. ie. force unwrap
		timer.invalidate()
		let hardness = sender.currentTitle!
		
		totalTime = eggTimes[hardness]!
		
		ProgressBar.progress = 0.0
		secondsPassed = 0
		TimerView.text = ""
		titleLabel.text = hardness
		runTimer()

	}
	

	
	
	func runTimer(){
		// timer every second, repeat, selector (name of function to call every time the timer triggers),
		timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
	}
	@objc func updateTimer() {
		if secondsPassed < totalTime{
			secondsPassed += 1
			ProgressBar.progress = Float(secondsPassed)/Float(totalTime)
			print(Float(secondsPassed)/Float(totalTime))
			
		}
		else{
			timer.invalidate()
			TimerView.text = ("Your eggs are ready!!")
		}
		
	}
	
	
}
