//
//  SecondViewController.swift
//  Beats Music Player
//
//  Created by Qani Qaniu on 18/5/17.
//  Copyright © 2017 Qani Qaniu. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var playbutton: UIButton!
    @IBOutlet weak var musicSlider: UISlider!
    
    func updateMusicSlider(){
        
        musicSlider.value = Float(audioPlayer.currentTime)
    }
    
    @IBAction func playresume(_ sender: UIButton)
    {
        if audioStuffed == true && audioPlayer.isPlaying == false
        {
            audioPlayer.play()
            sender.setTitle("PAUSE", for: .normal)
        }
        else if audioStuffed == true && audioPlayer.isPlaying
        {
            audioPlayer.pause()
            sender.setTitle("PLAY", for: .normal)
        }
    }
    
    @IBAction func sliderAction(sender: AnyObject) {
        
        audioPlayer.pause()
        audioPlayer.currentTime = TimeInterval(musicSlider.value)
        audioPlayer.play()
    }
    
    @IBAction func prev(_ sender: Any)
    {
        if test == 1{
            if thisSong != 0 && audioStuffed == true
            {
                playThis(thisOne: albumsongs[thisSong-1])
                thisSong -= 1
                label.text = albumsongs[thisSong]
                myImageView.image = UIImage(named: "\(albumsongs[thisSong]).jpg")
            }
            else
            {
            
            }
        }
        else if test == 2{
            if thisSong != 0 && audioStuffed == true
            {
                playThis(thisOne: artistsongs[thisSong-1])
                thisSong -= 1
                label.text = artistsongs[thisSong]
                myImageView.image = UIImage(named: "\(artistsongs[thisSong]).jpg")
            }
            else{
                
            }
        }
        else if test == 3{
            if thisSong != 0 && audioStuffed == true
            {
                playThis(thisOne: playlistsongs[thisSong-1])
                thisSong -= 1
                label.text = playlistsongs[thisSong]
                myImageView.image = UIImage(named: "\(playlistsongs[thisSong]).jpg")
            }
            else{
                
            }
        }
        else{
            if thisSong != 0 && audioStuffed == true
            {
                playThis(thisOne: songs[thisSong-1])
                thisSong -= 1
                label.text = songs[thisSong]
                myImageView.image = UIImage(named: "\(songs[thisSong]).jpg")
            }
            else{
                
            }
        }

    }
    
    @IBAction func next(_ sender: Any)
    {
        if test == 1{
            if thisSong < albumsongs.count-1 && audioStuffed == true
            {
                playThis(thisOne: albumsongs[thisSong+1])
                thisSong += 1
                label.text = albumsongs[thisSong]
                myImageView.image = UIImage(named: "\(albumsongs[thisSong]).jpg")
            }
            else
            {
            
            }
        }
        else if test == 2{
            if thisSong < artistsongs.count-1 && audioStuffed == true
            {
                playThis(thisOne: artistsongs[thisSong+1])
                thisSong += 1
                label.text = artistsongs[thisSong]
                myImageView.image = UIImage(named: "\(artistsongs[thisSong]).jpg")
            }
            else
            {
                
            }
        }
        else if test == 3{
            if thisSong < playlistsongs.count-1 && audioStuffed == true
            {
                playThis(thisOne: playlistsongs[thisSong+1])
                thisSong += 1
                label.text = playlistsongs[thisSong]
                myImageView.image = UIImage(named: "\(playlistsongs[thisSong]).jpg")
            }
            else
            {
                
            }
        }
        else{
            if thisSong < songs.count-1 && audioStuffed == true
            {
                playThis(thisOne: songs[thisSong+1])
                thisSong += 1
                label.text = songs[thisSong]
                myImageView.image = UIImage(named: "\(songs[thisSong]).jpg")
            }
            else
            {
                
            }
        }

    }
    
    func playThis(thisOne:String)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
        }
        catch
        {
            print ("ERROR")
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if test == 1
        {
            label.text = albumsongs[thisSong]
            myImageView.image = UIImage(named: "\(albumsongs[thisSong]).jpg")
        }
        else if test == 2
        {
            label.text = artistsongs[thisSong]
            myImageView.image = UIImage(named: "\(artistsongs[thisSong]).jpg")
        }
        else if test == 3
        {
            label.text = playlistsongs[thisSong]
            myImageView.image = UIImage(named: "\(playlistsongs[thisSong]).jpg")
        }
        else
        {
            label.text = songs[thisSong]
            myImageView.image = UIImage(named: "\(songs[thisSong]).jpg")
        }

        if audioStuffed == true && audioPlayer.isPlaying
        {
            playbutton.setTitle("PAUSE", for: .normal)
        }
        var timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(SecondViewController.updateMusicSlider), userInfo: nil, repeats: true)
        musicSlider.value = 0.0
        musicSlider.maximumValue = Float(audioPlayer.duration)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


