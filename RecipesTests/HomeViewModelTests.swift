import Foundation
import XCTest

@testable import Recipes

enum MockError: Error {
    case mock
}

class RecipeRepositoryMock: RecipeRepositoryProtocol {
    
    var fetchRecipesResult: [Recipe] = []
    var didFetchRecipes = 0
    var shouldFetchRecipesThrowError = false
    
    func fetchRecipes() async throws -> [Recipes.Recipe] {
        didFetchRecipes += 1
        
        if shouldFetchRecipesThrowError {
            throw MockError.mock
        }
        
        return fetchRecipesResult
    }
    
    func search(with query: String) async throws -> [Recipes.Recipe] { [] }
}

extension Recipe {
    static var mock: Recipe {
        Recipe(id: "0", name: "Lemonade", imageURL: "", duration: 10)
    }
}

class HomeViewModelTests: XCTestCase {
    
    private var viewModel: HomeViewModel!
    private var repository: RecipeRepositoryMock!
    
    override func setUp() async throws {
        try await super.setUp()
        
        repository = RecipeRepositoryMock()
        viewModel = HomeViewModel(repository: repository)
    }
    
    func test_whenFetchSucceeds_thenSaveResults() async {
        //given
        let repositoryResult = [Recipe.mock]
        repository.fetchRecipesResult = repositoryResult
        
        //when
        await viewModel.loadRecipes()
        
        //then
        XCTAssertEqual(viewModel.recipes.count, repositoryResult.count)
        XCTAssertEqual(
            viewModel.recipes.map { $0.name },
            repositoryResult.map { $0.name }
        )
        XCTAssertEqual(repository.didFetchRecipes, 1)
    }
    
    func test_whenFetchFails_thenShowError() async {
        //given
        repository.shouldFetchRecipesThrowError = true
        
        let expection = self.expectation(description: "should show error")
        var errorText: String?
        viewModel.showError = { text in
            expection.fulfill()
            errorText = text
        }
        
        //when
        await viewModel.loadRecipes()
        
        //then
        await fulfillment(of: [expection], timeout: 0.5)
        XCTAssertEqual(errorText, "error.fetch-recipes".localized + " " + MockError.mock.localizedDescription)
    }
}
