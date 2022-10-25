//
//  RandomFoxViewController.swift
//  utils_app
//
//  Created by aluno on 18/10/22.
//

import UIKit

class RandomFoxViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var button: UIButton!
    private var dataTask: URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.contentMode = .scaleToFill
        loadData()
        button.addTarget(self, action: #selector(loadData), for: .touchUpInside)
    }
    
    private var fox:Fox? {
        didSet {
            guard let fox = fox else {return}
            let url = URL(string: fox.image)!
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            imageView.image = UIImage(data: data)
        }
    }
 
    @objc private func loadData() {
        guard let url = URL(string: "https://randomfox.ca/floof/") else {return}
        dataTask?.cancel()
        dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            if let decodedData = try? JSONDecoder().decode(Fox.self, from: data) {
                DispatchQueue.main.async {
                    self.fox = decodedData
                }
            }
        }
        dataTask?.resume()
    }
}

struct Fox:Decodable {
    let image: String
    let link: String
}
