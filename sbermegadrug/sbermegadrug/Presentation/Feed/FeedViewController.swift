//
//  FeedViewController.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import Foundation
import UIKit
import SnapKit


final class FeedViewController: UIViewController, TabPullUpOutput {
    
    var model: FeedEntity!
    weak var tabPullUp: TabPullUpInjected?
    
    // MARK: - View
    
    lazy private var bonusDescriptionLabel: UILabel = {
        $0.textColor = .black
        
        return $0
    }(UILabel())
    
    lazy private var bonusValueLabel: UILabel = {
        $0.textColor = .black
        
        return $0
    }(UILabel())
    
    private var offerCollectionView: UICollectionView!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        model = FeedEntity().stub
        
        setupCollcetionView()
        
        view.addSubview(bonusDescriptionLabel)
        view.addSubview(bonusValueLabel)
        view.addSubview(offerCollectionView)
        
        view.backgroundColor = .red
        setupText()
        
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(offerCollectionView.collectionViewLayout)
    }
    
    // MARK: - Private
    
    private func setupCollcetionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 190, height: 200.0)
        layout.sectionInset = .zero
        layout.scrollDirection = .horizontal
        
        
        offerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        offerCollectionView.dataSource = self
        offerCollectionView.delegate = self
        
        offerCollectionView.backgroundColor = .gray
        
        registerCollectionCell()
        
    }
    
    private func setupText() {
        bonusDescriptionLabel.text = "Бонусы"
        bonusValueLabel.text = "200"
    }
    
    private func registerCollectionCell() {
        offerCollectionView.register(OfferCollectionViewCell.self, forCellWithReuseIdentifier: "OfferCell")
    }
    
}

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let offers = model.offers {
            return offers.count
        } else { return 0 }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let offer = model.offers![indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCell", for: indexPath) as! OfferCollectionViewCell
        cell.setup(offer)
        return cell
    }
    
}

private extension FeedViewController {
    
    func layout() {
        bonusDescriptionLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(70.0)
            maker.leading.equalToSuperview().offset(12.0)
            maker.trailing.equalToSuperview()
        }
        
        bonusValueLabel.snp.makeConstraints { maker in
            maker.top.equalTo(bonusDescriptionLabel.snp.bottom)
            maker.leading.equalToSuperview().offset(12.0)
            maker.trailing.equalToSuperview()
        }
        
        
        offerCollectionView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.top.equalTo(bonusValueLabel.snp.bottom)
            maker.height.equalTo(200.0)
        }
    }
    
}
