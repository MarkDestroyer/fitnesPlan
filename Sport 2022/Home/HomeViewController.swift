//
//  HomeViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 07.02.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var PlanImage: UIImageView!
    @IBOutlet weak var ExerciseImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PlanImage.loadGif(name: "plan")
        let tap = UITapGestureRecognizer(target: self, action: #selector(PresentCalendar))
        PlanImage.addGestureRecognizer(tap)
        PlanImage.isUserInteractionEnabled = true
        ExerciseImage.loadGif(name: "exercise")
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(PresentExercises))
        ExerciseImage.addGestureRecognizer(tap2)
        ExerciseImage.isUserInteractionEnabled = true
    }
    
    
    

    @objc func PresentCalendar() {
     DispatchQueue.main.async {
         guard let vc = self.storyboard?.instantiateViewController(identifier: "SelectDateViewController") else {return}
         guard let window = self.view.window else {return}
         window.rootViewController = vc
        }
     }
     
     
     @objc func PresentExercises() {
      DispatchQueue.main.async {
          guard let vc = self.storyboard?.instantiateViewController(identifier: "ExercisesViewController") else {return}
          guard let window = self.view.window else {return}
          window.rootViewController = vc
         }
      }

}
