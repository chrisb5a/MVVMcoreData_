//
//  ListViewController.swift
//  CoreDataMVVM3
//
//  Created by CHRISTIAN BEYNIS on 7/24/22.
//

import UIKit
import CoreData

//var AlbumInfoList1 = [FavoriteS]()

class ListViewController: UITableViewController





{

//    lazy var MusicTableView: UITableView = {
//        let table = UITableView(frame: .zero)
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.dataSource = self
//        //table.prefetchDataSource = self
//        table.backgroundColor = .systemFill
//        table.register(ProgTableViewCell.self, forCellReuseIdentifier: ProgTableViewCell.reuseID)
//        return table
//    }()
//
//    //var nonDeletedNotesList = [Any]()
//    var firstLoad = true
//    
//    func nonDeletedNotes() -> [FavoriteS]
//    {
//        var noDeleteNoteList = [FavoriteS]()
//        for note in AlbumInfoList
//        {
//            if(note.isDelete == nil)
//            {
//                noDeleteNoteList.append(note)
//                
//            } else {
//                noDeleteNoteList.append(note)
//                }
//        }
//        //self.nonDeletedNotesList = noDeleteNoteList
//        
//        return noDeleteNoteList
//    }
//    
//    
//
//    
//    override func viewDidLoad()
//    
//    {   view.backgroundColor = .systemGray4
//        
//        self.setUpUI()
//        if(firstLoad)
//        {
//            
//            
//            firstLoad = false
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteS")
//            do {
//                let results:NSArray = try context.fetch(request) as NSArray
//                for result in results
//                {
//                    let note = result as! FavoriteS
//                    AlbumInfoList.append(note)
//                    print(AlbumInfoList)
//                }
//            }
//            catch
//            {
//                print("Fetch Failed")
//            }
//        }
//    }
//    
//    
//    private func setUpUI(){
//        self.view.addSubview(self.MusicTableView)
//        self.MusicTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
//        self.MusicTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        self.MusicTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//        self.MusicTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
//        
//    }
//    
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    
//    {
//        
//        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProgTableViewCell.reuseID, for: indexPath) as? ProgTableViewCell else{
//            return UITableViewCell()
//        }
//        
//        
//        
////        let thisNote: FavoriteS!
////        thisNote = nonDeletedNotes()[indexPath.row]
//        
//        cell.titleLabel.text = "thisNote.name"
//        //cell.overviewLabel.text = thisNote.attrs
//        
//        
//        return cell
//    }
//    
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//        return nonDeletedNotes().count
//        //return 1
//    }
//    
//    override func viewDidAppear(_ animated: Bool)
//    {
//        tableView.reloadData()
//    }
}
