//
//  PunchlineView.swift
//  iKid
//
//  Created by stlp on 5/2/22.
//

import UIKit

class PunchlineView: UIViewController {

    @IBOutlet weak var punchlineLabel: UILabel!
    
    var punchline : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        punchlineLabel.text = punchline
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
