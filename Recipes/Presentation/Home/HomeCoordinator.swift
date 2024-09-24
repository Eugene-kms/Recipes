import UIKit

class HomeCoordinator: Coordinator {
    
    private let container: DependencyContainer
    var navigationController: UINavigationController
    
    init(container: DependencyContainer, navigationController: UINavigationController) {
        self.container = container
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = HomeViewModel(repository: container.recipeRepository)
        let viewController = HomeViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: false)
    }
}
