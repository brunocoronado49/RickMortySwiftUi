//
//  EpisodeRemoteDataSource.swift
//  RickAndMorty
//
//  Created by Bruno  on 29/05/24.
//

import Foundation
import Combine

class EpisodeRemoteDataSource {
    static let getEpisodeURL: String = "episode"
    static let getPage: String = "?page="
    private let baseUrlString: String
    private let session: URLSession
    
    init(baseUrl: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        self.baseUrlString = baseUrl
        self.session = session
    }
    
    func getEpisode(page: Int) -> AnyPublisher<ServerBaseArrayResponse<ServerGetEpisodeResponse>, Error> {
        let apiManager = ApiManager(baseUrl: baseUrlString, session: session)
        let urlRequest = getEpisodeEndpoint(page: page)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
    
    func getEpisodeDetail(id: Int) -> AnyPublisher<ServerResultsResponse<ServerGetEpisodeResponse>, Error> {
        let apiManager = ApiManager(baseUrl: baseUrlString, session: session)
        let urlRequest = getEpisodeDetailEndpoint(id: id)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}

extension EpisodeRemoteDataSource {
    func getEpisodeEndpoint(page: Int) -> URLRequest {
        let endpoint = "\(baseUrlString)\(EpisodeRemoteDataSource.getPage)\(page)"
        
        let components = URLComponents(string: endpoint)
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
    
    func getEpisodeDetailEndpoint(id: Int) -> URLRequest {
        let endpoint = "\(baseUrlString)\(EpisodeRemoteDataSource.getEpisodeURL)/\(id)"
        
        let components = URLComponents(string: endpoint)
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
}
