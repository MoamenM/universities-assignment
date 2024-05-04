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
        
        networkLayer.request(UniversitiesRouter.getUniversities, decodeToType: [University].self) { result in
            switch result {
            case .success(let universities):
                print("the first university name is: \(universities.first?.name ?? "")")
                
                let universities = universities.map { university in
                    return UniversityObject(university: university)
                }
                RealmManager.default.updateList(universities)
                
            case .failure(let error):
                print("error is: \(error)")
            }
        }
    }
    
    

    @IBAction func testDatabaseLayerButtonTapped(_ sender: Any) {
        let universities = RealmManager.default.getList(type: UniversityObject.self)
        print("universities count: \(universities?.count ?? -1)")
        print("the first university name is: \(universities?.first?.name ?? "")")
    }
    
}



