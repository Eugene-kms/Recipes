import Foundation

protocol LocalRecipeDataSourceProtocol {
    func fetchRecipes() throws -> [RecipeDTO]
}

class LocalRecipeDataSource: LocalRecipeDataSourceProtocol {
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
    
    func fetchRecipes() throws -> [RecipeDTO] {
        guard let url = Bundle.main.url(forResource: "recipes", withExtension: "json") else {
            throw LocalRecipeDataSourceError.fileNotFound("recipes.json")
        }
        
        let data = try Data(contentsOf: url)
        return try decoder.decode([RecipeDTO].self, from: data)
    }
}

