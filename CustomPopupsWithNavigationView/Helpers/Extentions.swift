//
//  Extentions.swift
//  CustomPopupsWithNavigationView
//
//  Created by nakamura motoki on 2022/02/09.
//

import SwiftUI

// MARK: Custom View Property Extentions
extension View{
    // MARK: Building a Custom Modifier for Custom Popup navigation View
    func popupNavigationView<Content: View>(horizontalPadding: CGFloat = 40, show: Binding<Bool>,@ViewBuilder content: @escaping () -> Content) -> some View {
        
        return self
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .overlay{
                if show.wrappedValue{
                    
                    // MARK: Geometry Reader for reading Container Frame
                    GeometryReader{ proxy in
                       // 画面の背景色
                        Color.primary
                            .opacity(0.15)
                            .ignoresSafeArea()
                        
                        let size = proxy.size
                        
                        
                        NavigationView{
                            content()
                        }
                        // ポップアップの画面配置について
                        // 横は画面端とポップアップを片側40離す
                        // 40は引数の初期値としてhorizontalPadding: CGFloat = 40で設定している
                        .frame(width: size.width - horizontalPadding, height: size.height / 1.7, alignment: .center)
                        // Corner Radius
                        .cornerRadius(15)
                        //ポップアップのフレームサイズを最大にする
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        
                    }
                }
            }
    }
}

