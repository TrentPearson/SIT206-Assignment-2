//
//  AlbumTracksViewController.swift
//  Beats Music Player
//
//  Created by Qani Qaniu on 18/5/17.
//  Copyright © 2017 Qani Qaniu. All rights reserved.
//

import UIKit
import AVFoundation

var albumsongs:[String] = []
var test = 0
var albumcounter = 0
var songname = ""

class AlbumTracksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var albumSongTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return albumsongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = albumsongs[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.init(red: 236, green: 236, blue: 236, alpha: 100)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: albumsongs[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            thisSong = indexPath.row
            test = 1
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
        
        albumsongs.removeAll()
        albumSongTableView.reloadData()
        
        if albumcounter == 0
        {
            gettingAlbumSongNames()
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
    func gettingAlbumSongNames()
    {
        let folderURL = URL(fileURLWithPath:Bundle.main.resourcePath!)
        
        do
        {
            let AlbumSongPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            //loop through the found urls
            for song in AlbumSongPath
            {
                var myAlbumSong = song.absoluteString
                
                if myAlbumSong.contains(".mp3") && myAlbumSong.contains("\(songname)")
                {
                    let findString = myAlbumSong.components(separatedBy: "/")
                    myAlbumSong = findString[findString.count-1]
                    myAlbumSong = myAlbumSong.replacingOccurrences(of: "%20", with: " ")
                    myAlbumSong = myAlbumSong.replacingOccurrences(of: ".mp3", with: "")
                    albumsongs.append(myAlbumSong)
                }
                
            }
            
            albumSongTableView.reloadData()
        }
        catch
        {
            print ("ERROR")
        }
    }
}

