import Foundation

/// All successful responses return this, and contains all
/// the metainformation about the returned chunk.


public struct DataContainer<Results: Decodable>: Decodable {
	public let pageSize: Int?
	public let page: Int?
	public let total: Int?
	public let results: Results
}

public struct AuthContainer: Decodable {
    public let token: String?
    public let expires: Date?
    public let user: User?
}

