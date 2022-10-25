//
//  RandomAdviceViewController.swift
//  utils_app
//
//  Created by aluno on 18/10/22.
//

import UIKit

class RandomAdviceViewController: UIViewController {
    
    @IBOutlet var button: UIButton!
    @IBOutlet var adviceLabel: UILabel!
    @IBOutlet var labelAdvice: UILabel!
    private var dataTask: URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        button.addTarget(self, action: #selector(loadData), for: .touchUpInside)
    }
    
    private var slip:Slip? {
        didSet {
            guard let slop = slip else {return}
            adviceLabel.text = slop.slip.advice.description
            adviceLabel.translatesAutoresizingMaskIntoConstraints = false
        }
    }
 
    @objc private func loadData() {
        guard let url = URL(string: "https://api.adviceslip.com/advice") else {return}
        dataTask?.cancel()
        dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            if let decodedData = try? JSONDecoder().decode(Slip.self, from: data) {
                print(decodedData)
                DispatchQueue.main.async {
                    self.slip = decodedData
                }
            }
        }
        dataTask?.resume()
    }
}

struct Slip:Decodable {
    let slip:Advice
}

struct Advice:Decodable {
    let id: Int
    let advice: String
}
