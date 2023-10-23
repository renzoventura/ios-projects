//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Renzo on 28/9/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
    let question: String
    let answer: String
    
    init(q: String, a: String) {
        question = q
        answer = a
    }
}
