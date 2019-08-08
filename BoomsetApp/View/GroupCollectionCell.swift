//
//  GroupCollectionCell.swift
//  BoomsetApp
//
//  Created by Onur Sanver on 7.08.2019.
//  Copyright © 2019 Onur Sanver. All rights reserved.
//

import Foundation
import UIKit

class GroupCollectionCell: UICollectionViewCell {
    
    var groupModel : GroupModel?{
        didSet{
            guard let groupModel = self.groupModel else { return }
            nameTextLabel.text = groupModel.name
            typeTextLabel.text = groupModel.type
            webTextLabel.text = groupModel.website
        }
    }
   
    let nameTextLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.textColor = .purple
        return label
    }()
    let typeTextLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    let webTextLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    func setupView(){
        setupAddView()
        setupAddConstraint()
    }
    func setupAddView(){
        addSubview(nameTextLabel)
        addSubview(typeTextLabel)
        addSubview(webTextLabel)
    }
    func setupAddConstraint(){
        
        nameTextLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, paddingTop: 10, paddingleft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, centerX: nil, centerY: nil)
        typeTextLabel.anchor(top: nameTextLabel.topAnchor, leading: self.nameTextLabel.trailingAnchor, bottom: nil, trailing: nil, paddingTop: 0, paddingleft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, centerX: nil, centerY: nil)
        webTextLabel.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: nil, paddingTop: 0, paddingleft: 10, paddingBottom: 10, paddingRight: 0, width: 0, height: 0, centerX: nil, centerY: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
