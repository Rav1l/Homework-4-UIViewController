//
//  ViewController.swift
//  Homework 4 UIViewController
//
//  Created by Ravil Gubaidulin on 12.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobTitelLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var copyAddressButton: UIButton!
    @IBOutlet weak var changeButton: UIButton!
    
    struct User {
        let name: String
        let surname: String
        let patronymic: String
        let job: String
        let address: String
        
        var fullName: String {
            surname + " " + name + " " + patronymic
        }
    }
    
    private var isShortName = false
    private let user = User(name: "Oleg", surname: "Habarov", patronymic: "Ivanovich", job: "Manager", address: "Moscow, Arbat st 1")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.avatarImage.layer.cornerRadius = self.avatarImage.frame.height / 2
        self.nameLabel.text = self.user.fullName
        self.jobTitelLabel.text = self.user.job
        self.addressLabel.text = self.user.address
        self.changeButton.setTitle("Name", for: .normal)
        
    }

    
    @IBAction func didTapCopyAddressButton() {
        UIPasteboard.general.string = self.user.address
    }
    
    @IBAction func didTapChangeButton() {
        self.isShortName.toggle()
        if isShortName {
            self.nameLabel.text = self.user.name
            self.changeButton.setTitle("Full name", for: .normal)
        } else {
            self.nameLabel.text = self.user.fullName
            self.changeButton.setTitle("Name", for: .normal)
        }
    }
}

