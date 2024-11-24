//
//  Connection.swift
//  UMai
//
//  Created by PeterPark on 11/20/24.
//

import Foundation
// MARK: - Response Models
struct UserResponse: Codable {
    let data: UserData
    let support: Support
}

struct UserData: Codable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

struct Support: Codable {
    let url: String
    let text: String
}

// MARK: - Error Model
struct ErrorMessage: Codable {
    let error: String
}
// MARK: - Error Types
enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
    case decodingFailed
}

// MARK: - Network Manager
actor NetworkManager {
    static let shared = NetworkManager()
    private let session: URLSession
    
    private init() {
        let configuration = URLSessionConfiguration.default
        self.session = URLSession(configuration: configuration)
    }
    
    func fetchUser(id: Int) async throws -> UserResponse {
        guard let url = URL(string: "https://reqres.in/api/users/\(id)") else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        let successRange = 200..<300
        guard successRange.contains(httpResponse.statusCode) else {
            // 에러 응답 디코딩 시도
            if let errorMessage = try? JSONDecoder().decode(ErrorMessage.self, from: data) {
                debugPrint("Error Message:", errorMessage)
            }
            throw NetworkError.requestFailed
        }
        
        do {
            let userResponse = try JSONDecoder().decode(UserResponse.self, from: data)
            return userResponse
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}

// MARK: - Usage Example
func getUserInfo() async {
    do {
        let userInfo = try await NetworkManager.shared.fetchUser(id: 2)
        debugPrint("User Info:", userInfo)
    } catch NetworkError.invalidURL {
        debugPrint("Invalid URL")
    } catch NetworkError.requestFailed {
        debugPrint("Request Failed")
    } catch NetworkError.invalidResponse {
        debugPrint("Invalid Response")
    } catch NetworkError.decodingFailed {
        debugPrint("Decoding Failed")
    } catch {
        debugPrint("Unknown Error:", error)
    }
}
