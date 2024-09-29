import Foundation

extension Endpoint {
    static var recipes: Endpoint<[RecipeDTO]> {
        Endpoint<[RecipeDTO]>(pain: "recipes.json")
    }
    
    static func recipeDetail(id: String) -> Endpoint<RecipeDetailDTO> {
        Endpoint<RecipeDetailDTO>(pain: "recipeDetail/\(id).json")
    }
}
