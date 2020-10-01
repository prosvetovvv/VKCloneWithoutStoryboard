//
//  TemporaryVC.swift
//  VKCloneWithoutStoryboard
//
//  Created by Vitaly Prosvetov on 28.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class TemporaryVC: UIViewController {
    var temporaryView = TemporaryView()
    let vkManager = VKManager()
    
    override func loadView() {
        super.loadView()
        
        view = temporaryView
        
        temporaryView.backgroundColor = UIColor(named: "LoginVCBackgroundColor")
        
        setupMainStackView()
        setupSearchStackView()
        
        setupFriendButton()
        setupPhotosButton()
        setupGroupsButton()
        setupSearchTextField()
        setupSearchGroupsButton()
    }
}

//MARK: - Setting mainStackView with buttons

extension TemporaryVC {
    
    private func setupMainStackView() {
        temporaryView.mainStackView.axis = NSLayoutConstraint.Axis.vertical
        temporaryView.mainStackView.alignment = .center
        temporaryView.mainStackView.spacing = 40
        temporaryView.mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        temporaryView.setNeedsUpdateConstraints()
    }
    
    private func setupFriendButton() {
        temporaryView.friendsButton.backgroundColor = .white
        temporaryView.friendsButton.setTitle("FRIENDS", for: .normal)
        temporaryView.friendsButton.setTitleColor(.black, for: .normal)
        temporaryView.friendsButton.layer.cornerRadius = 25
        temporaryView.friendsButton.translatesAutoresizingMaskIntoConstraints = false
        
        temporaryView.friendsButton.addTarget(self, action: #selector(friendsButtonTapped), for: .touchUpInside)
        
        temporaryView.setNeedsUpdateConstraints()
        
    }
    
    private func setupPhotosButton() {
        temporaryView.photosButton.backgroundColor = .white
        temporaryView.photosButton.setTitle("PHOTOS", for: .normal)
        temporaryView.photosButton.setTitleColor(.black, for: .normal)
        temporaryView.photosButton.layer.cornerRadius = 25
        temporaryView.photosButton.translatesAutoresizingMaskIntoConstraints = false
        
        temporaryView.photosButton.addTarget(self, action: #selector(photosButtonTapped), for: .touchUpInside)
        
        temporaryView.setNeedsUpdateConstraints()
    }
    
    private func setupGroupsButton() {
        temporaryView.groupsButton.backgroundColor = .white
        temporaryView.groupsButton.setTitle("GROUPS", for: .normal)
        temporaryView.groupsButton.setTitleColor(.black, for: .normal)
        temporaryView.groupsButton.layer.cornerRadius = 25
        temporaryView.groupsButton.translatesAutoresizingMaskIntoConstraints = false
        
        temporaryView.groupsButton.addTarget(self, action: #selector(groupsButtonTapped), for: .touchUpInside)
        
        temporaryView.setNeedsUpdateConstraints()
    }
    
    @objc func friendsButtonTapped() {
        vkManager.fetchFriends()
    }
    
    @objc func photosButtonTapped() {
        let path = "/method/photos.getAll"
        
        vkManager.fetchPhotos(with: path)
    }
    
    @objc func groupsButtonTapped() {
        vkManager.fetchGroups()
    }
}

//MARK: - Setting searchStackView with buttons

extension TemporaryVC {
    
    private func setupSearchStackView() {
        temporaryView.searchStackView.axis = NSLayoutConstraint.Axis.horizontal
        temporaryView.searchStackView.alignment = .center
        temporaryView.searchStackView.spacing = 20
        temporaryView.mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        temporaryView.setNeedsUpdateConstraints()
    }
    
    private func setupSearchGroupsButton() {
        
        let configWight = UIImage.SymbolConfiguration(pointSize: 35.0, weight: .medium)
        let magnifyingGlass = UIImage(systemName: "magnifyingglass", withConfiguration: configWight)
        
        temporaryView.searchGroupsButton.backgroundColor = .clear
        temporaryView.searchGroupsButton.setImage(magnifyingGlass, for: .normal)
        temporaryView.searchGroupsButton.tintColor = .white
        temporaryView.searchGroupsButton.layer.cornerRadius = 25
        temporaryView.searchGroupsButton.translatesAutoresizingMaskIntoConstraints = false
        
        temporaryView.searchGroupsButton.addTarget(self, action: #selector(searchGroupsButtonTapped), for: .touchUpInside)
        
        temporaryView.setNeedsUpdateConstraints()
    }
    
    private func setupSearchTextField() {
        temporaryView.searchTextField.placeholder = "  Search groups"
        temporaryView.searchTextField.layer.cornerRadius = 25
        temporaryView.searchTextField.layer.backgroundColor = UIColor.white.cgColor
        temporaryView.searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        temporaryView.setNeedsUpdateConstraints()
    }
    
    @objc func searchGroupsButtonTapped() {
        vkManager.fetchSearchedGroups(with: temporaryView.searchTextField.text!)
    }
}
