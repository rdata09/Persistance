//
//  ViewController.swift
//  rg673proj3
//
//  Created by Ryan Gomez on 3/15/23.
//

import UIKit

class ViewController: UIViewController {
    let legoImageButton = UIButton()
    let legoLabel = UILabel()
    var lego: Lego = Lego(name: "Choose Character", image: "kitfisto")
    let changeNameButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        view.backgroundColor = .white

        legoImageButton.setImage(UIImage(named: lego.image), for: .normal)
        legoImageButton.addTarget(self, action: #selector(presentView), for: .touchUpInside)
        legoImageButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(legoImageButton)

        legoLabel.text = lego.name
        legoLabel.font = .systemFont(ofSize: 30)
        legoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(legoLabel)

        changeNameButton.setTitle("Customize", for: .normal)
        changeNameButton.backgroundColor = .systemBlue
        changeNameButton.layer.cornerRadius = 5
        changeNameButton.addTarget(self, action: #selector(pushView), for: .touchUpInside)
        changeNameButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(changeNameButton)

        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            legoImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            legoImageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            legoImageButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            legoImageButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
      
            legoLabel.topAnchor.constraint(equalTo: legoImageButton.bottomAnchor, constant: 15),
            legoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
            changeNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeNameButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            changeNameButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }

    @objc func presentView() {
        present(LegoPresentViewController(lego: lego, delegate: self), animated: true)
    }

    @objc func pushView() {
        self.navigationController?.pushViewController(LegoPushViewController(), animated: true)
    }
}

extension ViewController: ChangeImageDelegate {
    func changeImage(image: String) {
        legoImageButton.setImage(UIImage(named: image), for: .normal)
    }
    
    
}

