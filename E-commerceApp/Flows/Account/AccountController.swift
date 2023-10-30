//
//  AccountController.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 12.10.2023.
//

import UIKit

class AccountController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = Resources.Strings.navBar.account
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.account
        initialize()
        addNavBarButton(at: .left, with: Resources.Strings.account.navBarLeft)
        addNavBarButton(at: .right, with: Resources.Strings.account.navBarRight)
    }
    private let regBUtton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Resources.Colors.active
        button.setTitle("Reg", for: .normal)
        return button
    }()
    private let authBUtton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Resources.Colors.active
        button.setTitle("Auth", for: .normal)
        return button
    }()
}

//TEST EXTENSION
extension AccountController {
    func initialize() {
        view.addSubview(regBUtton)
        view.addSubview(authBUtton)
        
        regBUtton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(50)
        }
        authBUtton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(regBUtton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(50)

        }
    }
}
