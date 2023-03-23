//
//  ContentView.swift
//  Honeymoon
//
//  Created by Gurjinder Singh on 17/03/23.
//

import SwiftUI

enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        case .pressing, .inactive:
            return false
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .inactive:
            return false
        case .pressing, .dragging:
            return true
        }
    }
}

struct ContentView: View {
    //MARK: - PROPERTIES
    
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65.0
    @State private var lastCardIndex: Int = 1
    //MARK: - CARDS VIEWS
    
   @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeyMoonData[index]))
        }
        return views
    }()
    
    //MARK: - MOVE THE CARD
    
    private func moveCards() {
        cardViews.removeFirst()
        self.lastCardIndex += 1
        let honeymoon = honeyMoonData[lastCardIndex %  honeyMoonData.count]
        
        let newCard = CardView(honeymoon: honeymoon)
        
        cardViews.append(newCard)
    }
    
    //MARK: - TOP CARD
    private func isTopCard(cardView: CardView)-> Bool {
        guard let index = cardViews.firstIndex(where: {$0.id == cardView.id}) else { return false }
        return index == 0
    }
    
    var body: some View {
        VStack {
            //MARK: - HEADER
            
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: 1)
            
            Spacer()
            
            //MARK: - CARDS
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(content: {
                            ZStack {
                                // X-MARK SYMBOL
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                                //HEART SYMBOL
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0 )

                            }
                        })
                        .offset(x: self.isTopCard(cardView: cardView) ?  self.dragState.translation.width : 0, y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0)
                        .scaleEffect(dragState.isDragging && self.isTopCard(cardView: cardView) ?  0.85 : 1)
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: 1)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(dragState.translation.width / 12) : 0))
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: { (value, dstate, transaction) in
                                switch value {
                                case .first:
                                    dstate = .pressing
                                case .second(true, let drag):
                                    dstate = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                                }
                            })
                                .onEnded({ value in
                                    guard case .second(true, let drag?  ) = value else {return}
                                    if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                                        self.moveCards()
                                    }
                                })
                        )
                }
            }
            .padding(.horizontal)
//            CardView(honeymoon: honeyMoonData[2])
//                .padding()
            
            Spacer()
            
            //MARK: - FOOTER
            
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: 1)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("SUCCESS"),
                message: Text("Wishing a lovely and most precious of the times together for the amazing couple."),
                dismissButton: .default(Text("Happy Honeymoon!"))
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
