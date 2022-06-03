//
//  WordleBoard.swift
//  WordGame
//
//  Created by Guillaume Longrais on 2022-06-03.
//

import SwiftUI

struct WordleBoard: View {
    
    @State var letters: [[Character?]] = Array(
        repeating: .init(repeating: nil, count: width),
        count: height
    )
    @State var evaluations: [[LetterEvaluation?]] = Array(
        repeating: .init(repeating: nil, count: width),
        count: height
    )
    
    
    @State private var string: String = ""
    @FocusState private var textFieldActive: Bool
    
    static let width = 5
    static let height = 6
    
    var body: some View {
        VStack{
            ZStack{
                TextField("", text: $string).keyboardType(.asciiCapable).disableAutocorrection(true).focused($textFieldActive).opacity(0)
                MatrixGrid(width: Self.width, height: Self.height, spacing: 8){
                    row, column in
                    LetterBox(letter: letters[row][column], evaluation: evaluations[row][column])
                }
                .frame(maxHeight: .infinity)
                .onTapGesture {
                    textFieldActive.toggle()
                }
            }
            Button("New Game"){
                
            }
            .padding(8)
        }
        .padding(24)
        .background(Color(.systemGray6))
    }
}

struct WordleBoard_Previews: PreviewProvider {
    
    static var previews: some View {
        WordleBoard().environment(\.colorScheme, .dark)
    }
}
