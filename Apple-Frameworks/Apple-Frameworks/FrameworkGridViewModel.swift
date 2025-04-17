//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Haider Shahzad on 17/04/2025.
//

import SwiftUI

class FrameworkGridViewModel: ObservableObject {
    var selectedFramework: Framework?{
        didSet{
            isShowingDetailsView = true
        }
    }
    @Published var isShowingDetailsView = false
    
}
