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
        
        print("func fetchRecipes()-1")
        
        guard let url = Bundle.main.url(forResource: "recipes", withExtension: "json") else {
            throw LocalRecipeDataSourceError.fileNotFound("recipes.json")
        }
        
        print("let url-\(url)")
        
        let data = try Data(contentsOf: url)
        
        print("let data-\(data.count)")
        
        let result = try decoder.decode([RecipeDTO].self, from: data)
        print("let result-\(result)")
        
        return result
    }
}

