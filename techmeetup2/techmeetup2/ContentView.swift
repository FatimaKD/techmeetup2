//
//  ContentView.swift
//  techmeetup2
//
//  Created by Fatimah Dagriri on 05/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    private var fourCloumnGrid = [ GridItem(.flexible()),
                                   GridItem(.flexible()),
                                   GridItem(.flexible()),
                                   GridItem(.flexible())
    ]
    private var fourCloumnGrid2 = [ GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible())
    ]
    
    @State var cards = createCardList().shuffled()
    @State var MatchedCards: [Card]()
    @State var UserChoices: [Card]()
    
    var body: some View {
        GeometryReader{geo in
            VStack{
                Text("hi!!")
                    .font(.largeTitle)
                
                LazyVGrid(columns: fourCloumnGrid, spacing:10){
                    ForEach(cards){card in CardView ( card:card,
                                                      width: Int(geo.size.width/4 - 10), MatchedCards: $MatchedCards, UserChoices: $UserChoices)
                        
                    }
                }
                
                VStack{
                    Text("Match these cards to win:")
                    LazyVGrid(columns: fourCloumnGrid2, spacing: 10) {
                        ForEach(cardValues, id:\.self){cardValue in
                            if !MatchedCards.contains(where: {$0.text == cardValue}) {
                                Text (cardValue)
                                    .font(.system(size:40))
                            }
                            
                        }
                        
                    }
                }
            }
        }
    }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(MatchedCards: <#[Card]#>, UserChoices: <#[Card]#>)
        }
    }

