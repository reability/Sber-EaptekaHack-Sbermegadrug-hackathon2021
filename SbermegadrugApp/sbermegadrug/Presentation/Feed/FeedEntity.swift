//
//  FeedEntity.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

struct FeedEntity {
    
    
    
    var offers: [OfferCollectionModel]?
    
}

extension FeedEntity {

    var stub: FeedEntity {
        return .init(offers: [
            .init(title: "Title", imageUrl: "https://cdn.eapteka.ru/upload/offer_photo/999/55/1_6d483b0739b1eafa7dc9961622946611.jpeg?_cvc=1622209430", price: 100),
            .init(title: "Title", imageUrl: "https://cdn.eapteka.ru/upload/offer_photo/999/55/1_6d483b0739b1eafa7dc9961622946611.jpeg?_cvc=1622209430", price: 100),
            .init(title: "Title", imageUrl: "https://cdn.eapteka.ru/upload/offer_photo/999/55/1_6d483b0739b1eafa7dc9961622946611.jpeg?_cvc=1622209430", price: 100),
            .init(title: "Title", imageUrl: "https://cdn.eapteka.ru/upload/offer_photo/999/55/1_6d483b0739b1eafa7dc9961622946611.jpeg?_cvc=1622209430", price: 100),
            .init(title: "Title", imageUrl: "https://cdn.eapteka.ru/upload/offer_photo/999/55/1_6d483b0739b1eafa7dc9961622946611.jpeg?_cvc=1622209430", price: 100),
        ])
    }

}
