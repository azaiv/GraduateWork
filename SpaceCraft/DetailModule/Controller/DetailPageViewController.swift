//
//  DetailPageViewController.swift
//  SpaceCraft
//
//  Created by aiv on 20.04.2023.
//

import UIKit

class DetailPageViewController: UIPageViewController, UINavigationControllerDelegate {
    
    let roscosmosdata = Bundle.main.decode([RocketModel].self, from: "RJSON.json")
    let spaceXdata = Bundle.main.decode([RocketModel].self, from: "SJSON.json")
    
    var spaceCraftViewController: [DetailTableViewController] = []
    var indexPage = 0
    var organizationIndex: Int
    
    init(organizationIndex: Int) {
        self.organizationIndex = organizationIndex
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        view.backgroundColor = .init(named: "BackgroundColor")
        setData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData() {
        switch organizationIndex {
        case 0:
            for i in 0...roscosmosdata.count - 1 {
                let vc = DetailTableViewController(spacecraft: roscosmosdata[i])
                spaceCraftViewController.append(vc)
            }
            navigationController?.navigationItem.title = "Роскосмос"
        default:
            for i in 0...spaceXdata.count - 1 {
                let vc = DetailTableViewController(spacecraft: spaceXdata[i])
                spaceCraftViewController.append(vc)
            }
            navigationController?.navigationItem.title = "SpaceX"
        }
        
        setViewControllers([spaceCraftViewController[indexPage]], direction: .reverse, animated: true)
        dataSource = self
    }
}

extension DetailPageViewController: UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 4
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return [spaceCraftViewController].startIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = spaceCraftViewController.firstIndex(of: viewController as! DetailTableViewController) else { return nil
        }
        
        if index == 0 {
            return spaceCraftViewController.last
        } else {
            return spaceCraftViewController[index - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = spaceCraftViewController.firstIndex(of: viewController as! DetailTableViewController) else { return nil
        }
        
        if viewController == spaceCraftViewController.last {
            return spaceCraftViewController.first
        } else {
            return spaceCraftViewController[index + 1]
        }
    }
}
