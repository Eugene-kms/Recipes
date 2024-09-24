import Foundation

protocol RecipeRepositoryProtocol {
    func fetchRecipes() async throws -> [Recipe]
}

class RecipeRepository: RecipeRepositoryProtocol {
    
    private let dataSource: LocalRecipeDataSourceProtocol
    
    init(dataSource: LocalRecipeDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func fetchRecipes() async throws -> [Recipe] {
        let recipeDTOs = try dataSource.fetchRecipes()
        return recipeDTOs.map { $0.toDomain() }
    }
}
