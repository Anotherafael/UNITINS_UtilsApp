//
//  ArtistsViewController.swift
//  utils_app
//
//  Created by aluno on 22/11/22.
//

import UIKit

class ArtistsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tabel: UITableView!
    
    var listArtist:[Artist]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabel.dataSource = self
        tabel.delegate = self
        appendObjList()
        tabel.reloadData()
    }
    
    func appendObjList() {
        self.listArtist.append(Artist(name: "Ariana Grande", age: 24, gender: "Female", musics: ["Santa Tell Me", "7 rings", "Side To Side", "Bang Bang", "Stuck with U"]))
        self.listArtist.append(Artist(name: "Taylor Swift", age: 28, gender: "Female", musics: ["Anti-Hero", "Blank Space", "You Belong With Me", "Enchanted", "Bejeweled"]))
        self.listArtist.append(Artist(name: "Sasha Sloan", age: 23, gender: "Female", musics: ["Dancing With Your Ghost", "Older", "Normal", "Loop", "Lie"]))
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
