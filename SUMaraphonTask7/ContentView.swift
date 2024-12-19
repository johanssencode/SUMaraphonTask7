//
//  ContentView.swift
//  SUMaraphonTask7
//
//  Created by A on 19.12.2024.
//

/*
 🏁 Новое задание «Мимикрия». Сдать до 19 Декабря 21:00.
 
 В правом нижнем углу кнопка. По нажатию на кнопку она расширяется во вью больше.
 
 - Фон и текст анимированно переходят между состояниями.
 - Маленькая кнопка нажимается вся. Для развернутой вью нажимается только область с текстом. Показал на превью.
 - Для кнопки Back стоит символ arrowshape.backward.fill. Для кнопки Open символа нет.
 */

import SwiftUI

struct ContentView: View {
    
    @State var isBig = false // развернуто/свернуто
    
    var body: some View {
        
        // Главный
        ZStack {
            
            Button {
                
                isBig.toggle()
                
            } label: {
                
                // Для Кнопки
                ZStack(alignment: .topLeading) {
                    
                    Color(.blue) // Фон
                       
                    if isBig { // Кнопка Развернута
                        
                        HStack() {
                            Image(systemName: "arrowshape.backward.fill")
                            Text("Back")
                        }
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .font(.system(.title2))
                        .padding(.init(top: 20, leading: 20, bottom: 0, trailing: 20))
                        
                    } else { // Кнопка Свернута
                        
                        Text("Open")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .font(.system(.title2))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(20)
                            .scaleEffect(isBig ? 0 : 1)
                        
                    }
                    
                }//:ZStack - Для Кнопки
                .cornerRadius(12)
                .frame(width: isBig ? 340 : 100,
                       height: isBig ? 420 : 40)
                
            }//:Button
            
        }//:ZStack - Главный
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: isBig ? .center : .bottomTrailing)
        .padding(20)
        .animation(.spring(), value: isBig)
        
    }
    
}

#Preview {
    
    ContentView()
    
}
