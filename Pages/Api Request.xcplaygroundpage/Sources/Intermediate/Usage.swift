import Foundation

//Task.init {
//    do {
//        var authorityClient = AuthorityClient()
//        var authorities = try await authorityClient.getAuthorities()
//        print(authorities.count)
//
//        var ratingClient = RatingClient()
//        var ratings = try await ratingClient.getRatings(schemeTypeId: 1)
//        print(ratings.count)
//
//        let establishmentClient = EstablishmentClient()
//        var establishments = try await establishmentClient.getEstablishments(authorityId: authorities[0].id)
//        print(establishments.count)
//    } catch {
//        print("Fetching establishments failed with error \(error)")
//    }
//}
