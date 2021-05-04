import Foundation
import MMDB

open class GeoIP {
    public static let database: MMDB? = {
        guard
            let stringPath = Bundle.main.path(forResource: "GeoLite2-Country", ofType: "mmdb"),
            let database = MMDB(stringPath)
        else {
            assertionFailure()
            return nil
        }
        return database
    }()

    public static func LookUp(_ ipAddress: String) -> MMDBCountry? {
        return GeoIP.database?.lookup(ipAddress)
    }
}
