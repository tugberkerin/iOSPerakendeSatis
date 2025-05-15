

import Foundation

public enum RemoteDataSourceError: Error {
    case jsonDecodingError(Error)
    case genericServerError
    case noData
    case badRequest
}
