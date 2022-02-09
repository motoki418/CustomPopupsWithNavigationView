//
//  HomeView.swift
//  CustomPopupsWithNavigationView
//
//  Created by nakamura motoki on 2022/02/09.
//

import SwiftUI

struct HomeView: View {
    //ポップアップの表示を管理
    @State var showPopup: Bool = false
    var body: some View {
        NavigationView{
            Button("Show Popup"){
                withAnimation{
                    //ポップアップの表示を管理するshowPopupのfalseからtrueに
                    showPopup.toggle()
                }
            }
            // 画面全体のnavigationTitle
            .navigationTitle("Custom Popup's")
            //カスタムView
            //For a instance if we set the modifier which don't have the perfect size for the popup, then it won't display the popup
            //In order to avoid that we're making the modifier to take all the available free space, so that the popup will be displayed property
            // 画面の端から40px空ける
            .popupNavigationView(horizontalPadding: 40, show: $showPopup){
                
                // MARK: Your Popup content which will also perfoms navigations
                // ポップアップの内容を記述
                List{
                    // tasks配列内の要素を一つずつtaskに取り出し
                    ForEach(tasks){ task in
                        // taskTitleを画面遷移用のテキストとして利用する
                        NavigationLink(task.taskTitle){
                            // 画面遷移後に表示
                            Text(task.taskDexcription)
                            // 画面遷移後のnavigationTitle
                                .navigationTitle("Destination")
                        }//NavigationLink
                    }//ForEach
                }//List
                //ポップアップのnavigationTitle
                .navigationTitle("Popup Navigation")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            
                        }label: {
                            Image(systemName: "plus")
                        }
                    }//ToolbarItem
                    ToolbarItem(placement: .navigationBarLeading){
                        Button("Close"){
                            withAnimation{
                                //ポップアップの表示を管理するshowPopupのtrueからfalseに
                                showPopup.toggle()
                            }
                        }
                    }//ToolbarItem
                }//.toolbar
            }//popupNavigationView
        }
    }
}

struct HomeViwe_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
