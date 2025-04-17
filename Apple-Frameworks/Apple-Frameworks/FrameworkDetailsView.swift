//
//  FrameworkDetailsView.swift
//  Apple-Frameworks
//
//  Created by Haider Shahzad on 16/04/2025.
//

import SwiftUI

struct FrameworkDetailsView: View {
    
    var selectedframework: Framework
    
    @Binding var isShowingDetailsView : Bool
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button{
                    isShowingDetailsView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color(.label))
                        .frame(width: 44, height: 44)
                        .imageScale(.large)
                }
                .padding()
            }
            Spacer()
            FrameworkStack(framework: selectedframework)
            Text(selectedframework.description)
                .padding()
            Spacer()
            Button{
                print("Tapped")
                
            } label: {
                buttonTextView(buttonTitle: "Learn More")
            }
        }
    }
}

#Preview {
    FrameworkDetailsView(selectedframework: MockData.sampleFramework, isShowingDetailsView: .constant(true))
}

struct buttonTextView: View {
    let buttonTitle: String
    var body: some View {
        Text(buttonTitle)
            .font(.title2)
            .bold()
            .frame(width: 250, height: 60)
            .foregroundStyle(.white)
            .background(Color.red)
            .clipShape(.rect(cornerRadius: 10))
    }
}
