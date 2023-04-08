//
//  LegoPresentViewController.swift
//  rg673proj3
//
//  Created by Ryan Gomez on 3/15/23.
//

import UIKit

class LegoPresentViewController: UIViewController {
    
    let legoImageView = UIImageView()
    let darthButton = UIButton()
    let fistoButton = UIButton()
    let obiButton = UIButton()
    var lego: Lego?
    weak var delegate: ChangeImageDelegate?

    init (lego: Lego, delegate: ChangeImageDelegate) {
        self.lego = lego
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        legoImageView.image = UIImage(named: lego.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        legoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(legoImageView)

        darthButton.setImage(UIImage(named: "darthmaul"), for: .normal)
        darthButton.addTarget(self, action: #selector(legoButton), for: .touchUpInside)
        darthButton.tag = 0
        darthButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(darthButton)

        fistoButton.setImage(UIImage(named: "kitfisto"), for: .normal)
        fistoButton.addTarget(self, action: #selector(legoButton), for: .touchUpInside)
        fistoButton.tag = 1
        fistoButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fistoButton)

        obiButton.setImage(UIImage(named: "obiwan"), for: .normal)
        obiButton.addTarget(self, action: #selector(legoButton), for: .touchUpInside)
        obiButton.tag = 2
        obiButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(obiButton)

        setupConstraints()
    }
    

    func setupConstraints() {

        NSLayoutConstraint.activate([
            legoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35),
            legoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35),
            legoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            legoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20)
        ])

        NSLayoutConstraint.activate([
            darthButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            darthButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            darthButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            darthButton.topAnchor.constraint(equalTo: legoImageView.bottomAnchor, constant: 35)
        ])

        NSLayoutConstraint.activate([
            fistoButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            fistoButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            fistoButton.topAnchor.constraint(equalTo: darthButton.bottomAnchor, constant: 15),
            fistoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ])

        NSLayoutConstraint.activate([
            obiButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            obiButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            obiButton.topAnchor.constraint(equalTo: fistoButton.topAnchor),
            obiButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }

    @objc func legoButton(sender: UIButton) {
        if (sender.tag == 0) {
            legoImageView.image = UIImage(named:"darthmaul")
            delegate?.changeImage(image: "darthmaul")
            lego?.image = "darthmaul"
        }
        if (sender.tag == 1) {
            legoImageView.image = UIImage(named:"kitfisto")
            delegate?.changeImage(image: "kitfisto")
            lego?.image = "kitfisto"
        }
        if (sender.tag == 2) {
            legoImageView.image = UIImage(named:"obiwan")
            delegate?.changeImage(image: "obiwan")
            lego?.image = "obiwan"
        }
    }
    

}
protocol ChangeImageDelegate: ViewController {
    func changeImage(image: String)
}

