//
//  ProgTableViewCell.swift
//  CoreDataMVVM3
//
//  Created by CHRISTIAN BEYNIS on 7/24/22.
//

import UIKit
import CoreData


class ProgTableViewCell: UITableViewCell {
    
    //var Arr: [Int] = []
//    var Arr_: [String?]
    static let reuseID = "\(ProgTableViewCell.self)"
    
    
    
    lazy var MusicImageView: UIImageView =  {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "Mean_1")
        imageView.layer.cornerRadius = 15
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = label.font.withSize(14)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Info"
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var overviewLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = label.font.withSize(12)
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        label.text = "Pokemon attributes"
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var progButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.titleLabel?.font = UIFont(name:"GillSans", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add to favorites", for: .normal)
        
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .systemCyan
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(self.progButtonPressed), for: .touchUpInside)
        return button
    }()
    
//    lazy var progButton2: UIButton = {
//        let button = UIButton(frame: .zero)
//        button.titleLabel?.font = UIFont(name:"GillSans", size: 14)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Remove favorite", for: .normal)
//
//        button.setTitleColor(.white, for: .normal)
//        button.tintColor = .systemCyan
//        button.backgroundColor = .clear
//        button.addTarget(self, action: #selector(self.progButtonPressed2), for: .touchUpInside)
//        return button
//    }()
    
//    @objc
//    func progButtonPressed2() {
//
//    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//    let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//    let entity = NSEntityDescription.entity(forEntityName: "FavoriteS", in:context)
//    let NewFav = FavoriteS(entity: entity!,insertInto: context)
//
//
//    NewFav.isDelete = Date()
//
//
//    //print(NewFav.favImg.bytes)
//
//
//
//
//        do {
//
//            try context.save()
//            AlbumInfoList.append(NewFav)
//
//            print("WWWWWWWWOOOOOOOOOOOOOOORRRRRRRRKKKKKKKKKKKKKKKKKEEEEEEEEEEEDDDDDDDDDD")
//            print(  AlbumInfoList[0].name ?? "Ok")
//
//        }
//        catch {print("Nooooooo Waaaaayyyy Heeeerree")}
//
//
//
//    }
//
    
    
    
    @objc
    func progButtonPressed(_ sender: AnyObject) {
        
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
    
     
    let entity = NSEntityDescription.entity(forEntityName: "FavoriteS", in:context)
    
    //let Favorites = FavoriteS(context: context)
    //let AlbumNames = Favorites.value(forKey: "names") as! [FavoriteS]
    
    //var ind_path = 0
    var Arr_: [String?] = []
    //var Arr_Index: [Int] = []

//    for entities_ in AlbumNames{
//        ind_path  = ind_path + 1
        
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
                
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteS")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results
                {
                    let favs = result as! FavoriteS
                    if(favs.name == self.titleLabel.text)
//                    if(favs != nil)
                    {
                        Arr_.append("ok")
                        favs.isDelete = Date()
                        if favs.isDelete == nil{} else
                        {context.delete(favs)
                        sender.setTitle("Add to favorites", for: .normal)
                        //try context.save()
                        }
                        
                        
                        
                        try context.save()
                        
                            
                    }
                }
            }
            catch
            {
                print("Fetch Failed")
            }
        
        
        
        
        
        
//        if entities_.name == self.titleLabel.text{
//            //context.delete(at: IndexPath(row: ind_path, section: 0))
//
//
//            Arr_Index.append(ind_path)
//            Arr_.append(self.titleLabel.text)
//
//            let fetchRequest : NSFetchRequest<NSFetchRequestResult> = FavoriteS.fetchRequest()
//
//
//            fetchRequest.predicate = NSPredicate(format: "name == %@", self.titleLabel.text!)
//
//
//            let results = try! context.fetch(fetchRequest)
//
//            if let container = results.first {
//               print("Thhhheeeeeee coooonnnttttaiinnnneeerr")
//
//            }
//
        //        } != nil
    
        
   // }
        
        
        
        
        
        //print("this is the index", Arr_Index)
        //self.Arr_
        guard Arr_.count == 0 else {return}
             
            print("addinggggggggggggg")
            let NewFav = FavoriteS(entity: entity!,insertInto: context)
                
            NewFav.name = self.titleLabel.text
            NewFav.attrs = self.overviewLabel.text
            NewFav.favImg = self.MusicImageView.image?.jpegData(compressionQuality: 1) as? NSData
            
            do {
                sender.setTitle("Remove from favorites", for: .normal)
                try context.save()
                AlbumInfoList.append(NewFav)
                
                print("WWWWWWWWOOOOOOOOOOOOOOORRRRRRRRKKKKKKKKKKKKKKKKKEEEEEEEEEEEDDDDDDDDDD")
                print(AlbumInfoList[0].name ?? "Ok")
                
            }
            catch {print("Nooooooo Waaaaayyyy Heeeerree")}

            
       
        
    
        
    
//        if (AlbumNames as AnyObject).count > 0{
//            print ("Album Names here", AlbumNames[0].name)
//        } else { print("Oh no it s empttyyy")}
//

        
        
        //NewFav.ids = self.titleLabel.text
        
    
        
    //print(NewFav.favImg.bytes)
       

       

        
            
        

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        self.setUpUI()
    }
    
    required init? (coder: NSCoder){
        fatalError("Init(coder) has not been implemented")
    }
    
    private func setUpUI(){
        self.backgroundColor = .clear
        let hStack = UIStackView(axis: .horizontal , spacing: 8, distribution: .fill)
        let vStack = UIStackView(axis: .vertical , spacing: 8, distribution: .fill)
        
        vStack.addArrangedSubview(self.titleLabel)
        vStack.addArrangedSubview(self.overviewLabel)
        vStack.addArrangedSubview(self.progButton)
        //vStack.addArrangedSubview(self.progButton2)
        
        hStack.addArrangedSubview(self.MusicImageView)
        hStack.addArrangedSubview(vStack)
        
        self.contentView.addSubview(hStack)
        
        hStack.bindToSuperView()
        
    }
    
    func configure(Music_alVM: MusicModelType, index: Int){
        self.MusicImageView.image = UIImage(named: "Mean_1")
        self.titleLabel.text = Music_alVM.AlbumTitle(for: index)
        self.overviewLabel.text = "Album Description"
        Music_alVM.musicImage(for: index) {ImageData in
            guard let ImageData = ImageData else {
                return
            }

            DispatchQueue.main.async{
                self.MusicImageView.image = UIImage(data: ImageData)
                //self.MusicImamgeData = ImageData
            }
        }    }
    
    override func prepareForReuse(){
        self.titleLabel.text = "Album"
        self.overviewLabel.text = "Album Description"
        self.MusicImageView.image = UIImage(named: "Mean_1")
    }
    

}
