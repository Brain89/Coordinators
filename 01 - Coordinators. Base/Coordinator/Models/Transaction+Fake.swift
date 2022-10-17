import Foundation
import Fakery

private extension String {
    static let locale = "ru"
}

extension Transaction {

    static func fake() -> Transaction {
        let faker = Faker(locale: .locale)

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "ru_Ru")

        let amount = faker.number.randomDouble(
            min: 100,
            max: 100_000
        )

        return .init(
            name: faker.lorem.sentence(),
            amount: formatter.string(from: .init(value: amount)) ?? ""
        )
    }
}
