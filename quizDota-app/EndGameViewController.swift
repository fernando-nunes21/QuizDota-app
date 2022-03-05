//
//  EndagameViewController.swift
//  quizDota-app
//
//  Created by Fernando on 05/03/22.
//

import UIKit

class EndGameViewController: UIViewController {

    @IBOutlet weak var endPoints: UILabel!
    
    var score : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        endPoints.text = "\(score)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
