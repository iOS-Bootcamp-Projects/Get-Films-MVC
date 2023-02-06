//
//  ViewController.swift
//  Get Films
//
//  Created by Aamer Essa on 06/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var peopleList: UITableView!
 
    var people = [NSDictionary]()
   

    override func viewDidLoad() {
            super.viewDidLoad()
        peopleList.delegate = self
        peopleList.dataSource = self
        
        
            StarWarsModel.getAllPeople(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
                data, response, error in
                    do {
                        // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                        if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                            if let results = jsonResult["results"] as? NSArray {
                                                       for person in results {
                                                           
                                                           let personDict = person as! NSDictionary

                                                           self.people.append(personDict)
                                                           print(self.people)
            
                                                           
                                                       }
                                                   }
                        }
                        DispatchQueue.main.async {
                            self.peopleList.reloadData()
                            print("🛑🛑🛑")
                            print(self.people)
                            print("🛑🛑🛑")
                        }
                      
                    }    catch {
                        print("Something went wrong")
                    }
            })
        
       
        }
    
  

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = peopleList.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = people[indexPath.row]["name"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let peopleInfoView = storyBoard.instantiateViewController(withIdentifier: "PeopleInfo") as! InfoViewController
        let personInfo = people[indexPath.row]
        peopleInfoView.name = personInfo["name"] as! String
        peopleInfoView.height = personInfo["height"] as! String
        peopleInfoView.mass = personInfo["mass"] as! String
        peopleInfoView.hairColor = personInfo["hair_color"] as! String
        peopleInfoView.eyeColor = personInfo["eye_color"] as! String
        peopleInfoView.birthYear = personInfo["birth_year"] as! String
        peopleInfoView.gender = personInfo["gender"] as! String 
        
        peopleInfoView.modalPresentationStyle = .formSheet 
        present(peopleInfoView, animated: true)
    }
    
    
}
