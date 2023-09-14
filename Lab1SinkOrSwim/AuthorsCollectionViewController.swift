//
//  AuthorsCollectionViewController.swift
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/13/23.
//

import UIKit


// Set reuse identifier
private let reuseIdentifier = "CollectCell"


class AuthorsCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
//        self.collectionView!.register(AuthorCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    // ==========================================
    // MARK: Lazy Instantiation
    
    lazy var authorImageModel = {
        return AuthorImageModel.sharedInstance()
    }()
    
    // ==========================================
    // MARK: UI Collection View Data Source
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.authorImageModel.authorNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? AuthorCollectionViewCell,
           let name = self.authorImageModel.authorNames[indexPath.row] as? String {
            cell.imageView.image = self.authorImageModel.getImageWithName(name)
            
            return cell
            
        } else {
            fatalError("Could not dequeue cell")
        }
    }

}
