//
//  Binding-OnChange.swift
//  Expand
//
//  Created by Ahmet Yusuf Yuksek on 1/6/22.
//

import SwiftUI

extension Binding {
    
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
        
    }
}
