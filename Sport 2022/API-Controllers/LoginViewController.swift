//
//  LoginViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 04.02.2022.
//

import Strapi_iOS
import UIKit
import SwiftEntryKit
import AVFoundation

class LoginViewController: UIViewController {
    let strapi = Strapi.shared
    var data: Data?
    
    var audioPlayer = AVAudioPlayer()
    
    func failsound() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "fail2", ofType: "mp3") ?? ""))
            audioPlayer.play()
        } catch {
            print(error)
        }
    }
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PassWordTextField: UITextField!
    @IBOutlet weak var SportImage: UIImageView!
    @IBOutlet weak var ScrollView: UIScrollView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SportImage.loadGif(name: "sport")
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        ScrollView?.addGestureRecognizer(hideKeyboardGesture)
        SportImage.layer.borderWidth = 5
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        viewWillAppear(animated)

        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)

        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func hideKeyboard() {
        self.ScrollView?.endEditing(true)
    }

    
    func setupAttributes() -> EKAttributes {
        var attributes = EKAttributes.bottomFloat
        attributes.displayDuration = .infinity
        attributes.screenBackground = .color(color: .init(light: UIColor(white: 100.0/255.0, alpha: 0.3), dark: UIColor(white: 50.0/255.0, alpha: 0.3)))
        attributes.shadow = .active(
            with: .init(
                color: .black,
                opacity: 0.3,
                radius: 8
            )
        )
        
        attributes.entryBackground = .color(color: .standardBackground)
        attributes.roundCorners = .all(radius: 25)
        
        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .absorbTouches
        attributes.scroll = .enabled(
            swipeable: true,
            pullbackAnimation: .jolt
        )
        
        attributes.entranceAnimation = .init(
            translate: .init(
                duration: 0.7,
                spring: .init(damping: 1, initialVelocity: 0)
            ),
            scale: .init(
                from: 1.05,
                to: 1,
                duration: 0.4,
                spring: .init(damping: 1, initialVelocity: 0)
            )
        )
        
        attributes.exitAnimation = .init(
            translate: .init(duration: 0.2)
        )
        attributes.popBehavior = .animated(
            animation: .init(
                translate: .init(duration: 0.2)
            )
        )
        
        attributes.positionConstraints.verticalOffset = 10
        attributes.statusBar = .dark
        return attributes
    }
    
    func setupMessage() -> EKPopUpMessage {
        
        let image = UIImage(named: "40")!.withRenderingMode(.alwaysOriginal)
        let title = "Данные не введены!"
        let description =
        """
        Введите логин и пароль
        """
        
        let themeImage = EKPopUpMessage.ThemeImage(image: EKProperty.ImageContent(image: image, size: CGSize(width: 60, height: 60), tint: .black, contentMode: .scaleAspectFit))
        
        let titleLabel = EKProperty.LabelContent(text: title, style: .init(font: UIFont.systemFont(ofSize: 24),
                                                                      color: .black,
                                                                      alignment: .center))
        
        let descriptionLabel = EKProperty.LabelContent(
            text: description,
            style: .init(
                font: UIFont.systemFont(ofSize: 16),
                color: .black,
                alignment: .center
            )
        )
        
        let button = EKProperty.ButtonContent(
            label: .init(
                text: "ОК",
                style: .init(
                    font: UIFont.systemFont(ofSize: 16),
                    color: .black
                )
            ),
            backgroundColor: .init(UIColor.systemRed),
            highlightedBackgroundColor: .clear
        )
        
        let message = EKPopUpMessage(themeImage: themeImage, title: titleLabel, description: descriptionLabel, button: button) {
            SwiftEntryKit.dismiss()
        }
        return message
    }
    
    
    func setupMessage2() -> EKPopUpMessage {
        
        let image = UIImage(named: "40")!.withRenderingMode(.alwaysOriginal)
        let title = "Данные не введены!"
        let description =
        """
        Введите логин
        """
        
        let themeImage = EKPopUpMessage.ThemeImage(image: EKProperty.ImageContent(image: image, size: CGSize(width: 60, height: 60), tint: .black, contentMode: .scaleAspectFit))
        
        let titleLabel = EKProperty.LabelContent(text: title, style: .init(font: UIFont.systemFont(ofSize: 24),
                                                                      color: .black,
                                                                      alignment: .center))
        
        let descriptionLabel = EKProperty.LabelContent(
            text: description,
            style: .init(
                font: UIFont.systemFont(ofSize: 16),
                color: .black,
                alignment: .center
            )
        )
        
        let button = EKProperty.ButtonContent(
            label: .init(
                text: "ОК",
                style: .init(
                    font: UIFont.systemFont(ofSize: 16),
                    color: .black
                )
            ),
            backgroundColor: .init(UIColor.systemRed),
            highlightedBackgroundColor: .clear
        )
        
        let message = EKPopUpMessage(themeImage: themeImage, title: titleLabel, description: descriptionLabel, button: button) {
            SwiftEntryKit.dismiss()
        }
        return message
    }
    
    
    func setupMessage3() -> EKPopUpMessage {
        
        let image = UIImage(named: "40")!.withRenderingMode(.alwaysOriginal)
        let title = "Данные не введены!"
        let description =
        """
        Введите пароль
        """
        
        let themeImage = EKPopUpMessage.ThemeImage(image: EKProperty.ImageContent(image: image, size: CGSize(width: 60, height: 60), tint: .black, contentMode: .scaleAspectFit))
        
        let titleLabel = EKProperty.LabelContent(text: title, style: .init(font: UIFont.systemFont(ofSize: 24),
                                                                      color: .black,
                                                                      alignment: .center))
        
        let descriptionLabel = EKProperty.LabelContent(
            text: description,
            style: .init(
                font: UIFont.systemFont(ofSize: 16),
                color: .black,
                alignment: .center
            )
        )
        
        let button = EKProperty.ButtonContent(
            label: .init(
                text: "ОК",
                style: .init(
                    font: UIFont.systemFont(ofSize: 16),
                    color: .black
                )
            ),
            backgroundColor: .init(UIColor.systemRed),
            highlightedBackgroundColor: .clear
        )
        
        let message = EKPopUpMessage(themeImage: themeImage, title: titleLabel, description: descriptionLabel, button: button) {
            SwiftEntryKit.dismiss()
        }
        return message
    }
    
    
    @objc func handleShowPopUp() {
        SwiftEntryKit.display(entry: MyPopUpView(with: setupMessage()), using: setupAttributes())
    }
    
    @objc func handleShowPopUp2() {
        SwiftEntryKit.display(entry: MyPopUpView(with: setupMessage2()), using: setupAttributes())
    }
    
    @objc func handleShowPopUp3() {
        SwiftEntryKit.display(entry: MyPopUpView(with: setupMessage3()), using: setupAttributes())
    }

    

    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {

        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.ScrollView?.contentInset = contentInsets
        ScrollView?.scrollIndicatorInsets = contentInsets
    }

    // Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        ScrollView?.contentInset = contentInsets
        ScrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //"zeons@mail.ru",
    //"P@ssw0rd"
    

    
    
    @IBAction func login() {
        strapi.scheme = "https"
        strapi.host = "fitness.zeons.ru"
        strapi.port = 443
        
        if EmailTextField.text != "" && PassWordTextField.text != "" {
        
        strapi.login(
            identifier:  EmailTextField.text!,
            password: PassWordTextField.text!) { response in
                
                guard let record = response.data  else {return}
                self.data = record as? Data
                print(self.data?.prettyJSON)
                print("Получили ответ, декодим JSON, присвоили его переменным")
                
                do{
                    let userProfile = try? JSONDecoder().decode(UserProfile.self, from: self.data!)
                    Session.shared.userProfile = userProfile
                    Session.shared.token = userProfile!.jwt
                    print("Получили токен ")
                    print(Session.shared.token)
                    DispatchQueue.main.async {
                        guard let vc = self.storyboard?.instantiateViewController(identifier: "HomeViewController") else {return}
                        guard let window = self.view.window else {return}
                        window.rootViewController = vc
                    }
                }catch{
                    print("Operations Error")
                    print(error)
              }
           }
        } else if EmailTextField.text == ""  && PassWordTextField.text == "" {
            print("введите данные")
            handleShowPopUp()
            failsound()
        } else if EmailTextField.text == "" {
            handleShowPopUp2()
            failsound()
        } else if PassWordTextField.text == "" {
            handleShowPopUp3()
            failsound()
        }
    }
    
    
    
    

    
    @IBAction func register() {
        
        strapi.scheme = "https"
        strapi.host = "fitness.zeons.ru"
        strapi.port = 443
        
        if EmailTextField.text != "" && PassWordTextField.text != "" {
        strapi.register(
            username: "My name",
            email: EmailTextField.text!,
            password: PassWordTextField.text!) { response in
                      guard let record = response.data  else {return}
                      self.data = record as? Data
                      print(self.data?.prettyJSON)
                      print("Получили ответ, декодим JSON, присвоили его переменным")
                      
                      do{
                          let userProfile = try? JSONDecoder().decode(UserProfile.self, from: self.data!)
                          Session.shared.userProfile = userProfile
                          Session.shared.token = userProfile!.jwt
                          print("Получили токен ")
                          print(Session.shared.token)
                          DispatchQueue.main.async {
                              guard let vc = self.storyboard?.instantiateViewController(identifier: "HomeViewController") else {return}
                              guard let window = self.view.window else {return}
                              window.rootViewController = vc
                          }
                      }catch{
                          print("Operations Error")
                          print(error)
                    }
                 }
              } else if EmailTextField.text == ""  && PassWordTextField.text == "" {
                  print("введите данные")
                  handleShowPopUp()
                  failsound()
              } else if EmailTextField.text == "" {
                  handleShowPopUp2()
                  failsound()
              } else if PassWordTextField.text == "" {
                  handleShowPopUp3()
                  failsound()
        }
    }
}
