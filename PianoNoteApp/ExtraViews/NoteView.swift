//
//  NoteView.swift
//  PianoNoteApp
//
//  Created by Oliver Drevet on 2023-02-18.
//

import SwiftUI

struct NoteView: View {
    
    var claf_type: ClafType = .Bass
    var note: Notes = .A

    var body: some View {
        VStack {
            ZStack{
                SheetLines()
                ClafView(claf_type: claf_type)
                
                
                Image("HalfNote")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 116, height: 126)
                    .noteOffset(offset: GiveOffset(note, claf_type))
                
            }
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(claf_type: .Trable, note: .A)
    }
}



