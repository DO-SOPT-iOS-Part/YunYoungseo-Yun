//
//  UsernameCheckService.swift
//  sopt-week4
//
//  Created by 윤영서 on 11/11/23.
//

import Foundation

class UsernameCheckService {
    static let shared = UsernameCheckService()
    private init() {}
    
    func makeRequest(username: String) -> URLRequest {
        let url = URL(string: "http://3.39.54.196/api/v1/members/check?username=\(username)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    
    func PostRegisterData(username: String) async throws -> NickNameDataModel? {
        do {
            let request = self.makeRequest(username: username)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            return parseNicknameData(data: data)
        } catch {
            throw error
        }
    }
    
    private func parseNicknameData(data: Data) -> NickNameDataModel? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(NickNameDataModel.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
}
