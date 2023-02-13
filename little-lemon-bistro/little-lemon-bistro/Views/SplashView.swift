//
//  SplashView.swift
//  little-lemon-bistro
//
//  Created by Quang Luu on 09/02/2023.
//

import SwiftUI

struct SplashView: View {
    
    let persistenceController = PersistenceController.shared
    
    @State var isActive:Bool = false
    
    var isLoggedIn: Bool {
        get {
            UserDefaults.standard.value(forKey: kIsLoggedIn) as? Bool ?? false
        }
    }
    
    var body: some View {
        VStack {
            if self.isActive {isLoggedIn ?
                AnyView(HomeView().environment(\.managedObjectContext, persistenceController.container.viewContext)) :
                AnyView(OnboardingView())
            } else {
                Image("little-lemon-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250.0, height: 250.0)
            }
            
        }
//        .frame(maxWidth:.infinity,maxHeight:.infinity)
//        .background(y)
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
