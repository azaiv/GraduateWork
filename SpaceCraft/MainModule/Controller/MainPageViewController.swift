//
//  MainPageViewController.swift
//  SpaceCraft
//
//  Created by aiv on 03.05.2023.
//

import UIKit

class MainPageViewController: UIPageViewController {
    
    var model: [MainModel] = []
    var organizationsController: [MainViewController] = []
    var indexPage = 0
    
    private let backgroundImage = UIImageView()
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        self.model = appendOrganization()
        
        setupViews()
        constraintViews()
        configureApperance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainPageViewController: UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        model.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return [organizationsController].startIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = organizationsController.firstIndex(of: viewController as! MainViewController) else { return nil
        }
        
        if index == 0 {
            return organizationsController.last
        } else {
            return organizationsController[index - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = organizationsController.firstIndex(of: viewController as! MainViewController) else { return nil }
        
        if viewController == organizationsController.last {
            return organizationsController.first
        } else {
            return organizationsController[index + 1]
        }
    }
}

extension MainPageViewController {
    
    func setupViews() {
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constraintViews() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func configureApperance() {
        for i in 0...model.count - 1 {
            let vc = MainViewController(index: i)
            organizationsController.append(vc)
        }
        
        setViewControllers([organizationsController[0]], direction: .reverse, animated: false)
        dataSource = self
        
        backgroundImage.layer.masksToBounds = true
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.image = .init(named: "BackgroundImage")
    }
    
    func appendOrganization() -> [MainModel] {
        let roskosmos = MainModel(index: 0)
        let spaceX = MainModel(index: 1)
        return [roskosmos, spaceX]
    }
}
