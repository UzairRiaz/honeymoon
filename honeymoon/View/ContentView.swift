//
//  ContentView.swift
//  honeymoon
//
//  Created by Umair Riaz on 20/10/2021.
//

import SwiftUI

struct ContentView: View {
    //MARK: PROPERTIES
    @State var showAlert: Bool = false
    @State var showGuideView : Bool = false
    @State var showInfoView: Bool = false
    private var dragAreaThershold: CGFloat = 65.0
    @GestureState private var dragState = DragState.inactive
    @State private var lastCardIndex: Int = 1
    
    //MARK: CARD VIEW
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        return views
    }()
    
    //MARK: MOVE CARDS
    private func moveCard() {
        cardViews.removeFirst()
        
        self.lastCardIndex += 1
        
        let honeymoon = honeymoonData[lastCardIndex % honeymoonData.count]
        
        let newCardView = CardView(honeymoon: honeymoon)
        cardViews.append(newCardView)
    }
    
    //MARK: TOP CARD
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id}) else {
            return false
        }
        return index == 0
    }
    
    //MARK: DRAG STATES
    enum DragState {
        case inactive
        case pressing
        case dragging(transition: CGSize)
        
        var translation: CGSize{
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(transition: let transition):
                return transition
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing:
                return false
            case .dragging(let _transition):
                return true
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing:
                return true
            case .dragging(let transition):
                return false
            }
        }
    }
    
    var body: some View {
        VStack{
            //MARK: HEADER
            HeaderView(showGuideView: $showGuideView, showInfoView: $showInfoView)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            
            Spacer()
            
            //MARK: CARD
            ZStack{
                ForEach(cardViews) {cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack{
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width < -self.dragAreaThershold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                                
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width > self.dragAreaThershold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            }
                        )
                        .offset(x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0, y:
                                    self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0)
                        .rotationEffect(Angle(degrees: Double(self.isTopCard(cardView: cardView) ? self.dragState.translation.width / 12 : 0)))
                        .scaleEffect(self.isTopCard(cardView: cardView) ? self.dragState.isDragging ? 0.85: 1.00 : 1)
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                                    .sequenced(before: DragGesture())
                                    .updating(self.$dragState, body: {(value, state, transition) in
                            switch value {
                            case .first(true):
                                state = .pressing
                            case .second(true, let drag):
                                state = .dragging(transition: drag?.translation ?? .zero)
                            default: break
                            }
                        })
                                    .onEnded({ value in
                            guard case .second(true, let drag?) = value else {
                                return
                            }
                            if drag.translation.width < -self.dragAreaThershold || drag.translation.width > self.dragAreaThershold{
                                self.moveCard()
                            }
                        })
                        )
                        
                }
            }
            .padding(.horizontal)
            
            Spacer()
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Fuck off! 🖕 ").fontWeight(.heavy), message: Text("Beta Paisy Mat zaya kro."), dismissButton: .default(Text("Sorry")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
