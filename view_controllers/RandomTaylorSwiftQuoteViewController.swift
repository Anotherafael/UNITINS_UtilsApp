//
//  RandomTaylorSwiftLyricsViewController.swift
//  utils_app
//
//  Created by aluno on 18/10/22.
//

import UIKit

class RandomTaylorSwiftQuoteViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var songLabel: UILabel!
    @IBOutlet var albumLabel: UILabel!
    @IBOutlet var button: UIButton!
    private var dataTask: URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(loadData) , for: .touchUpInside)
    }
    
    private var quote:Quote? {
        didSet {
            guard let quote = quote else {return}
            quoteLabel.text = quote.quote
            songLabel.text = quote.song
            albumLabel.text = quote.album
        }
    }
    
    @objc private func loadData() {
        guard let url = URL(string: "https://taylorswiftapi.herokuapp.com/get?album=\(textField.text!)") else {return}
        dataTask?.cancel()
        dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            if let decodedData = try? JSONDecoder().decode(Quote.self, from: data) {
                DispatchQueue.main.async {
                    self.quote = decodedData
                }
            }
        }
        dataTask?.resume()
    }
}

struct Quote:Decodable {
    let quote: String
    let song: String
    let album: String
}
