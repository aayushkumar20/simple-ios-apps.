//
//  ContentView.swift
//  instagram FrontEnd
//
//  Created by Aayush kumar on 08/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0.0){
            Header()
            ScrollView(.vertical,showsIndicators: false){
                Stories()
                Divider()
                Post()
                Post(image: "profile2", descriptions: "none")
                Post(image: "profile4", descriptions: "looking great")
            }
            Tab()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Header: View {
    var body: some View {
        HStack(spacing: 0.0){
            Image("logo")
            Spacer()
            HStack(spacing: 20.0){
                Image("add")
                Image("heart")
                Image("messenger")
            }
        }
        .padding(.horizontal,15)
        .padding(.vertical,3)
    }
}

struct Story: View {
    var image:String="profile"
    var name:String="Your Story"
    var body: some View {
        VStack {
            VStack{
                Image(image)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(50)
            }
            .overlay(
                Circle()
                    .stroke(LinearGradient(colors: [.red,.yellow,.orange,.red,.orange], startPoint: .topLeading, endPoint: .bottomTrailing),lineWidth: 3)
                    .frame(width: 68, height: 68)
            )
            .frame(width: 70, height: 70)
            Text(name)
                .font(.caption)
        }
    }
}

struct Stories: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing: 16.0) {
                Story()
                Story(image: "profile2", name: "Home")
                Story(image: "profile3", name: "Abhi")
                Story(image: "profile4", name: "Karnika")
                Story(image: "profile5", name: "Uncle")
            }
            .padding(.horizontal,5)
        }
        .padding(.vertical,10)
    }
}

struct PostHeader: View {
    var body: some View {
        HStack {
            HStack{
                Image("profile")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .cornerRadius(50)
                Text("a.k_Soonawalla")
                    .font(.caption)
                    .fontWeight(.bold)
            }
            Spacer()
            Image("more")
        }
        .padding(.vertical,10)
        .padding(.horizontal,8)
    }
}

struct PostContent: View {
    var image:String="profile"
    var body: some View {
        VStack(spacing: 0.0) {
            Image(image)
                .resizable()
                .frame(width: .infinity)
                .aspectRatio(contentMode: .fit)
            
            HStack{
                HStack(spacing: 10.0){
                    Image("heart")
                    Image("comment")
                    Image("share")
                }
                Spacer()
                Image("bookmark")
            }
            .padding(.horizontal,12)
            .padding(.vertical,9)
        }
    }
}

struct Post: View {
    var image:String="profile"
    var descriptions:String="Simply serious look"
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            PostHeader()
            PostContent(image: image)
            Text("Liked by Aayush and others")
                .font(.footnote)
                .frame(width: .infinity)
                .padding(.horizontal,12)
            Text(descriptions)
                .font(.footnote)
                .frame(width: .infinity)
                .padding(.horizontal,12)
            HStack{
                HStack(spacing: 7.0){
                    Image("profile")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .cornerRadius(50)
                    Text("Add comments....")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
                HStack{
                    Text("😁")
                    Text("🙃")
                    Text("❤️")
                    Image(systemName: "plus.circle")
                        .foregroundColor(.secondary)
                    
                }
            }
            .padding(.horizontal,12)
            .padding(.vertical,9)
        }
    }
}

struct Tab: View {
    var body: some View {
        VStack(spacing: 0.0){
            Divider()
            HStack{
                Image("home")
                Spacer()
                Image("search")
                Spacer()
                Image("reels")
                Spacer()
                Image("shop")
                Spacer()
                Image("profile")
                    .resizable()
                    .frame(width: 21, height: 21)
                    .cornerRadius(50)
            }
            .padding(.horizontal,25)
            .padding(.top,10)
        }
    }
}
