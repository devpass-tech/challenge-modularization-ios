import Foundation

public struct Activity {
    public let name: String
    public let value: Double

    public var capitalizedName: String {
        name.capitalized
    }

    public var formattedValue: String {
        String(value)
    }

    public init(name: String, value: Double) {
        self.name = name
        self.value = value
    }
}
