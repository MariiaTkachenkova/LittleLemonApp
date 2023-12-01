//
//  MenuItem.swift
//  LittleLemonApp
//
//  Created by Maria Tkachenkova on 01.12.2023.
//

import SwiftUI

struct MenuItemView:View {
    
    let dish:Dish
    
    init(dish: Dish) {
        self.dish = dish
    }
    
    var body: some View {
        
        ZStack {
            HStack {
                VStack(alignment: .leading){
                    Text("\(dish.title ?? "")")
                        .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                    Text("\(dish.desc ?? "")")
                        .lineLimit(2)
                        .fontWeight(.light)
                    Text("$ \(dish.price ?? "")")
                        .fontWeight(.heavy)
                        .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                }
                Spacer()
                AsyncImage(
                    url:URL(string: "\(dish.image ?? "")"),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100, maxHeight: 100)
                    },
                    placeholder: {
                        Rectangle().frame(width:  100, height: 70).foregroundColor(.black)
                    }
                )
            }
        }
    }
}
