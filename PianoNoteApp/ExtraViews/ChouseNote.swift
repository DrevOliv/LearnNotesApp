//
//  ChouseNote.swift
//  PianoNoteApp
//
//  Created by Oliver Drevet on 2023-02-18.
//

import Foundation
import SwiftUI

enum Notes: String, Identifiable {
    
    var id: Self {
        return self
    }
    
    case A, B, C, D, E, F, G
}

var NoteList: [Notes] = [.A, .B, .C, .D, .E, .F, .G]

enum ClafType {
    case Trable, Bass
}

var ClafList: [ClafType] = [.Trable, .Bass]

struct NoteOffset: ViewModifier {

    var offset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees( offset<0 ? -180 : 0 ))
            .offset(y:offset)
            
    }
}

extension View {
    func noteOffset(offset: CGFloat) -> some View {
        modifier(NoteOffset(offset: offset))
    }
}


let GiveOffset = { (note: Notes, clafType: ClafType) -> CGFloat in
    
    
    switch clafType {
    case .Trable:
        
        switch note {
        case .A:
            return 7.5
        case .B:
            return 0
        case .C:
            return -7.5
        case .D:
            let lista: [Double] = [-15, 37.5]
            
            return lista.randomElement() ?? -15
        case .E:
            let lista: [Double] = [-22.5, 30]
            
            return lista.randomElement() ?? -22.5
        case .F:
            let lista: [Double] = [22.5, -30]
            
            return lista.randomElement() ?? 22.5
        case .G:
            let lista: [Double] = [15, -37.5]
            
            return lista.randomElement() ?? 15
        }
        
    case .Bass:
        switch note {
        case .A:
            let lista: [Double] = [22.5, -30]
            
            return lista.randomElement() ?? 22.5
        case .B:
            let lista: [Double] = [15, -37.5]
            
            return lista.randomElement() ?? 15
        case .C:
            return 7.5
        case .D:
            return 0
        case .E:
            return -7.5
        case .F:
            let lista: [Double] = [-15, 37.5]
            
            return lista.randomElement() ?? -15
        case .G:
            let lista: [Double] = [-22.5, 30]
            
            return lista.randomElement() ?? -22.5
        }
        
    }
    
    
}


