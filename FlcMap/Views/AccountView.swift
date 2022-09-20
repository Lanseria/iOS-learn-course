//
//  AccountView.swift
//  FlcMap
//
//  Created by 张超 on 2022/9/7.
//

import SwiftUI

struct AccountView: View {
    @State var isDelete = false
    @State var isPinned = false
    
    var profile: some View {
        VStack(spacing: 8.0) {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .symbolVariant(.fill)
                .font(.system(size: 30))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue,.yellow.opacity(0.5))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -150, y: -50)
                )
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6)
                )
            
            Text("张超")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                Text("中国")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink(destination: HomeView()) {
                Label("设置", systemImage: "gear")
            }
            NavigationLink{
                Text("账单")
            } label: {
                Label("账单", systemImage: "creditcard")
            }
            Label("帮助", systemImage: "questionmark")
        }
        .accentColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section{
            if !isDelete {
                Link(
                    destination: URL(string: "https://apple.com")!,
                    label: {
                        HStack {
                            Label("网站", systemImage: "house")
                            Spacer()
                            Image(systemName: "link").foregroundColor(.secondary)
                        }
                    })
                .swipeActions (
                    edge: .leading,
                    allowsFullSwipe: false,
                    content: {
                        Button(action: {
                            isDelete = true
                        }) {
                            Label("删除", systemImage: "trash")
                        }
                        .tint(.red)
                        
                        pinButton
                    })
            }
            
            Link(
                destination: URL(string: "https://bilibili.com")!,
                label: {
                    HStack {
                        Label("B站", systemImage: "tv")
                        Spacer()
                        Image(systemName: "link").foregroundColor(.secondary)
                    }
                })
            .swipeActions(
                edge: .leading,
                allowsFullSwipe: false,
                content: {
                    pinButton
                })
        }
        .accentColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var pinButton: some View {
        Button(action: {
            isPinned.toggle()
        }, label: {
            if isPinned {
                Label("取消Pin", systemImage: "pin.slash")
            } else {
                Label("Pin", systemImage: "pin")
            }
        })
        .tint(isPinned ? .gray : .yellow)
    }
    
    var body: some View {
        NavigationView {
            List {
                //                Image(systemName: "person.badge.plus")
                //                    .symbolVariant(.fill)
                //                    .font(.system(size: 30))
                //                    .symbolRenderingMode(.multicolor)
                profile
                
                menu
                
                links
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle("账户")
        }
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

