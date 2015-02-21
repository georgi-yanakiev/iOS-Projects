//
//  NewRecordingViewController.swift
//  Dictaphone
//
//  Created by Georgi Yanakiev on 2/18/15.
//  Copyright (c) 2015 Georgi Yanakiev. All rights reserved.
//

import UIKit


class RecordingViewController: UIViewController {
    
    @IBOutlet weak var recordButton: UIButton!
    var previousViewController = RecordingListViewController()
    var saveDialog = UIAlertView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func discardButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func recordTapped(sender: AnyObject) {
        if self.recordButton.titleLabel!.text == "RECORD"{
            
           self.recordButton.setTitle("STOP", forState: UIControlState.Normal)
           self.recordButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
            
            
        } else {
            
           self.recordButton.setTitle("RECORD", forState: UIControlState.Normal)
           self.recordButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            
            saveDialog.delegate = self
            saveDialog.title = "Saving file with name:"
            saveDialog.alertViewStyle = UIAlertViewStyle.PlainTextInput
            saveDialog.addButtonWithTitle("Save")
            saveDialog.addButtonWithTitle("Cancel")
            
            saveDialog.show()
            
        }
    }
    
    func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){
        
        switch buttonIndex{
        
        case 0:
            saveAudioFile()
        case 1:
            println("Cancelled")
        default:
            println("Wrong button index")
            
        }
    }
    
    
    func saveAudioFile(){
        var sound = Audio()
        let soundName = saveDialog.textFieldAtIndex(0)!.text
        if countElements(soundName) > 0 {
           sound.name = soundName
           println(sound.name)
           self.previousViewController.soundList.append(sound)
        } else {
           var num = self.previousViewController.soundList.count
           sound.name = "Recording-\(num + 1)"
           println(sound.name)
           self.previousViewController.soundList.append(sound)
        }
    }
}