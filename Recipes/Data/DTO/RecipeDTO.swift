import Foundation

struct RecipeDTO: Codable {
    let id: String
    let name: String
    let imageURL: String
    let duration: Int
    
    private enum CodingKeys: String, CodingKey {
        case id, name, duration
        case imageURL = "imageUrl"
    }
}

extension RecipeDTO {
    func toDomain() -> Recipe {
        return Recipe(
            id: id,
            name: name,
            imageURL: imageURL,
            duration: duration
        )
    }
}
