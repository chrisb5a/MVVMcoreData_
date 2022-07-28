//
//  ViewController.swift
//  CoreDataMVVM3
//
//  Created by CHRISTIAN BEYNIS on 7/24/22.
//

import UIKit

class ViewController: UITabBarController {
    
        
    
    let MainVc = MainViewController(vm: MusicViewModel(networkManager: NetworkManager()))
    let ListVc = List2ViewController()
//    let ListVc = DetailVC()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        MainVc.title = "Albums"
        //let ListVc = DetailVC()
        ListVc.title = "Favorites"
        self.setViewControllers([MainVc, ListVc], animated: false)
        // Do any additional setup after loading the view.
        
        
        
        
    }


}


class DetailVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
    }
    
}






