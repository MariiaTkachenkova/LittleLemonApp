//
//  Menu.swift
//  LittleLemonApp
//
//  Created by Maria Tkachenkova on 30.11.2023.
//

import SwiftUI
import CoreData

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var searchText = ""
    @State private var searchCategory = ""
    @State private var selectedCategory: String? = nil
    
    @FetchRequest(entity: Dish.entity(), sortDescriptors: []) var dishes: FetchedResults<Dish>
    
    let menuURL = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 185, height: 40)
                        .clipped()
                    
                    Image("profile-image-placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 56, height: 54)
                        .clipped()
                        .padding(.trailing, 5)
                    
                }
                .padding(.top, 50)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                        .frame(width: 428, height: 309)
                    
                    Image("Hero image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 139, height: 144)
                        .clipped()
                        .cornerRadius(16)
                        .frame(width: 200, height: 100)
                        .frame(width: 1, alignment: .leading)
                    
                    VStack(spacing: 20) {
                        Text("Little Lemon")
                            .font(
                                Font.custom("Markazi Text", size: 64)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.96, green: 0.81, blue: 0.08))
                            .frame(width: 350, alignment: .leading)
                            .padding(.top)
                        
                        Text("Chicago")
                            .font(Font.custom("Markazi Text", size: 60))
                            .foregroundColor(.white)
                            .frame(height: 30)
                            .frame(width: 350, alignment: .leading)
                        
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(.white)
                            .frame(width: 200, height: 100)
                            .frame(width: 350, alignment: .leading)
                        
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 378, height: 37)
                            .background(Color.white)
                            .cornerRadius(7)
                            .overlay(
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                        .padding(.leading, 10)
                                    Spacer()
                                    TextField("Search", text: $searchText)
                                        .padding(.horizontal)
                                    
                                }
                            )
                    }
                }
                Text("ORDER FOR DELIVERY!")
                    .font(
                        Font.custom("Karla", size: 20)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                    .frame(width: 350, alignment: .leading)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        Button(action: {
                            selectedCategory = "starters"
                        }) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color(red: 0.93, green: 0.94, blue: 0.93))
                                    .frame(width: 80, height: 34)
                                    .cornerRadius(7)
                                
                                Text("Starters")
                                    .font(
                                        Font.custom("Karla", size: 16)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                            }
                        }
                        
                        Button(action: {
                            selectedCategory = "mains"
                        }) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color(red: 0.93, green: 0.94, blue: 0.93))
                                    .frame(width: 80, height: 34)
                                    .cornerRadius(7)
                                
                                Text("Mains")
                                    .font(
                                        Font.custom("Karla", size: 16)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                            }
                        }
                        
                        Button(action: {
                            selectedCategory = "desserts"
                        }) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color(red: 0.93, green: 0.94, blue: 0.93))
                                    .frame(width: 80, height: 34)
                                    .cornerRadius(7)
                                
                                Text("Desserts")
                                    .font(
                                        Font.custom("Karla", size: 16)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                            }
                        }
                        
                        Button(action: {
                            selectedCategory = "sides"
                        }) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color(red: 0.93, green: 0.94, blue: 0.93))
                                    .frame(width: 80, height: 34)
                                    .cornerRadius(7)
                                
                                Text("Sides")
                                    .font(
                                        Font.custom("Karla", size: 16)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                                
                            }
                            
                        }
                    }
                }.padding(10)
                Divider()
                List {
                    ForEach(dishes, id: \.self) { dish in
                        NavigationLink(destination: ItemDetail(dish: dish)) {
                            MenuItemView(dish: dish)
                        }
                    }
                }
                .onAppear {
                    getMenuData(viewContext)
                }
                
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    Menu()
}

extension Menu {
    
    func getMenuData(_ context:NSManagedObjectContext){
        PersistenceController.shared.clear()
        let url = URL(string: menuURL)!
        let request = URLRequest(url: url)
        let downloadTask = URLSession.shared.dataTask(with: request){data, response, error in
            if let data = data{
                let dish = try! JSONDecoder().decode(MenuList.self, from: data)
                if(!dish.menu.isEmpty){
                    for dishItem in dish.menu
                    {
                        let myDish = Dish(context: context)
                        myDish.image = dishItem.image
                        myDish.price = dishItem.price
                        myDish.title = dishItem.title
                        myDish.desc = dishItem.description
                        myDish.category = dishItem.category
                    }
                    try? context.save()
                }
            }
        }
        downloadTask.resume()
    }
    
    func buildSortDescriptors()->[NSSortDescriptor]{
        return [
            NSSortDescriptor(
                key: "title",
                ascending: true,
                selector: #selector(NSString .localizedCaseInsensitiveCompare)
            ),
        ]
    }
    
    func buildPredicate() -> NSPredicate {
        if(searchText != ""){
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
        else if(searchCategory != ""){
            return NSPredicate(format: "category CONTAINS[cd] %@", searchCategory)
        }
        else
        {
            return NSPredicate(format: "TRUEPREDICATE")
        }
    }
    
}
