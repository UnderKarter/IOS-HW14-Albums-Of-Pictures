//
//  ViewController.swift
//  IOS-HW14-Albums-Of-Pictures
//
//  Created by temp user on 20.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBar()
    }
    
    @objc func createTabBar() {
        
        let tabBarVc = UITabBarController()
        
        let mediaLibraryVC = UINavigationController(rootViewController: MediaLibraryViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let albumsVC = UINavigationController(rootViewController: AlbumsViewController())
        let forYouVC = UINavigationController(rootViewController: ForYouViewController())
        
        mediaLibraryVC.title = "Медиатека"
        forYouVC.title = "Для Вас"
        albumsVC.title = "Альбомы"
        searchVC.title = "Поиск"
        
        tabBarVc.setViewControllers([mediaLibraryVC, forYouVC, albumsVC, searchVC], animated: false)
        
        guard let items = tabBarVc.tabBar.items else {
            return
        }
        
        let images = ["photo.on.rectangle.angled","heart.text.square","rectangle.stack","magnifyingglass"]
        
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }

        tabBarVc.modalPresentationStyle = .fullScreen
        present(tabBarVc, animated: true)
    }
}
