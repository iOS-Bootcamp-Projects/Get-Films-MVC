//
//  FilmsInfoViewController.swift
//  Get Films
//
//  Created by Aamer Essa on 07/12/2022.
//

import UIKit

class FilmsInfoViewController: UIViewController {

    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var filemDirector: UILabel!
    @IBOutlet weak var filemProducer: UILabel!
    @IBOutlet weak var openingCrawl: UITextView!
    @IBOutlet weak var episodeID: UILabel!
    @IBOutlet weak var filemTitle: UILabel!
    
    
    var filem_title = String()
    var episID = Int()
    var openingCrw = String()
    var director = String()
    var producer = String()
    var releaseDa = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filemTitle.text = filem_title
        episodeID.text = "\(episID)"
        openingCrawl.text = openingCrw
        filemDirector.text = director
        filemProducer.text = producer
        releaseDate.text = releaseDa
    }
    


}
