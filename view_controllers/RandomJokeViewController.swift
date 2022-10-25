import UIKit

class RandomJokeViewController: UIViewController {
    
    @IBOutlet var textJoke: UILabel!
    @IBOutlet var textPunchline: UILabel!
    private var dataTask: URLSessionDataTask?
    @IBOutlet var getJokeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJokeButton.addTarget(self, action: #selector(loadData), for: .touchUpInside)
        loadData()
    }
    
    private var joke:Joke? {
        didSet {
            guard let joke = joke else {return}
            textJoke.text = joke.setup
            textJoke.translatesAutoresizingMaskIntoConstraints = false
            textPunchline.text = joke.punchline
            textPunchline.sizeToFit()
        }
    }
 
    @objc private func loadData() {
        guard let url = URL(string: "https://official-joke-api.appspot.com/jokes/random") else {return}
        dataTask?.cancel()
        dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            if let decodedData = try? JSONDecoder().decode(Joke.self, from: data) {
                DispatchQueue.main.async {
                    self.joke = decodedData
                }
            }
        }
        dataTask?.resume()
    }
}

struct Joke:Decodable {
    let id: Int
    let type:String
    let setup: String
    let punchline: String
}
