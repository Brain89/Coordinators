import Foundation
import Fakery

private extension String {
    static let locale = "ru"
}

extension Card {

    static func fake() -> Card {
        let faker = Faker(locale: .locale)

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "ru_Ru")

        let balance = faker.number.randomDouble(
            min: 10,
            max: 10_000_000
        )

        return .init(
            name: faker.lorem.word().capitalized,
            number: "· \(faker.number.randomInt(min: 1000, max: 9999))",
            balance: formatter.string(from: .init(value: balance)) ?? "",
            backgroundColor: .systemOrange,
            transactions: (0...10).map{ _ in .fake() }
        )
    }
}
