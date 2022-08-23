//
//  ContentView.swift
//  TCA_Simple_tutorial
//
//  Created by Sunwoo on 2022/08/22.
//

import SwiftUI
import ComposableArchitecture

//도메인 + 상태
struct CounterState: Equatable {
    var count = 0
}
// 도메인 + 액션
enum CounterAction: Equatable {
    case addCount
    case subtractCount
}

struct CounterEnvironment {
    
}

let counterReducer = Reducer<CounterState, CounterAction, CounterEnvironment> { state, action, environment in
    //들어온 액션에 따라 상태를 변경
    switch action {
    case .addCount:
        state.count += 1
        return Effect.none
    case .subtractCount:
        state.count -= 1
        return Effect.none
    }
}

struct CounterView: View {
    let store: Store<CounterState, CounterAction>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Text("count: \(viewStore.state.count)")
                    .padding()
                HStack {
                    Button("더하기", action: { viewStore.send(.addCount) })
                    Button("빼기", action: { viewStore.send(.subtractCount) })
                }
            }
        }
    }
}
