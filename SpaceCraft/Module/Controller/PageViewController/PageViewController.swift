import UIKit

class PageViewController: UIPageViewController {
    
    var indexPage = 0
    var rocketViewController: [RocketViewController] = []
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        view.backgroundColor = .init(named: "BackgroundColor")
        
        for index in indexPage...RocketData.rocketsData.count - 1 {
            let vc = RocketViewController(rockets: RocketData.rocketsData[index])
            rocketViewController.append(vc)
        }
        
        setViewControllers([rocketViewController[indexPage]], direction: .reverse, animated: false)
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

