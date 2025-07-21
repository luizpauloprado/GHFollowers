//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Luiz Paulo on 13/06/25.
//

import UIKit

class SearchVC: UIViewController {
    let logo = UIImageView()
    let username = GFTextField()
    let button = GFButton(color: .systemGreen, title: "Get Followers", systemImageName: "person.3")
    var isUsernameEntered: Bool { return !username.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(logo, username, button)
        configureLogo()
        configureUsername()
        configureButton()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        username.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func configureLogo() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = Images.ghLogo
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 20 : 80),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 200),
            logo.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        logo.contentMode = .scaleAspectFit
        logo.tintColor = .label
    }
    
    func configureUsername() {
        username.delegate = self
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 48),
            username.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            username.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            username.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureButton() {
        button.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVC() {
        guard isUsernameEntered else {
            presentGFAlert(title: "Empty Username",
                                       message: "Please enter a username. We need to know who to look for on GitHub 😀.",
                                       buttonTitle: "Ok")
            return
        }
        
        username.resignFirstResponder()
        
        let followerListVC = FollowerListVC(username: username.text!)
        navigationController?.pushViewController(followerListVC, animated: true)
    }
}

extension SearchVC:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
