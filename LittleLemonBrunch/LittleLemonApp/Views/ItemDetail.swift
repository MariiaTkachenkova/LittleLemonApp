//
//  ItemDetail.swift
//  LittleLemonApp
//
//  Created by Maria Tkachenkova on 01.12.2023.
//

import SwiftUI

struct ItemDetail: View {
    
    let dish: Dish
    
    init(dish: Dish) {
        self.dish = dish
    }
    
    var body: some View {
        
        ScrollView{
            VStack{
                AsyncImage(
                    url:URL(string: "\(dish.image ?? "")"),
                    content: { image in
                        image.resizable()
                            .frame(maxWidth: .infinity)
                            .aspectRatio(contentMode: .fit)
                    },
                    placeholder: {
                        Rectangle()
                            .frame(maxWidth: .infinity, minHeight:300, maxHeight:300)
                    }
                )
                Text("$ \(dish.price ?? "")")
                    .fontWeight(.heavy)
                    .font(
                        Font.custom("Karla", size: 15)
                            .weight(.medium)
                    )
                    .frame(maxWidth: .infinity,alignment: .trailing)
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                Text("\(dish.desc ?? "")")
                    .lineLimit(2)
                    .fontWeight(.light)
                    .font(
                        Font.custom("Karla", size: 15)
                            .weight(.medium)
                    )
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
            }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("\(dish.title ?? "")")
                            .font(
                                Font.custom("Karla", size: 15)
                                    .weight(.medium)
                            )
                            .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                    }
                }
        }
    }
}


