//
//  ExerciseView.swift
//  FirstApp
//
//  Created by Student on 1/27/22.
//

import SwiftUI

struct ExerciseView: View {
    let videoNames = ["song1","song2","song3","song4"]
    let exerciseNames = ["Song1","Song2","Song3","Song4"]
    let index: Int
    var body: some View {
        Text(exerciseNames[index])
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(index: 0)
    }
}
