import Foundation
import SwiftUI

class ModelData: ObservableObject {

    @Published var landmarks: [Landmark] = load("landmarkData.json")
    @Published var profile = Profile.defaultProfile
    
    
    var feature: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var category: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks) { $0.category.rawValue }
    }



}



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }


}
