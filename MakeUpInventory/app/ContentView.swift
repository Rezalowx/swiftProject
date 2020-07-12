//
//  ContentView.swift
//  MakeUpInventory
//
//  Created by Grégory Brugnet on 09/07/2020.
//  Copyright © 2020 Grégory Brugnet. All rights reserved.
//

import SwiftUI


struct ContentView: View {
   
    var products = Products(productList: [productFussy, product25, productEyeDuoLilac, productEyeDuoAubergine, productLippie, productLippie2, productIcon, productVenus, productSpiceGirl, productBlushPalette, productMorphePalette])
    
    var body: some View {
        
        NavigationView {
            ZStack{
                Color.white
                .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack {
                        Spacer(minLength: 50)
                        HStack{
                            Group {
                                NavigationLink(destination: TextView(textToDisplay: "My palettes", category: .palette, products: products)) {
                                        Text("🎨")
                                    }
                                
                                NavigationLink(destination: TextView(textToDisplay: "My glitters", category: .glitter, products: products)) {
                                        Text("✨")
                                    }
                            }
                            .font(.system(size: 150))
                            .background(Color.pink)
                        }
                        HStack{
                            Group{
                                NavigationLink(destination: TextView(textToDisplay:"My lipsticks", category: .lipstick, products: products)) {
                                    Text("💄")
                                }
                                NavigationLink(destination: TextView(textToDisplay: "My pencils", category: .pencil, products: products)) {
                                    Text("✏️")
                                }
                            }
                            .font(.system(size: 150))
                            .background(Color.pink)
                        }.padding()
                        HStack{
                            Group {
                                NavigationLink(destination: TextView(textToDisplay: "My liners", category: .liner, products: products)) {
                                    Text("🖍")
                                }
                                NavigationLink(destination: TextView(textToDisplay: "My nail polishes", category: .nailPolish, products: products)) {
                                    Text("💅")
                                }
                            }
                            .font(.system(size: 150))
                            .background(Color.pink)
                        
                        }
                        
                    }
                    .navigationBarTitle("Home")
                }
            }
        }
    }
}


struct TextView: View {
    
    @State private var isDisplayingAlert = false
    var textToDisplay: String
    var productCategory: Product.Category
    var products: Products
    @State private var showForm = false
    @State var listProducts: Array<Product>
    @Environment(\.imageCache) var cache: ImageCache
    var price = 10
    
    init(textToDisplay:String, category:Product.Category, products: Products) {
        self.textToDisplay = textToDisplay
        self.productCategory = category
        _listProducts = State(initialValue: products.list(category: category))
        self.products = products
    }

    var body: some View {
            VStack {
                    List {
                        //ForEach(0..<listProducts.count, id: \.self) { index in
                        ForEach(products.list(category: self.productCategory), id: \.self) { product in
                            HStack {
                                AsyncImage(
                                    //url: URL(string:self.listProducts[index].imageURL!)!,
                                    url: URL(string: product.imageURL!)!,
                                    cache: self.cache,
                                    placeholder: Text("Loading ..."),
                                    configuration: { $0.resizable() }
                                )
                                .scaledToFit()
                                .frame(width: 120.0, height: 120.0)
                                
                                VStack(alignment:.leading){
                                    //Text(String(self.listProducts.count))
                                    Text("#" + product.brand)
                                    //Text("#" + self.listProducts[index].brand)
                                        //.fontWeight(.bold)
                                        .font(.title).bold()
                                        
                                    Spacer()
                                    Text(product.name)
//                                    Text(self.listProducts[index].name)
                                        .font(.caption).italic()
                              
                                
                                    HStack {
                                        Text("#" + product.color)
                                        //Text("#" + self.listProducts[index].color)
                                            .font(.system(size:15))
                                    }
                                    
                                    Text("\(product.price, specifier: "%.2f") 💶")
                                   .font(.caption).italic()
                                                                      
                                }
                                Spacer()
                                VStack {
                                    ForEach(0 ..< product.note) { number in
                                    //ForEach(0 ..< self.listProducts[index].note) { number in
                                        Image(systemName: "star.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 10.0, height: 10.0)
                                    }
                                }
                                
                            }
                            
                        }.onDelete(perform: delete)
                }
            .alert(isPresented: $isDisplayingAlert) {
                        Alert(title: Text("Product has been deleted"))
            }
            }
            .navigationBarTitle(textToDisplay)
            .navigationBarItems(trailing:
                    Button("Add"){
                        self.showForm.toggle()
                    })
        .sheet(isPresented: $showForm) {
            AddMakeUpView(products:self.products, listProducts: self.listProducts)
        }

    }
    
    func delete(at offsets: IndexSet) {
            listProducts.remove(atOffsets: offsets)
            products.remove(atOffsets: offsets)
            self.isDisplayingAlert.toggle()
            //print("après delete : " + String(listProducts.count))
            //products.list(category:.pencil).remove(atOffsets: offsets)
       }
            
    }

    


//struct ImageViewTest: View {
//    @Environment(\.imageCache) var cache: ImageCache
//
//    var productCategory:Product.Category
//    var URLs:Array<URL>
//
//    init(category:Product.Category) {
//        self.productCategory = category
//        self.URLs = products.getImagesByCategory(category:category).compactMap { URL(string:$0) }
//
//    }
//
//    var body: some View {
//         List(URLs, id: \.self) { url in
//            AsyncImage(
//                url: url,
//                cache: self.cache,
//                placeholder: Text("Loading ..."),
//                configuration: { $0.resizable() }
//             )
//            .scaledToFit()
//            //.frame(width: 120.0, height: 120.0)
//            .frame(idealHeight: UIScreen.main.bounds.width / 1 * 0.25 ) // 2:3 aspect ratio
//            VStack(alignment: .leading) {
//                Text("Holà j'ai \(products.list(category: self.productCategory).count) \(self.productCategory.rawValue)")
//                    .font(.caption)
//            }
//
//         }
//    }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
    

