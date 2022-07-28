//
//  List2ViewController.swift
//  CoreDataMVVM3
//
//  Created by CHRISTIAN BEYNIS on 7/24/22.
//

import UIKit
import CoreData

var AlbumInfoList = [FavoriteS]()


    class List2ViewController: UIViewController {
        
        var ImagePassed = UIImage()
        
        var selectedIndexPath = 0
    //    var sliderValue = 0
        lazy var MVTable: UITableView = {
            let table = UITableView(frame: .zero)
            table.translatesAutoresizingMaskIntoConstraints = false
            table.backgroundColor = .systemGray4
            table.dataSource = self
            table.delegate = self
            table.register(ProgTableViewCell.self, forCellReuseIdentifier: ProgTableViewCell.reuseID )
            return table
        }()
        
        
        
        var firstLoad = true
        
        func nonDeletedNotes() -> [FavoriteS]
        {
            var noDeleteNoteList = [FavoriteS]()
            for note in AlbumInfoList
            {
                if(note.isDelete == nil)
                {
                    noDeleteNoteList.append(note)
                    
                }
            }
            
            //self.nonDeletedNotesList = noDeleteNoteList
            print(noDeleteNoteList.count, "is here")
            
            return noDeleteNoteList
        }
        
        
        
        
        
        
        override func viewDidLoad() {
            
            super.viewDidLoad()
            setUpUI()
            if(firstLoad)
            {
                
                
                firstLoad = false
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteS")
                do {
                    let results:NSArray = try context.fetch(request) as NSArray
                    for result in results
                    {
                        let note = result as! FavoriteS
                        AlbumInfoList.append(note)
                        //print(AlbumInfoList)
                    }
                }
                catch
                {
                    print("Fetch Failed")
                }
            }
            
            self.MVTable.reloadData()
           
            //
           
//            MVTable.reloadData()
            
            // Do any additional setup after loading the view.
        }
        
        private func setUpUI(){
            view.backgroundColor = .systemGray4
            self.view.addSubview(self.MVTable)
            self.MVTable.bindToSuperView()
            
            self.view.addSubview(self.MVTable)
            self.MVTable.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
            self.MVTable.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
            self.MVTable.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
            self.MVTable.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
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

extension List2ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nonDeletedNotes().count
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        
        self.MVTable.reloadData()
    }

    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProgTableViewCell.reuseID, for: indexPath) as? ProgTableViewCell else{
                return UITableViewCell()
            }
            
            let thisNote: FavoriteS!
            thisNote = nonDeletedNotes()[indexPath.row]
            
            
            
                
//            let names = AlbumInfoList.compactMap{$0.name}.reduce(""){
//                partialResult, move in
//                return partialResult + move + "\n"
//            }
            
        
                    
            cell.titleLabel.text = thisNote.name
           
            cell.MusicImageView.layer.cornerRadius = 30
            cell.MusicImageView.layer.masksToBounds = true
            if thisNote.favImg == nil{
                return cell
            }
            cell.MusicImageView.image = UIImage(data: thisNote.favImg as Data, scale: 1.0  )
            //self.ImagePassed = UIImage(data: thisNote.favImg as Data, scale: 1.0  ) ?? UIImage(named: "Mean_1")!
            
            
            return cell
            
        }
    
        
        
        

        
    }


extension List2ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = DetailVc1()
        let navVC = UINavigationController(rootViewController: detailVc)
        navVC.modalPresentationStyle = .automatic
        present(navVC, animated: true)
        
        let thisNote: FavoriteS!
        thisNote = nonDeletedNotes()[indexPath.row]
        
        if thisNote.favImg == nil{
            return
        }
        
        detailVc.ImagePassed = UIImage(data: thisNote.favImg as Data, scale: 1.0  ) ?? UIImage(named: "Mean_1")!
    }
    
}

  
