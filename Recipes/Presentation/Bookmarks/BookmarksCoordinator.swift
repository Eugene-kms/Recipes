import UIKit

class BookmarksCoordinator: Coordinator {
    let navigationController: UINavigationController
    private let container: DependencyContainer
    
    init(navigationController: UINavigationController, container: DependencyContainer) {
        self.navigationController = navigationController
        self.container = container
    }
    
    func start() {
        let viewModel = BookmarksViewModel(
            bookmarkRepository: container.bookmarkRepository,
            recipeRepository: container.recipeRepository
        )
        let bookmarksVC = BookmarksViewController(viewModel: viewModel)
        bookmarksVC.coordinator = self
        bookmarksVC.title = "tabBar.bookmarks".localized
        
        viewModel.didSelectRecipe = { [weak self] recipe in
            self?.showRecipeDetail(for: recipe)
        }
        
        navigationController.pushViewController(bookmarksVC, animated: false)
    }
    
    private func showRecipeDetail(for recipe: Recipe) {
        let viewModel = RecipeDetailViewModel(
            id: recipe.id,
            container: container
        )
        let detailVC = RecipeDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(detailVC, animated: true)
    }
}
