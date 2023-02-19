//
//  ContentView.swift
//  PianoNoteApp
//
//  Created by Oliver Drevet on 2023-02-18.
//

import SwiftUI

struct ContentView: View {
    
    @State var hasklicked: Bool = false
    @State var clickNote: Notes = .A
            
    @State var Note: Notes = .B
    @State var Claf: ClafType = .Trable
    
    @State var letterArray: [Notes] = [.A , .B, .C]
    @State var lettersInRandom: [Notes] = [Notes]()
    
    @AppStorage("CurrPoints") var CurrPoints: Int = 0
    @AppStorage("AllTimePoints") var AllTimePoints: Int = 0
    
    var body: some View {
        VStack {

            VStack(alignment: .center, spacing: 5){
                    Text("Current point streak: \(CurrPoints)")
                        .font(.title3)
                    Text("All time point streak: \(AllTimePoints)")
                }
                .frame(width: 250)
                .padding(15)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3, y:6))
                .padding(10)

            Spacer()
            
            NoteView(claf_type: Claf, note: Note)
                .padding(45)
                .padding(.top, 80)
            
            Spacer()
            
            HStack(spacing: 40) {
                
                ForEach(lettersInRandom){ note in
                    
                    Text(note.rawValue)
                        .frame(width: 65, height: 65)
                        .background(RoundedRectangle(cornerRadius: 10).fill(
                            hasklicked ?
                            note == Note ?
                            Color.green : note == clickNote ?
                            note == Note ?
                            Color.green : Color.red : Color.white: Color.white
                        ).shadow(radius: 3))
                        .onTapGesture {
                            clickNote = note
                            GetRandomNote()
                        }
                }
            }
            .padding([.top, .bottom],90)
        }
        .onAppear{
            Note = NoteList.randomElement() ?? .A
            Claf = ClafList.randomElement() ?? .Trable
            
            lettersInRandom = randomizeLetters()
        }
    }
    
    func GetRandomNote() {
        
        hasklicked = true
        
        if clickNote == Note {
            CurrPoints += 1
            
            if CurrPoints > AllTimePoints {
                AllTimePoints = CurrPoints
            }
            
        } else {
            CurrPoints = 0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            hasklicked = false
            
            Note = NoteList.randomElement() ?? .A
            Claf = ClafList.randomElement() ?? .Trable
            
            print("\(Note) and \(Claf)")
            
            lettersInRandom = randomizeLetters()
            
        }

    }
    
    func randomizeLetters() -> [Notes] {
        
        let numb1 = GetFirstNote(Note)
        let numb2 = GetSecoundNote(Note, numb1)

        let lista: [Notes] = [Note, numb1, numb2]
        
        return lista.shuffled()
        
    }
    

    let GetFirstNote = { (defaultNote: Notes) -> Notes in

        var numb: Notes = .A
        
        while true {
                        
            numb = NoteList.randomElement() ?? .A
            
            if numb != defaultNote {
                break
            }
        }
        
        return numb
    }
    
    let GetSecoundNote = { (defaultNote: Notes, firstNote: Notes) -> Notes in

        var numb: Notes = .A
        
        while true {
            
            numb = NoteList.randomElement() ?? .A
            
            if numb != defaultNote && numb != firstNote {
                break
            }
        }
        
        return numb
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
