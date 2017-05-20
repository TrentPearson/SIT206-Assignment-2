//
//  PlaylistTracksViewController.swift
//  Beats Music Player
//
//  Created by Qani Qaniu on 20/5/17.
//  Copyright © 2017 Qani Qaniu. All rights reserved.
//

import UIKit
import AVFoundation

var playlistsongs:[String] = []
var playlistcounter = 0

class PlaylistTracksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var playlistSongTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return playlistsongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = playlistsongs[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.init(red: 236, green: 236, blue: 236, alpha: 100)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: playlistsongs[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            thisSong = indexPath.row
            test = 3
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
        
        playlistsongs.removeAll()
        playlistSongTableView.reloadData()
        
        if playlistcounter == 0
        {
            gettingPlaylistSongNames()
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
    func gettingPlaylistSongNames()
    {
        let folderURL = URL(fileURLWithPath:Bundle.main.resourcePath!)
        
        do
        {
            let PlaylistSongPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            //loop through the found urls
            for song in PlaylistSongPath
            {
                var myPlaylistSong = song.absoluteString
                
                if myPlaylistSong.contains(".mp3") && myPlaylistSong.contains("\(songname)")
                {
                    let findString = myPlaylistSong.components(separatedBy: "/")
                    myPlaylistSong = findString[findString.count-1]
                    myPlaylistSong = myPlaylistSong.replacingOccurrences(of: "%20", with: " ")
                    myPlaylistSong = myPlaylistSong.replacingOccurrences(of: ".mp3", with: "")
                    playlistsongs.append(myPlaylistSong)
                }
                
            }
            
            playlistSongTableView.reloadData()
        }
        catch
        {
            print ("ERROR")
        }
    }
}
