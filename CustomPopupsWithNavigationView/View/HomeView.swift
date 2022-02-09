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
            .navigationTitle("Custom Popup's")
            //カスタムView
            //For a instance if we set the modifier which don't have the perfect size for the popup, then it won't display the popup
            //In order to avoid that we're making the modifier to take all the available free space, so that the popup will be displayed property
            .popupNavigationView(horizontalPadding: 40, show: $showPopup){
                
                // MARK: Your Popup content which will also perfoms navigations
                // ポップアップの内容を記述
                List{
                    ForEach(tasks){ task in
                        NavigationLink(task.taskTitle){
                            Text(task.taskDexcription)
                                .navigationTitle("Destination")
                        }//NavigationLink
                    }//ForEach
                }//List
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
