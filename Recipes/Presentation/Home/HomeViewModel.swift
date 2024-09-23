import Foundation

protocol RecipeRepositoryProtocol {
    func fetchRecipes() async throws -> [Recipe]
}

class HomeViewModel {
    
    private let repository: RecipeRepositoryProtocol
    
    var recipes: [Recipe] = []
    var showError: ((String) -> Void)?
    
    init(repository: RecipeRepositoryProtocol) {
        self.repository = repository
    }
    
    func loadRecipes() async {
        do {
            let recipes = try await repository.fetchRecipes()
            self.recipes = recipes
        } catch {
            showError?("error.fetch-recipes".localized + " " + error.localizedDescription)
        }
    }
    
}
