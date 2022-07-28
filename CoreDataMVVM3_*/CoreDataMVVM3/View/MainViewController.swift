//
//  MainViewController.swift
//  CoreDataMVVM3
//
//  Created by CHRISTIAN BEYNIS on 7/24/22.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    var ImagePassed = UIImage()
    
    lazy var MusicTableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        //table.prefetchDataSource = self
        table.backgroundColor = .systemFill
        table.register(ProgTableViewCell.self, forCellReuseIdentifier: ProgTableViewCell.reuseID)
        return table
    }()

    
    let MusicVM: MusicModelType
    
    
    init(vm: MusicModelType){
        self.MusicVM = vm
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.MusicVM.bind{
            DispatchQueue.main.async{
                self.MusicTableView.reloadData()
            }
        }
        self.MusicVM.getAlbums()
        view.backgroundColor = .systemGray4
        
        
        
       
        
    }
    
    
    private func setUpUI(){
        self.view.addSubview(self.MusicTableView)
        self.MusicTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.MusicTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.MusicTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.MusicTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.MusicVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {guard let cell = tableView.dequeueReusableCell(withIdentifier: ProgTableViewCell.reuseID, for: indexPath) as? ProgTableViewCell else{
        return UITableViewCell()
    }
    
//    cell.configure(Pokepics: UIImage())
    cell.configure(Music_alVM: self.MusicVM, index: indexPath.row )
    cell.MusicImageView.layer.cornerRadius = 30
    cell.MusicImageView.layer.masksToBounds = true
        

        
    return cell
    }
    
 
    
    
}

//extension MainViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//
//
//    }
//}


extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = DetailVc1()
        let navVC = UINavigationController(rootViewController: detailVc)
        navVC.modalPresentationStyle = .automatic
        present(navVC, animated: true)
        
        
        
        
    }
    
}





//extension MainViewController: UITableViewDataSourcePrefetching {
//    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
//        let lastIndexPath = IndexPath(row: self.MusicVM.count - 1, section: 0)
//        guard indexPaths.contains(lastIndexPath) else{return}
//        self.MusicVM.getAlbums()
//    }
//
//
//}

