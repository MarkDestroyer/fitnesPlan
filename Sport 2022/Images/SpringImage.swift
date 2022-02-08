//
//  SpringImage.swift
//  Sport 2022
//
//  Created by Марк Киричко on 07.02.2022.
//

import UIKit
import AVFoundation

class RoundedImageView: UIImageView {
    
    var audioPlayer = AVAudioPlayer()
    
    override func layoutSubviews() {
        self.layer.cornerRadius = self.bounds.width / 2
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tap)
    }
    
    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "spring2", ofType: "mp3") ?? ""))
            audioPlayer.play()
        } catch {
            print(error)
        }
       
        UIView.animate(withDuration: 0.75,
                                    delay: 0,
                                    usingSpringWithDamping: 1.25,
                                    initialSpringVelocity: 1.75,
                                    options: [.allowUserInteraction],
                                    animations: {
                                        self.bounds = self.bounds.insetBy(dx: 30, dy: 30)
                                    },
                                    completion: nil)
    }
}

