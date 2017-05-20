//
//  ArtistsTrackViewController.swift
//  Beats Music Player
//
//  Created by Qani Qaniu on 19/5/17.
//  Copyright © 2017 Qani Qaniu. All rights reserved.
//

import UIKit
import AVFoundation

var artistsongs:[String] = []
var artistcounter = 0

class ArtistsTrackViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var artistSongTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return artistsongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = artistsongs[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.init(red: 236, green: 236, blue: 236, alpha: 100)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: artistsongs[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            thisSong = indexPath.row
            test = 2
            audioStuffed = true
        }
        catch
        {
            print ("ERROR")
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        artistsongs.removeAll()
        artistSongTableView.reloadData()
        
        if artistcounter == 0
        {
            gettingArtistSongNames()
        }
        else
        {
            
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    //FUNCTION THAT GETS THE NAME OF THE SONGS
    func gettingArtistSongNames()
    {
        let folderURL = URL(fileURLWithPath:Bundle.main.resourcePath!)
        
        do
        {
            let ArtistSongPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            //loop through the found urls
            for song in ArtistSongPath
            {
                var myArtistSong = song.absoluteString
                
                if myArtistSong.contains(".mp3") && myArtistSong.contains("\(songname)")
                {
                    let findString = myArtistSong.components(separatedBy: "/")
                    myArtistSong = findString[findString.count-1]
                    myArtistSong = myArtistSong.replacingOccurrences(of: "%20", with: " ")
                    myArtistSong = myArtistSong.replacingOccurrences(of: ".mp3", with: "")
                    artistsongs.append(myArtistSong)
                }
                
            }
            
            artistSongTableView.reloadData()
        }
        catch
        {
            print ("ERROR")
        }
    }
}
