//  JsonBundle.swift

import Foundation

extension Bundle {
    func decode<T: Decodable>(filename: String, as type: T.Type) -> T {
        // Attempt to locate the file in the bundle
        guard let url = self.url(forResource: filename, withExtension: nil) else {
            fatalError("Error --> There is no \(filename) in Bundle")
        }
        // Attempt to read the file into a Data object
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Error --> Can't load the data from \(url).")
        }
        // Attempt to decode the Data object into an instance of the provided type
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Error --> Fail to decode data")
        }
        // Return the decoded data
        return decodedData
    }
}

