//
//  AddMakeUpView.swift
//  MakeUpInventory
//
//  Created by Grégory Brugnet on 12/07/2020.
//  Copyright © 2020 Grégory Brugnet. All rights reserved.
//

import SwiftUI
import UserNotifications

struct AddMakeUpView: View {
    
//    public init(products: Products, listProducts:Array<Product>) {
//        self.products = products
//        self.listProducts = listProducts
//    }
    @ObservedObject var notificationManager = LocalNotificationManager()
    @State private var isDisplayingAlert = false
    
    @State private var name: String = ""
    @State private var price: String = ""
    @State private var category: Product.Category = .glitter
    @State private var brand: String = ""
    @State private var color: String = ""
    @State private var note: String = ""
    @State private var imageURL: String = ""

    @Environment(\.presentationMode) var presentation

    var products: Products
    @State var listProducts: Array<Product>

    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $category, label: Text("Category"), content: {
                    ForEach(Product.Category.allCases) { cat in
                        Text(cat.rawValue)
                    }
                })
                
                TextField("Product name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                //TextField("Price" ,value: $price, formatter: NumberFormatter())
                TextField("Price" ,text: $price)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Brand", text: $brand)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Color", text: $color)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Note", text: $note)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                TextField("Image URL", text: $imageURL)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Section {
                    Button("Save") {
                        //let testPrice:Double = Double(self.price)
                        let testPrice = Double(self.price) ?? 0.0
                        let testNote = Int(self.note) ?? 0
                        let productCreated = Product(name: self.name, brand: self.brand, color: self.color, price: testPrice, note:testNote, category: self.category, imageURL:self.imageURL)
                        print("Note : " + String(productCreated.note))

                        self.products.add(productCreated)
                        self.listProducts.append(productCreated)
                        
                        //print(String(self.listProducts.count))
                        
                        //self.notificationManager.sendNotification(title: "Hurray!", subtitle: "TEST", body: "If you see this text, launching the local notification worked!", launchIn: 5)
                        //self.isDisplayingAlert.toggle()
                        
                        self.presentation.wrappedValue.dismiss()
                    }
//                    .alert(isPresented: $isDisplayingAlert) {
//                        Alert(title: Text("This is an alert"))
//                    }
                }
            }
        }
    }
}



struct AddMakeUpView_Previews: PreviewProvider {
    static var previews: some View {
        AddMakeUpView(products: Products(), listProducts: Array<Product>())
    }
}
