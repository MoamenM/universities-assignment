//
//  ViewController.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 03/05/2024.
//

import UIKit

class ViewController: UIViewController {

    private let networkLayer = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        networkLayer.request(UniversitiesRouter.getUniversities, decodeToType: [User].self) { result in
            switch result {
            case .success(let response):
                print("response is: \(response.first?.name ?? "")")
            case .failure(let error):
                print("error is: \(error)")
            }
        }
    }


}



struct User: Codable {
    var name: String
    var country: String
}
