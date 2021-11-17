//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/15/21.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListVM()
    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers){ appetizer in
                    AppetizerCell(appetizer: appetizer)
//                        .listRowSeparator(.hidden) // hides the cell divider
//                        .listRowSeparatorTint(.brandPrimary) // can change the color of the seperator
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail)
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            //If isShowing is true, set to 20, if not, set to 0
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                if let selected = viewModel.selectedAppetizer{
                    AppetizerDetailView(isShowingDetail: $viewModel.isShowingDetail, appetizer: selected)
                }
            }
            
            if viewModel.isLoading {
                loadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}
// MARK: - Preview
struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}

