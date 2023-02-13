//
//  HomeView.swift
//  little-lemon-bistro
//
//  Created by Quang Luu on 09/02/2023.
//

import SwiftUI

let lemonColor = Color(red: 242/255, green: 197/255, blue: 50/255)
let gray30Color = Color.gray.opacity(0.3)
let gray70Color = Color.gray.opacity(0.7)
let darkGreenColor = Color(red: 63/255, green: 84/255, blue: 77/255)

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var menuRepository = MenuRepository()
    
    @State var searchText: String = ""
    
    @State var selectedCategory: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading) {
                VStack(alignment:.leading) {
                    Text("Little Lemon")
                        .font(.system(size: 44.0))
                        .bold()
                        .foregroundColor(Color(red: 242/255, green: 197/255, blue: 50/255))
                    Text("Chicago")
                        .font(.system(size: 26.0))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    HStack {
                        Text("We are a family owned\nMediterranean restaurant,\nfocused on traditional\nrecipes served with a\nmodern twist.")
                            .font(.system(size: 16.0))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        Image("hero-main-dish")
                            .resizable()
                            .scaledToFit()
                            .frame(width:150.0, height:150.0)
                            .cornerRadius(10.0)
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("What's on your mind ?", text: $searchText)
                            .foregroundColor(.primary)
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(6.0)
                }
                .padding()
                .background(darkGreenColor)
                Text("ORDER FOR DELIVERY!")
                    .fontWeight(.semibold)
                    .padding(.leading, 16.0)
                    .padding(.top, 32.0)
                HStack {
                    Text("Starters")
                        .font(.system(size: 14.0))
                        .fontWeight(.semibold)
                        .padding(8.0)
                        .background(selectedCategory == "starters" ? lemonColor : gray30Color)
                        .foregroundColor(selectedCategory == "starters" ? .white : .black)
                        .cornerRadius(14.0)
                        .onTapGesture {
                            selectedCategory = selectedCategory == "starters" ? "": "starters"
                        }
                    Spacer()
                    Text("Mains")
                        .font(.system(size: 14.0))
                        .fontWeight(.semibold)
                        .padding(8.0)
                        .background(selectedCategory == "mains" ? lemonColor : gray30Color)
                        .foregroundColor(selectedCategory == "mains" ? .white : .black)
                        .cornerRadius(14.0)
                        .onTapGesture {
                            selectedCategory = selectedCategory == "mains" ? "": "mains"
                        }
                    Spacer()
                    Text("Desserts")
                        .font(.system(size: 14.0))
                        .fontWeight(.semibold)
                        .padding(8.0)
                        .background(selectedCategory == "desserts" ? lemonColor : gray30Color)
                        .foregroundColor(selectedCategory == "desserts" ? .white : .black)
                        .cornerRadius(14.0)
                        .onTapGesture {
                            selectedCategory = selectedCategory == "desserts" ? "": "desserts"
                        }
                    Spacer()
                    Text("Drinks")
                        .font(.system(size: 14.0))
                        .fontWeight(.semibold)
                        .padding(8.0)
                        .background(selectedCategory == "drinks" ? lemonColor : gray30Color)
                        .foregroundColor(selectedCategory == "drinks" ? .white : .black)
                        .cornerRadius(14.0)
                        .onTapGesture {
                            selectedCategory = selectedCategory == "drinks" ? "": "drinks"
                        }
                }
                .padding([.leading, .trailing, .bottom], 16.0)
                
                FetchedObjects(
                    predicate: buildPredicate(),
                    sortDescriptors: buildSortDescriptors()) {
                        (dishes: [Dish]) in
                        List(dishes, id: \.self) { dish in
                            VStack {
                                DishItemView(dish)
                            }
                        }
                        .listStyle(PlainListStyle())
                        .resignKeyboardOnDragGesture()
                    }
            }
            .navigationBarColor(.white)
            .navigationBarTitle("Home", displayMode: .inline)
//            .navigationBarItems(trailing:HStack {
//                NavigationLink(destination: ProfileView()) {
//                    //Image(systemName: "dot.radiowaves.left.and.right")
//                    Image("v3_0121156")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width:36.0, height:36.0)
//                        .cornerRadius(18.0)
//                        .padding(.bottom, 8.0)
//                }
//            })
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 0.0) {
                        Image("lemon")
                            .resizable()
                            .scaledToFit()
                            .frame(width:34.0, height:34.0)
                            .padding(.bottom, 4.0)
                        Text("LITTLE LEMON")
                            .font(.system(size: 12.0))
                            .fontWeight(.semibold)
                            .foregroundColor(darkGreenColor)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        NavigationLink(destination: ProfileView()) {
                            //Image(systemName: "dot.radiowaves.left.and.right")
                            Image("v3_0121156")
                                .resizable()
                                .scaledToFit()
                                .frame(width:36.0, height:36.0)
                                .cornerRadius(18.0)
                                .padding(.bottom, 8.0)
                        }
                    }
                }
            }
            .task {
                await menuRepository.reload(viewContext)
            }
        }
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            if selectedCategory.count > 0 {
                return NSPredicate(format: "category CONTAINS[cd] %@", selectedCategory)
            }
        } else {
            if selectedCategory.isEmpty {
                return NSPredicate(format: "name CONTAINS[cd] %@", searchText)
            }
            return NSPredicate(format: "name CONTAINS[cd] %@ AND category CONTAINS[cd] %@", searchText, selectedCategory)
        }
        return NSPredicate(value: true)
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        [
            NSSortDescriptor(key: "name", ascending: true, selector: #selector(NSString.localizedStandardCompare)),
        ]
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
