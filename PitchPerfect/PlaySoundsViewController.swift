//
//  PlaySoundViewController.swift
//  PitchPerfect
//
//  Created by Carl Lee on 9/12/16.
//  Copyright © 2016 Carl Lee. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int{
        case Slow = 0,
        Fast,
        Chipmunk,
        Vader,
        Echo,
        Reverb
    }
    
    @IBAction func playSoundForButton(sender: UIButton){
        switch(ButtonType(rawValue: sender.tag)!){
        case .Slow:
            playSound(rate: 0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .Chipmunk:
            playSound(rate: 1.0, pitch: 1000, echo: false, reverb: false)
        case .Vader:
            playSound(rate: 1.0, pitch: -1000, echo: false, reverb: false)
        case .Echo:
            playSound(rate: 1.0, pitch: 0, echo: true, reverb: false)
        case .Reverb:
            playSound(rate: 1.0, pitch: 0, echo: false, reverb: true)
        }
        configureUI(playState: .Playing)
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject){
        print("stop sound")
        stopAudio()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("PlaySoundsViewController loaded")
        setupAudio()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(playState: .NotPlaying)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
