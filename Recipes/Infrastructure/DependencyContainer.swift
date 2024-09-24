import Foundation

class DependencyContainer {
    
    lazy var recipeDataSource: LocalRecipeDataSourceProtocol = {
        LocalRecipeDataSource()
    }()
    
    lazy var recipeRepository: RecipeRepositoryProtocol = {
        RecipeRepository(dataSource: recipeDataSource)
    }()
}
