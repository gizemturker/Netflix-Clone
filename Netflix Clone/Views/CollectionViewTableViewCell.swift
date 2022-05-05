//
//  CollectionViewTableViewCell.swift
//  Netflix Clone
//
//  Created by Gizem Turker on 29.04.2022.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell, UITableViewDelegate {
    

    static let identifier = "CollectionViewTableViewCell"
    
    private var titles: [Title] = [Title]()
    
    // the same anynm closure pattern right // private let
    
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        // collectionview size and scroll setting
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // debug
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    public func configure(with titles: [Title]) {
        self.titles = titles
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let model = titles[indexPath.row].poster_path else {
            return UICollectionViewCell()
        }
        cell.configure(with: model)
        
        return cell
    }
    
    func collectionView (_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
}
