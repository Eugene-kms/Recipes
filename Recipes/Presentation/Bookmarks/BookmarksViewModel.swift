import Foundation

class BookmarksViewModel {
    
    private let bookmarkRepository: BookmarkRepositoryProtocol
    private let recipeRepository: RecipeRepositoryProtocol
    
    var bookmarkedRecipes: [Recipe] = []
    var didSelectRecipe: ((Recipe) -> Void)?
    var showError: ((String) -> Void)?
    
    init(bookmarkRepository: BookmarkRepositoryProtocol, recipeRepository: RecipeRepositoryProtocol) {
        self.bookmarkRepository = bookmarkRepository
        self.recipeRepository = recipeRepository
    }
    
    func loadBookmarkedRecipes() async {
        do {
            let bookmarkIds = bookmarkRepository.fetchIds()
            let allRecipes = try await recipeRepository.fetchRecipes()
            let bookmarkedRecipes = allRecipes.filter {
                bookmarkIds.contains($0.id)
            }
            
            await MainActor.run {
                self.bookmarkedRecipes = bookmarkedRecipes
            }
        } catch {
            showError?("error.fetch-recipes".localized + " " + error.localizedDescription)
        }
    }
}
