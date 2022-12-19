//
//  RecipeMock.swift
//  PeekPop
//
//  Created by Derouiche Elyes on 19/12/2022.
//

import Foundation

class Mocks {
    static func generate() -> Recipe {
        let recipe1: Recipe = .init(name: "Flan au coco", requiredTime: Int.random(in: 30...200), note: Int.random(in: 1...3), ingredient: "Cannelle, Muscade, Lait de coco, Lait concentré sucré, Lait concentré non sucré, Oeufs, Caramel",
                                    preparation: "1. Préchauffer le four à 180°C\n2. Mélanger les laits concentrés et le lait de coco. Ajouter les oeufs et les épices. Bien mélanger.\n3. Verser le caramel au fond d'un moule puis verser la préparation lactée.\n4. Enfourner 45 minutes.\n", imageName: "im_coco")
        
        let recipe2: Recipe = .init(name: "Gaspacho", requiredTime: Int.random(in: 30...200), note: Int.random(in: 1...3), ingredient: "Framboises, Betteraves, Tomates, Tabasco, Huile d'olive, Vinaigre balsamique, Sucre, Sel et poivre",
                                    preparation: "1. Dans un blender, mixer les framboises avec les betteraves et les tomates.\n2. Ajouter l'huile d'olive, le vinaigre balsamique, le tabasco, le sucre, le sel et le poivre. Mixer à nouveau\n jusqu'à obtenir une préparation lisse et homogène. Si besoin, ajouter un filet d'eau.\n3. Servir bien frais accompagné de tranches de pain grillées et frottées à l'ail.\n", imageName: "im_gaspacho")
        
        let recipe3: Recipe = .init(name: "Tarte aux fraises", requiredTime: Int.random(in: 30...200), note: Int.random(in: 1...3), ingredient: "Sucre vanillé, Sucre glace, Sucre en poudre, Fraises, Sucre cristallisé, Biscuits à la cuillère, Pâte brisée, Rhubarbe, Oeufs, Crème liquide",
                                    preparation: "1. Mélanger la rhubarbe avec les 100g de sucre et laisser macérer pendant 2h\n2. Préchauffer le four à 180°C.\n3. Déposer la pâte dans un moule à tarte, piquer à la fourchette.\n4. Emietter les biscuits sur le fond de tarte, verser la rhubarbe découpée en petits morceaux et le jus qui s'est\n constitué avec le sucre.\n5. Enfourner 20 min.\n6. Battre 2 jaunes, 1 oeuf, la crème, le sucre vanillé et 100 g de sucre.\n7. Verser le mélange sur la rhubarbe, enfourner 10 à 15 min.\n8. Monter les 2 blancs en neige en versant 100 g de sucre petit à petit.\n9. Retirer la tarte du four et garnir de meringue à l'aide d'une poche à douille (ou une cuillère).\n10. Saupoudrer de sucre glace (en utilisant une petite passoire pour tamiser).\n11. Remettre au four pour dorer (faire attention, ça dore très vite).\n12. Décorer de fraises coupées en 2.\n13. Servir frais.\n", imageName: "im_strawberries")
        
        return [recipe1, recipe2, recipe3].randomElement()!
    }
}
