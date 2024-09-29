import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    private var container =  DependencyContainer()
    
    init(window: UIWindow, container: DependencyContainer) {
        self.window = window
        self.container = container
    }
    
    func start() {
        let tabBarController = UITabBarController()
        
        tabBarController.viewControllers = [
            setupHome(),
            setupDiscovery(),
            setupBookmarks(),
            setupProfile()
        ]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    private func setupHome() -> UIViewController {
        let navigationController = UINavigationController()
        navigationController.view.backgroundColor = .background
        navigationController.tabBarItem = UITabBarItem(
            title: "tabBar.home".localized,
            image: UIImage(named: "home"),
            tag: 1
        )
        let homeCoordinator = HomeCoordinator(
            container: container,
            navigationController: navigationController
        )
        homeCoordinator.start()
        
        return navigationController
    }
    
    private func setupDiscovery() -> UIViewController {
        let discoveryVC = UIViewController()
        discoveryVC.view.backgroundColor = .background
        discoveryVC.tabBarItem = UITabBarItem(
            title: "tabBar.discovery".localized,
            image: UIImage(named: "discovery"),
            tag: 1
        )
        return discoveryVC
    }
    
    private func setupBookmarks() -> UIViewController {
        let bookmarkVC = UIViewController()
        bookmarkVC.view.backgroundColor = .background
        bookmarkVC.tabBarItem = UITabBarItem(
            title: "tabBar.bookmarks".localized,
            image: UIImage(named: "bookmark"),
            tag: 1
        )
        return bookmarkVC
    }
    
    private func setupProfile() -> UIViewController {
        let profileVC = UIViewController()
        profileVC.view.backgroundColor = .background
        profileVC.tabBarItem = UITabBarItem(
            title: "tabBar.profile".localized,
            image: UIImage(named: "profile"),
            tag: 1
        )
        return profileVC
    }
}
