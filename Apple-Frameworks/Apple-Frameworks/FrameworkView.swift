//
//  FrameworkView.swift
//  Apple-Frameworks
//
//  Created by Haider Shahzad on 15/04/2025.
//

import SwiftUI

struct FrameworkView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let gridColums : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: gridColums){
                    ForEach(MockData.frameworks) { framework in
                        FrameworkStack(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle(Text("Apple Frameworks"))
            .sheet(isPresented: $viewModel.isShowingDetailsView) {
                FrameworkDetailsView(selectedframework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailsView: $viewModel.isShowingDetailsView)
            }
        }
    }
}

#Preview {
    FrameworkView()
}

struct FrameworkStack: View {
    
    let framework : Framework
    
    var body: some View {
        VStack{
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }
        .padding()
    }
}
