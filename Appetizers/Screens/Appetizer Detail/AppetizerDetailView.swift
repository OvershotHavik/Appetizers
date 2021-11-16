//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/16/21.
//

import SwiftUI
enum nutrients: String{
    case calories = "Calories"
    case carbs = "Carbs"
    case protein = "Protein"
}


struct AppetizerDetailView: View {
    @Binding var isShowingDetail: Bool
    let appetizer: Appetizer
    
    var body: some View {
        VStack{
            AppetizerImageView(appetizer: appetizer)
            
            AppetizerDescriptionView(appetizer: appetizer)
            
            HStack(spacing: 50){
                NutrientView(nutrient: nutrients.calories.rawValue, nutrientValue: appetizer.calories)
                NutrientView(nutrient: nutrients.carbs.rawValue, nutrientValue: appetizer.carbs)
                NutrientView(nutrient: nutrients.protein.rawValue, nutrientValue: appetizer.protein)
            }
            
            Spacer()
            
            Button {
                //do something
            } label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add To Order")
            }

        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            DismissButton(isShowingDetail: $isShowingDetail)
        }
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(isShowingDetail: .constant(true), appetizer: MockData.sampleAppetizer)
    }
}

// MARK: - Nutrient View
struct NutrientView: View{
    var nutrient: String
    var nutrientValue: Int
    
    var body: some View{
        VStack(spacing: 10){
            Text(nutrient)
                .font(.caption)
                .fontWeight(.bold)

            if nutrient == nutrients.carbs.rawValue{
                Text("\(nutrientValue) g")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    .italic()
            }
            
            if nutrient == nutrients.protein.rawValue{
                Text("\(nutrientValue) g")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    .italic()
            }
            
            if nutrient == nutrients.calories.rawValue{
                Text("\(nutrientValue)")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    .italic()
            }
        }
    }
}

// MARK: - Appetizer Description View
struct AppetizerDescriptionView: View{
    var appetizer: Appetizer
    var body: some View{
        VStack{
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            
            Text(appetizer.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}
// MARK: - Appetizer Image View
struct AppetizerImageView: View{
    var appetizer: Appetizer

    var body: some View{
        AppetizerRemoteImage(urlString: appetizer.imageURL)
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 225)
    }
}
