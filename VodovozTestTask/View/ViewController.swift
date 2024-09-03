//
//  ViewController.swift
//  VodovozTestTask
//
//  Created by Maksim Zimens on 03.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var presenter: PresenterProtocol
    
    private lazy var buttonStack: UIStackView = {
        var buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.spacing = 10
        buttonStack.backgroundColor = .red
        return buttonStack
    }()
    
    private lazy var firstButton: UIButton = {
        var firstButton = UIButton()
        return firstButton
    }()
    
    private lazy var seccondButton: UIButton = {
        var firstButton = UIButton()
        return firstButton
    }()
    
    private lazy var thirdButton: UIButton = {
        var firstButton = UIButton()
        return firstButton
    }()
    
    init(presenter: PresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func setupConstraints() {
        [buttonStack].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            buttonStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        [firstButton, seccondButton, thirdButton].forEach {
            buttonStack.addArrangedSubview($0)
        }
    }
    
    private func configureButtons() {
        let names = presenter.getButtonsNames()
        firstButton.setTitle(names[0], for: .normal)
        seccondButton.setTitle(names[1], for: .normal)
        thirdButton.setTitle(names[2], for: .normal)
    }

}

extension ViewController: ViewProtocol {
    func showData() {
        setupConstraints()
        configureButtons()
    }
}

