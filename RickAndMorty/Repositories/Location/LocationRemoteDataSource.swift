//
//  LocationRemoteDataSource.swift
//  RickAndMorty
//
//  Created by Bruno  on 30/05/24.
//

import Foundation
import Combine

class LocationRemoteDataSource {
    static let getLocationUrl: String = "location"
    static let getPage: String = "?page="
    private let baseUrlString: String
    private let session: URLSession
    
    init(baseUrlString: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        self.baseUrlString = baseUrlString
        self.session = session
    }
    
    func getLocation(page: Int) -> AnyPublisher<ServerBaseArrayResponse<ServerGetLocationResponse>, Error> {
        let apiManager = ApiManager(baseUrl: baseUrlString, session: session)
        let urlRequest = getLocationEndpoint(page: page)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
    
    func getLocationDetail(id: Int) -> AnyPublisher<ServerResultsResponse<ServerGetLocationResponse>, Error> {
        let apiManager = ApiManager(baseUrl: baseUrlString, session: session)
        let urlRequest = getLocationDetailEndpoint(id: id)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}

extension LocationRemoteDataSource {
    func getLocationEndpoint(page: Int) -> URLRequest {
    }
    
    func getLocationDetailEndpoint(id: Int) -> URLRequest {
    }
}
