import Foundation

protocol LocalRecipeDataSourceProtocol {
    func fetchRecipes() throws -> [RecipeDTO]
    func fetchRecipe(with id: String) throws -> RecipeDetailDTO
}

class LocalRecipeDataSource: LocalRecipeDataSourceProtocol {
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
    
    func fetchRecipes() throws -> [RecipeDTO] {
        try fetchFile(with: "recipes")
    }
    
    func fetchRecipe(with id: String) throws -> RecipeDetailDTO {
        try fetchFile(with: "recipe_detail_\(id)")
    }
    
    private func fetchFile<T: Decodable>(with fileName: String) throws -> T {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw LocalRecipeDataSourceError.fileNotFound("\(fileName).json")
        }
        let data = try Data(contentsOf: url)
        let result = try decoder.decode(T.self, from: data)
        
        return result
    }
}

