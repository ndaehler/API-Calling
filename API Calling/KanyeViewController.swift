//
//  ViewController.swift
//  API Calling
//
//  Created by Noelle Daehler on 2/3/20.
//  Copyright © 2020 Noelle Daehler. All rights reserved.
//

import UIKit

class KanyeViewController: UIViewController {
    
    @IBOutlet weak var showQuoteLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newButton: UIButton!
    var quotes = [String : String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "kanye quotes"
        self.title = "Kanye"
        let query = "https://api.kanye.rest"
        if let url = URL(string: query) {
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                parse(json: json)
                return
            }
        }
        loadError()
    }
    
    func parse (json :JSON)
    {
        //for result in json["quotes"].arrayValue {
        let quote = json["quote"].stringValue
        print(quote)
        showQuoteLabel.text = quote
        let finalQuote = ["quote": quote]
        
    }
    
    @IBAction func whenButtonTapped(_ sender: Any) {
        
    }
    
    func loadError() {
        DispatchQueue.main.async {
            [unowned self] in
            let alert = UIAlertController(title: "Loading Error", message: "There was a problem loading the Kanye quote", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func onTappedDoneButton(_ sender: Any) {
        exit(0)
    }
}
