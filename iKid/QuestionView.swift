//
//  JokeView.swift
//  iKid
//
//  Created by stlp on 5/2/22.
//

import UIKit

class QuestionView: UIViewController {
    
    var question : String = ""
    var rootView : ViewController! = nil

    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionLabel.text = question
    }
    
    @IBAction func next(_ sender: UIButton) {
        let punchlineView = punchlineViewBuilder(rootView.punchline[rootView.tag])
//        print(rootView.GOOD_JOKE_QUESTION)
        rootView.switching(punchlineView)
        
    }
    
    private func punchlineViewBuilder(_ punchline: String) -> PunchlineView{
        let punchlineView = storyboard?.instantiateViewController(withIdentifier: "PunchlineView") as! PunchlineView
        punchlineView.punchline = punchline
        return punchlineView
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
