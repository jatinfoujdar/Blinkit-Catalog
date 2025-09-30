//
//  CategoryModel.swift
//  Blinkit-Catalog
//
//  Created by jatin foujdar on 29/09/25.
//

struct Product{
    let name : String
    let image: String
    let price: Int
}


struct Category{
    let name: String
    let image: String
    let products: [Product]
}

