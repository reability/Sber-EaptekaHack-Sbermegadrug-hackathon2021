//
//  TabPullUp.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import Foundation
import UIKit
import SnapKit


final class TabPullUp: UIViewController, TabPullUpInjected {
    
    // MARK: - Delegate
    
    weak var delegate: TabPullUpOutput?
    
    // MARK: - Parameteres
    
    private var frozen: Bool = false
    private var initialTopOffset: CGFloat = 200.0
    private var currentTopOffset: CGFloat = 0.0
    
    private var topConstraint: Constraint?
    private var headerHeightConstaint: Constraint?
    
    // MARK: - View
    
    lazy private var headerView: UIView = {
        $0.backgroundColor = .blue
        
        return $0
    }(UIView())
    
    lazy private var pullUpView: UIView = {
        $0.backgroundColor = .green
        
        return $0
    }(UIView())
    
    lazy private var pullUpContentView: UIView = {
        return $0
    }(UIView())
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        //view.isUserInteractionEnabled = false
        //headerView.isUserInteractionEnabled = true
        
        setupPan()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initialTopOffset = superheight - 20.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        topConstraint?.update(offset: initialTopOffset)
        currentTopOffset = initialTopOffset
        
        
    }
    
    func setupIn(superView: UIView) {
        superView.addSubview(self.view)
        view.addSubview(pullUpView)
        pullUpView.addSubview(headerView)
        pullUpView.addSubview(pullUpContentView)
        layout()
    }

    
}

private extension TabPullUp {
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard !frozen else { return }
        
        let translation = gesture.translation(in: view).y
        gesture.setTranslation(.zero, in: view)
        
        switch gesture.state {
        case .began:
            break
        case .changed:
            currentTopOffset += translation
            topConstraint?.update(offset: currentTopOffset)
        case .ended:
            break
        default:
            break
        }
        
        
    }
    
}

private extension TabPullUp {
    
    func setupPan() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        headerView.addGestureRecognizer(pan)
    }
    
    
    
}

private extension TabPullUp {
    
    var superheight: CGFloat {
        guard let parent = self.parent else { return 0.0 }
        return parent.view.frame.height
    }
}

private extension TabPullUp {
    
    func layout() {
        view.snp.makeConstraints { maker in
            self.topConstraint = maker.top.equalToSuperview().constraint
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        pullUpView.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.height.equalTo(superheight + 10.0)
        }
        
        headerView.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
            self.headerHeightConstaint = maker.height.equalTo(40.0).constraint
        }
        
        pullUpContentView.snp.makeConstraints { maker in
            maker.top.equalTo(headerView.snp.bottom)
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        
        
    }
    
}
