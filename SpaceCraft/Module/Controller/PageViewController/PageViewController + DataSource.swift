import UIKit

extension PageViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        rocketViewController.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return [rocketViewController].startIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = rocketViewController.firstIndex(of: viewController as! RocketViewController) else { return nil }
        
        if index == 0 {
            return rocketViewController.last
        } else {
            
            return rocketViewController[index - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = rocketViewController.firstIndex(of: viewController as! RocketViewController) else { return nil }
        if viewController == rocketViewController.last {
            return rocketViewController.first
        } else {
            return rocketViewController[index + 1]
        }
    }
}

