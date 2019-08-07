//
//  ViewController.swift
//  BoomsetApp
//
//  Created by Onur Sanver on 7.08.2019.
//  Copyright © 2019 Onur Sanver. All rights reserved.
//

import UIKit

class GroupListViewController: UIViewController ,UICollectionViewDelegate  , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    var groupModels : [GroupModel] = [GroupModel]()
    
    lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .clear
        cv.delegate = self
        cv.dataSource = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .lightText
        setupView()
        getGroupModelApi()
       
    }
    fileprivate func setupView(){
        setupAddView()
        setupAddAnchor()
        setupCollectionView()
    }
    fileprivate func setupAddView(){
        view.addSubview(collectionView)
        
    }
    fileprivate func setupAddAnchor(){
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, paddingTop: 10, paddingleft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, centerX: nil, centerY: nil)
    }
    fileprivate func setupCollectionView(){
        collectionView.register(GroupCollectionCell.self, forCellWithReuseIdentifier: "cellId")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! GroupCollectionCell
        cell.groupModel = self.groupModels[indexPath.row]
        cell.backgroundColor = .white
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 62)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func getGroupModelApi(){
        ApiService.shared.getGroupModels { (groupModels) in
            guard let groupModelArray = groupModels else { return }
            self.groupModels.removeAll()
            self.groupModels.append(contentsOf: groupModelArray)
           
            DispatchQueue.main.async {
                 self.collectionView.reloadData()
            }
        }
       
    }
}

