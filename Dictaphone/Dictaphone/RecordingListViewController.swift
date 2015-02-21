//
//  RecordingListViewController.swift
//  Dictaphone
//
//  Created by Georgi Yanakiev on 2/18/15.
//  Copyright (c) 2015 Georgi Yanakiev. All rights reserved.
//

import UIKit
import AVFoundation

class RecordingListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var audioPlayer = AVAudioPlayer()
//    var audioRecorder = AVAudioRecorder()
    
    var soundList:[Audio] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        var soundPath = NSBundle.mainBundle().pathForResource("flush", ofType: "wav")
        var soundURL = NSURL.fileURLWithPath(soundPath!)
        
        var audioOne = Audio()
        audioOne.name = "flush"
        audioOne.URL = soundURL!
        
        self.soundList.append(audioOne)
        self.soundList.append(audioOne)
        self.soundList.append(audioOne)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soundList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var sound = soundList[indexPath.row]
        var cell = 	UITableViewCell()
        cell.imageView?.image = UIImage(named: "audio.png")
        cell.textLabel!.text = sound.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var soundPath = NSBundle.mainBundle().pathForResource("flush", ofType: "wav")
        var soundURL = NSURL.fileURLWithPath(soundPath!)
        
        self.audioPlayer = AVAudioPlayer(contentsOfURL: soundURL, error: nil)
        self.audioPlayer.play()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var nextViewController = segue.destinationViewController as RecordingViewController
        nextViewController.previousViewController = self
    }

}