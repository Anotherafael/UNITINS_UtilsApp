//
//  ViewController.swift
//  utils_app
//
//  Created by aluno on 20/09/22.
//

import UIKit

class RandomImageViewController: UIViewController {
    
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemOrange,
        .systemYellow,
        .systemPurple,
    ]
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.contentMode = .scaleAspectFill
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
}
