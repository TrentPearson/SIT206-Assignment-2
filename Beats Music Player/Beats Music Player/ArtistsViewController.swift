//
//  ArtistsViewController.swift
//  Beats Music Player
//
//  Created by Qani Qaniu on 18/5/17.
//  Copyright © 2017 Qani Qaniu. All rights reserved.
//

import UIKit
import AVFoundation

class ArtistsViewController: UIViewController {

    @IBAction func songPickerOne(_ sender: UIButton) {
        
        songname = "Shape"
    }
    @IBAction func songPickerTwo(_ sender: UIButton) {
        
        songname = "Congratulations"
    }
    @IBAction func songPickerThree(_ sender: UIButton) {
        
        songname = "Thats"
    }
    @IBAction func songPickerFour(_ sender: UIButton) {
        
        songname = "Feel"
    }
    @IBAction func songPickerFive(_ sender: UIButton) {
        
        songname = "Lose"
    }
    @IBAction func songPickerSix(_ sender: UIButton) {
        
        songname = "Say"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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

