//
//  ArtistsViewController.swift
//  utils_app
//
//  Created by aluno on 22/11/22.
//

import UIKit

class ArtistsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var artistTableRef: UITableView!
    
    var listArtist:[Artist]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artistTableRef.dataSource = self
        artistTableRef.delegate = self
        appendObjList()
        artistTableRef.reloadData()
    }
    
    func appendObjList() {
        autoCreateArtist(name: "Sasha Sloan", gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"])
        autoCreateArtist(name: "Ariana Grande", gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"])
        autoCreateArtist(name: "Taylor Swift", gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"])
        autoCreateArtist(name: "Justin Bieber", gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"])
        autoCreateArtist(name: "Elis Regina", gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"])
        autoCreateArtist(name: "Aurora", gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"])
        autoCreateArtist(name: "Sasha Sloan", gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"])
        autoCreateArtist(name: "Sasha Sloan", gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"])
        autoCreateArtist(name: "Sasha Sloan", gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"])
        autoCreateArtist(name: "Sasha Sloan", gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"])
        autoCreateArtist(name: "Sasha Sloan", gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"])
        autoCreateArtist(name: "Sasha Sloan", gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"])
        autoCreateArtist(name: "Sasha Sloan", gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"])
        autoCreateArtist(name: "Sasha Sloan", gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"])
        autoCreateArtist(name: "Sasha Sloan", gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"])
        autoCreateArtist(name: "Sasha Sloan", gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"])
    }
    
    func autoCreateArtist(name: String, gender: String, musics:[
                          String]) {
        var artist = Artist(name: name, gender: gender, age: 22, musics:musics)
        self.listArtist.append(artist)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listArtist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ArtistCell", owner: self, options: nil)?.first as! ArtistCell
        let name = self.listArtist[indexPath.row].name
        cell.nameLabel.text = name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsPage = self.storyboard?.instantiateViewController(withIdentifier: "ArtistDetails") as! ArtistDetailsViewController
        detailsPage.artist = listArtist[indexPath.row]
        self.navigationController?.pushViewController(detailsPage, animated: true)
    }
}
