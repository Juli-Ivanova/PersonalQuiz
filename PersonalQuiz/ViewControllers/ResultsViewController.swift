//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 31.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var descriptionAnimal: UILabel!
    
    var resultAnswers: [Answer] = []
    
    // 1. Избавиться от кнопкп возврата
    // 2. Передать сюда массив с выбранными ответами
    // 3. Определить то животное, которое встречается чаще всего
    // 4. Отобразить результаты
    // 5. Подумать над логикой определени индекса в соответсвии с диапазоном
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        calculateResult()

    }
    
    
    private func calculateResult () {
        
        var dog = 0
        var cat = 0
        var rabbit = 0
        var turtle = 0
        
        var countsAnimals = [AnimalType : Int]()
        
        for result in resultAnswers {
            
            if result.type == AnimalType.dog {
                dog += 1
                countsAnimals[result.type] = dog
                
            } else if result.type == AnimalType.cat {
                cat += 1
                countsAnimals[result.type] = cat
                
            } else if result.type == AnimalType.rabbit {
                rabbit += 1
                countsAnimals[result.type] = rabbit
                
            } else if result.type == AnimalType.turtle {
                turtle += 1
                countsAnimals[result.type] = turtle
            }
                    
        }
        
        let maximum = countsAnimals.max { a, b in a.value < b.value }
        
        animalLabel.text = "Вы - \(String(maximum?.key.rawValue ?? " "))"
        descriptionAnimal.text = maximum?.key.definition
        
    }

}
    
    

