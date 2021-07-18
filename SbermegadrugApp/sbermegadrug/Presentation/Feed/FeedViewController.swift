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
    
    var service: FirebaseService = FirebaseServiceImp()
    
    var model: FeedEntity!
    weak var tabPullUp: TabPullUpInjected?
    
    // MARK: - View
    
    @objc func didTappedCartButton() {
        let vc = CartViewController()
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    private lazy var cartButtonView: UIButton = {
        $0.setTitle("Корзина", for: .normal)
        $0.backgroundColor = .blue
        $0.addTarget(self, action: #selector(didTappedCartButton), for: .touchUpInside)
        return $0
    }(UIButton())
    
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
        service.getMeds { [weak self] result in
            DispatchQueue.main.async {
                print(result.count)
                self?.model.offers = result.map{ OfferCollectionModel(title: $0.title, imageUrl: $0.imageString, price: $0.price)}
                self?.offerCollectionView.reloadData()
            }
        }
        
        setupCollcetionView()
        
        view.addSubview(bonusDescriptionLabel)
        view.addSubview(bonusValueLabel)
        view.addSubview(offerCollectionView)
        view.addSubview(cartButtonView)
        
        view.backgroundColor = .white
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
        layout.itemSize = CGSize(width: 150, height: 250.0)
        layout.sectionInset = .zero
        layout.scrollDirection = .vertical
        
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MedInfoController()
        vc.model = model.offers![indexPath.row]
                DispatchQueue.main.async {
                    self.present(vc, animated: true, completion: nil)
                }
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
        }
        
        cartButtonView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(70.0)
            maker.trailing.equalToSuperview().offset(-12.0)
        }
        
        
        offerCollectionView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.bottom.equalToSuperview().offset(-30.0)
            maker.top.equalTo(bonusValueLabel.snp.bottom)
        }
        
    }
    
}
