//
//  MainPageViewController.swift
//  SpaceCraft
//
//  Created by aiv on 20.04.2023.
//

import UIKit

class MainPageViewController: UIPageViewController {
    
    let data = Bundle.main.decode([SpaceCraftModel].self, from: "SpaceCraftJSON.json")
    var spaceCraftViewController: [SpaceCraftViewController] = []
    var indexPage = 0
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...data.count - 1 {
            let vc = SpaceCraftViewController(spacecraft: data[i])
            spaceCraftViewController.append(vc)
        }
        
        setViewControllers([spaceCraftViewController[indexPage]], direction: .reverse, animated: false)
        dataSource = self
    }
}

extension MainPageViewController: UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        data.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return [spaceCraftViewController].startIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = spaceCraftViewController.firstIndex(of: viewController as! SpaceCraftViewController) else { return nil
        }
        
        if index == 0 {
            return spaceCraftViewController.last
        } else {
            return spaceCraftViewController[index - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = spaceCraftViewController.firstIndex(of: viewController as! SpaceCraftViewController) else { return nil
        }
        
        if viewController == spaceCraftViewController.last {
            return spaceCraftViewController.first
        } else {
            return spaceCraftViewController[index + 1]
        }
    }
}
