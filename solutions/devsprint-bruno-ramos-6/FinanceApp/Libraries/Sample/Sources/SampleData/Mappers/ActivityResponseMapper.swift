import Foundation
import SampleDomain

/// Translates DataModel -> DomainModel
/// 
final class ActivityResponseMapper {
    static func map(from response: ActivityResponse) -> Activity {
        .init(
            name: response.name,
            value: response.value
        )
    }
}
