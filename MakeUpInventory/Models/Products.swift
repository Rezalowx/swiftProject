//
//  Products.swift
//  MakeUpInventory
//
//  Created by Grégory Brugnet on 10/07/2020.
//  Copyright © 2020 Grégory Brugnet. All rights reserved.
//

import Foundation

/******************** LES LIPSTICKS *****************/
let productFussy = Product(name:"Fussy", brand:"Fenty Beauty", color:"Vieux rose transparent", price:15, note:5, category:.lipstick, imageURL: "https://i.ibb.co/4R8S19r/107179152-753753065438774-4424455233991413186-n.jpg")
let product25 = Product(name:"25", brand:"Sephora Collection", color:"Orange vif", price:8.95,note:4, category:.lipstick, imageURL: "https://i.ibb.co/4R8S19r/107179152-753753065438774-4424455233991413186-n.jpg")

/******************** LES PALETTES*****************/
let productBlushPalette = Product(name:"Blush Palette", brand:"Nyx", color :"", price:30, note:5,category:.palette, imageURL:"https://i.ibb.co/StxrWn3/nyxpalette.jpg")
let productMorphePalette = Product(name:"Blush Palette", brand:"Morphe", color :"", price:35, note:5,category:.palette, imageURL:"https://i.ibb.co/qnkQBC4/morphepalette.jpg")

/******************** LES PENCILS *****************/
let productEyeDuoLilac = Product(name:"Eye duo lilac", brand:"Color Studio", color :"lilac pailleté", price:5, note:5,category:.pencil, imageURL:"https://i.ibb.co/rbNDGv1/107015547-1590748757741644-5166762316353020948-n.jpg")
let productEyeDuoAubergine = Product(name:"Eye duo aubergine", brand:"Color Studio", color :"aubergine", price:5, note:5,category:.pencil, imageURL:"https://i.ibb.co/0n02Xg2/107089080-651371935450513-7090565242679913165-n.jpg")
let productLippie = Product(name:"Lippie pencil Heart On", brand:"Colour Pop", color:"Rose violet", price:6, note:3, category:.pencil, imageURL:"https://i.ibb.co/F3h3Q6v/109281699-645703202962080-6164121806238199729-n.jpg")

let productLippie2 = Product(name:"Lippie pencil Contempo", brand:"Colour Pop", color:"Vieux rose", price:6,note:2, category:.pencil, imageURL:"https://i.ibb.co/4JtLqWx/lippie2.jpg")

let productIcon = Product(name:"Icon", brand:"Huda Beauty", color:"Vieux rose foncé", price:19.99, note:4, category:.pencil, imageURL:"https://i.ibb.co/d0twrjf/106734071-764358914301599-970763582301340487-n.jpg")

let productVenus = Product(name:"Venus", brand:"Huda Beauty", color:"Nude foncé", price:19, note:3, category:.pencil, imageURL:"https://i.ibb.co/3YBDp34/venusnude.jpg")

let productSpiceGirl = Product(name:"Spice girl", brand:"Huda Beauty", color:"Marron clair", price:19, note:2, category:.pencil, imageURL:"https://i.ibb.co/P1Qtw75/spicemarron.jpg")

class Products {
    
    private var productList: Array<Product>

    init(productList: Array<Product> = []) {
        self.productList = productList
    }

    func add(_ product: Product) {
        productList.append(product)
    }

    func remove(atOffsets: IndexSet) {
        productList.remove(atOffsets: atOffsets)
    }
//    func remove(atOffsets: IndexSet, category: Product.Category) {
//        list(category: category).remove(atOffsets: atOffsets)
//        //productList.remove(atOffsets: atOffsets)
//    }
//    
    func list() -> [Product] {
           return productList.sorted()
    }
    
    
    
    
    func lipstickList() -> Array<Product> {
            
        var lipstickList: Array<Product> = []
        for product in self.productList{
            if product.category == .lipstick {
                lipstickList.append(product)
            }
        }
            
        return lipstickList
    }
    
    
    func list(category:Product.Category) -> [Product] {
        var anyList: Array<Product> = []
        for product in self.productList{
            if product.category == category {
                anyList.append(product)
            }
        }
            
        return anyList
    }
    
    func getImagesByCategory(category:Product.Category) -> Array<String>{
        
        var URLs: Array<String> = []
        for product in self.productList{
            if product.category == category {
                URLs.append(product.imageURL!)
            }
        }
        
        return URLs
    }


} 
