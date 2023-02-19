//
//  SheetLines.swift
//  PianoNoteApp
//
//  Created by Oliver Drevet on 2023-02-18.
//

import SwiftUI

struct SheetLines: View {
    var body: some View {
        ZStack {
            VStack(spacing: 14){
                Rectangle().fill(Color.black).frame(width: 300, height: 2)
                Rectangle().fill(Color.black).frame(width: 300, height: 2)
                Rectangle().fill(Color.black).frame(width: 300, height: 2)
                Rectangle().fill(Color.black).frame(width: 300, height: 2)
                Rectangle().fill(Color.black).frame(width: 300, height: 2)
            }
            
            Rectangle().fill(Color.black).frame(width: 2, height: 66)
                .offset(x: -150)

        }
    }
}

struct SheetLines_Previews: PreviewProvider {
    static var previews: some View {
        SheetLines()
    }
}
