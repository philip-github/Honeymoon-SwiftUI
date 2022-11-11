//
//  ContentView.swift
//  Honeymoon
//
//  Created by Philip Al-Twal on 11/4/22.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - PROPERTIES
    
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    @State private var lastCardIndex: Int = 1
    @State private var cardRemovalTransition = AnyTransition.trailingBottom
    @GestureState private var dragState: DragState = .inactive
    private let dragAreaThreshold: CGFloat = 65.0
    
    //MARK: CARD VIEWS
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        return views
    }()
    
    //MARK: - FUNCTIONS
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: {$0.id == cardView.id} ) else { return false }
        return index == 0
    }
    
    private func moveCards() {
        cardViews.removeFirst()
        lastCardIndex += 1
        let honeymoon = honeymoonData[lastCardIndex % honeymoonData.count]
        let newCardView = CardView(honeymoon: honeymoon)
        cardViews.append(newCardView)
    }
    
    //MARK: - DRAG STATE
    
    enum DragState: Equatable {
        
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize{
            switch self{
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
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    //MARK: - BODY
    
    var body: some View {
        VStack {
            //MARK: - HEADER
            HeaderView(showGuideView: $showGuide,
                       showInfoView: $showInfo)
            .opacity(dragState.isDragging ? 0.0 : 1.0)
            .animation(.default, value: dragState)
            
            Spacer()
            //MARK: - CARDS
            ZStack{
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0 )
                        .overlay(
                            ZStack{
                                // X-MARK SYMBOL
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(dragState.translation.width < -dragAreaThreshold && isTopCard(cardView: cardView) ? 1.0 : 0.0)
                                
                                // HEART SYMBOL
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(dragState.translation.width > dragAreaThreshold && isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            }//: ZSTACK
                        )//: OVERLAY
                        .offset(x: isTopCard(cardView:   cardView) ?
                                dragState.translation.width : 0,
                                y: isTopCard(cardView: cardView) ?
                                dragState.translation.height : 0)
                        .scaleEffect(dragState.isDragging && isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: isTopCard(cardView: cardView) ?
                                              Double(dragState.translation.width / 12) : 0))
                        .animation(.interpolatingSpring(stiffness: 120,
                                                        damping: 120),
                                   value: dragState)
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating($dragState) {value, state, transaction in
                                switch value{
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero )
                                default:
                                    break
                                }//: SWITCH
                            }//: UPDATING
                            .onChanged({ value in
                                guard case .second(true, let drag?) = value else { return }
                                if drag.translation.width < -dragAreaThreshold{
                                    cardRemovalTransition = .leadingBottom
                                }
                                if drag.translation.width > dragAreaThreshold {
                                    cardRemovalTransition = .trailingBottom
                                }
                            })
                            .onEnded({ value in
                                guard case .second(true, let drag?) = value else { return }
                                if drag.translation.width < -dragAreaThreshold || drag.translation.width > dragAreaThreshold {
                                    playSound(sound: "sound-rise", type: "mp3")
                                    moveCards()
                                }
                            })//: ON ENDED
                        )//: GESTURE
                        .transition(cardRemovalTransition)
                }//: LOOP
            }//: ZSTACK
            .padding(.horizontal)
            
            Spacer()
            //MARK: - FOOTER
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState)
            
        }//: VSTACK
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Success"),
                  message: Text("Wishing a lovely and most precious of the times together for the amazing couple"),
                  dismissButton: .default(Text("Happy Honeymoon")))
        }//: ALERT
    }//: BODY
}

//MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
