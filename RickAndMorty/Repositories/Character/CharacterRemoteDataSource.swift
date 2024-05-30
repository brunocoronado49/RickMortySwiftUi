//
//  CharacterRemoteDataSource.swift
//  RickAndMorty
//
//  Created by Bruno  on 28/05/24.
//

import Foundation
import Combine

class CharacterRemoteDataSource {
    static let getAllCharactersUrL: String = "character/"
    static let getPage: String = "?page="
    private let baseUrlString: String
    private let session: URLSession
    
    init(baseUrlString: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        self.baseUrlString = baseUrlString
        self.session = session
    }
    
    func getAllCharacters(page: Int) -> AnyPublisher<ServerBaseArrayResponse<ServerCharactersResponse>, Error> {
        let apiManager = ApiManager(baseUrl: baseUrlString, session: session)
        let urlRequest = getAllCharactersEndpoint(page: page)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
    
    func getCharacterDetail(id: Int) -> AnyPublisher<ServerCharactersResponse, Error> {
        let apiManager = ApiManager(baseUrl: baseUrlString, session: session)
        let urlRequest = getCharacterDetailEndpoint(id: id)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}

extension CharacterRemoteDataSource {
    func getAllCharactersEndpoint(page: Int) -> URLRequest {
        let endpoint = "\(baseUrlString)\(CharacterRemoteDataSource.getAllCharactersUrL)\(CharacterRemoteDataSource.getPage)\(page)"
        
        let components = URLComponents(string: endpoint)
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
    
    func getCharacterDetailEndpoint(id: Int) -> URLRequest {
        let endpoint = "\(baseUrlString)\(CharacterRemoteDataSource.getAllCharactersUrL)\(id)"
        
        let components = URLComponents(string: endpoint)
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
}
