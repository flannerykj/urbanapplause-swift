//
//  AuthFormView.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-26.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit
import PureLayout

class AuthFormView: UIView {
    
    var shouldSetupConstraints = true

    var stackView: UIStackView!
    var screenTitle: UILabel!
    var emailField: TextField!
    var passwordField: TextField!
    var submitButton: Button!
    
    let screenSize = UIScreen.main.bounds
    
    override init(frame: CGRect) {
         print("initting auth form")
        super.init(frame: frame)
        
        screenTitle = UILabel()
        screenTitle.text = "Login"
        screenTitle.font = UIFont.Types.h1

        emailField = TextField()
        emailField.placeholder = "Email"
        
        passwordField = TextField()
        passwordField.placeholder = "Password"
        
        submitButton = Button()
        submitButton.setTitle("Submit", for: .normal )

        
        stackView = UIStackView(arrangedSubviews: [screenTitle, emailField, passwordField, submitButton])
        
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.spacing = 5

        self.addSubview(stackView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        stackView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero, excludingEdge: .bottom)
        
        if(shouldSetupConstraints) {
            // AutoLayout constraints
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }

}
