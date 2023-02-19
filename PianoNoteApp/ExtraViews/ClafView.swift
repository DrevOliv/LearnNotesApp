//
//  ClafView.swift
//  PianoNoteApp
//
//  Created by Oliver Drevet on 2023-02-18.
//

import SwiftUI

struct ClafView: View {
    
    var claf_type: ClafType = .Trable
    
    var body: some View {
        ZStack {
            SheetLines()
            
            if claf_type == .Trable {
                Image("Trable")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 125)
                    .offset(x: -110, y: 3)
            } else {
                Image("Bass")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 65)
                    .offset(x: -110, y: -5)
            }
            
        }
    }
}

struct ClafView_Previews: PreviewProvider {
    static var previews: some View {
        ClafView(claf_type: .Trable)
    }
}
