//
//  ViewController.swift
//  iKid
//
//  Created by stlp on 5/2/22.
//

import UIKit

class ViewController: UIViewController {

    private let GOOD_TAG = 0
    private let PUN_TAG = 1
    private let DAD_TAG = 2
    
    var tag = -1
    
//    private var questionView : QuestionView! = nil
//    private var punchlineView : PunchlineView! = nil
    var currentView : UIViewController! = nil
    
    let question : [String] = ["What kind of tea is hard to swallow?", "Light travels faster than sound.", "Why haven’t aliens visited our Solar System yet?"]
    let punchline : [String] = ["Reality.", "That's why some people appear bright until you hear them speak.", "They looked at the reviews… only 1 star!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toQuestionView(_ sender: UIBarButtonItem) {
        tag = sender.tag
//        var question = ""
//        switch sender.tag{
//        case GOOD_TAG: question = GOOD_JOKE_QUESTION
//        case PUN_TAG: question = PUN_JOKE_QUESTION
//        case DAD_TAG: question = DAD_JOKE_QUESTION
//        default: question = ""
//        }
//        print(question)
        let questionView = questionViewBuilder(question[tag])
//        punchlineViewBuilder()
//
        switching(questionView)
    }
    
    func switching(_ to: UIViewController) {
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)

        if currentView != nil &&
            currentView?.view.superview != nil {
//            print("currently we have views")
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            to.view.frame = self.view.frame
            switchViewController(currentView, to)
        }
        else {
//            print("currently we have no views")
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            to.view.frame = view.frame
            switchViewController(nil, to)
        }
        UIView.commitAnimations()
    }
    
    private func switchViewController(_ from: UIViewController?, _ to: UIViewController?) {
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        
        if to != nil {
            self.addChild(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParent: self)
        }
        
        currentView = to
    }
    
    private func questionViewBuilder(_ question: String) -> QuestionView {
        let questionView = storyboard?.instantiateViewController(withIdentifier: "QuestionView") as! QuestionView
//        questionView.questionLabel.text = question
        questionView.question = question
        questionView.rootView = self
        return questionView
    }
    
//    private func punchlineViewBuilder() {
//        if punchlineView == nil {
//            punchlineView = (storyboard?.instantiateViewController(withIdentifier: "PunchlineView") as! PunchlineView)
//        }
//    }
    
}

