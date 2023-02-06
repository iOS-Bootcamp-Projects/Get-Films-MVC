//
//  FilmsViewController.swift
//  Get Films
//
//  Created by Aamer Essa on 06/12/2022.
//

import UIKit

class FilmsViewController: UIViewController {

    @IBOutlet weak var filmsTabelList: UITableView!
    var data:Films?
    var films = [NSDictionary]()
    override func viewDidLoad() {
        super.viewDidLoad()

        filmsTabelList.delegate = self
        filmsTabelList.dataSource = self
        
        StarWarsModel.getAllFilms(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
                do {
                    // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                    if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                       // print(jsonResult)
                        if let results = jsonResult["results"] as? NSArray {
                                                   for person in results {
                                                       
                                                       let personDict = person as! NSDictionary
                                                       self.films.append(personDict)
                                                       print(self.films)
                                                   }
                                               }
                                        } // end of jsonResult
                    DispatchQueue.main.async {
                        self.filmsTabelList.reloadData()
                    }
                } catch {
                    print("Something went wrong")
                }
        })
    }
    
    


}

extension FilmsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = filmsTabelList.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = films[indexPath.row]["title"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let filemInfoView = storyboard.instantiateViewController(withIdentifier: "FilemInfoView") as! FilmsInfoViewController
        let filemInfo = films [indexPath.row]
        filemInfoView.filem_title = filemInfo["title"] as! String
        filemInfoView.episID = filemInfo["episode_id"] as! Int
        filemInfoView.openingCrw = filemInfo["opening_crawl"] as! String
        filemInfoView.director = filemInfo["director"] as! String
        filemInfoView.producer = filemInfo["producer"] as! String
        filemInfoView.releaseDa = filemInfo["release_date"] as! String
        
        filemInfoView.modalPresentationStyle = .formSheet
        present(filemInfoView, animated: true)
    }
    
    
}
