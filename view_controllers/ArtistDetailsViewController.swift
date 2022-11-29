//
//  ArtistDetailsViewController.swift
//  utils_app
//
//  Created by aluno on 29/11/22.
//

import UIKit

class ArtistDetailsViewController: UIViewController {

    var artist:Artist?
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var musicsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLabels()
    }
    
    func loadLabels() {
        nameLabel.text = artist!.name
        ageLabel.text = String("Age: \(artist!.age)")
        genderLabel.text = String("Gender: \(artist!.gender)")
        musicsLabel.text = formatStringMusics(list: artist!.musics)
    }

    func formatStringMusics(list:[String]) -> String {
        var str:String = ""
        for item in list {
            str += String("\(item)\n")
        }
        return str
    }
}
