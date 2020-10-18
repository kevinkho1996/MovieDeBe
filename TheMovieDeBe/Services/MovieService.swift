//
//  MovieService.swift
//  TheMovieDeBe
//
//  Created by Kevin Kho on 14/10/20.
//

import Foundation

protocol MovieService {
    func fetchMovies(from endpoint: MovieListEndpoint, completion: @escaping (Result<MovieResponse, MovieError>) -> ()) // to fetch all movies
    func fetchMovie(id: Int, completion: @escaping (Result<Movie, MovieError>) -> ()) // to fetch movie detail
    func searchMovie(query: String, completion: @escaping (Result<MovieResponse, MovieError>) ->()) // to search movie
}

enum MovieListEndpoint: String, CaseIterable {
    case nowPlaying = "now_playing"
    case topRated = "top_rated"
    case upcoming
    case popular
    
    var description: String {
        switch self {
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "Upcoming"
        case .topRated: return "Top Rated"
        case .popular: return "Popular"
        }
    }
}

enum MovieError: Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to fetch data"
        case .invalidEndpoint: return "Invalid Endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data"
        case .serializationError: return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
