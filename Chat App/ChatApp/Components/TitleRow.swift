//
//  TitleRow.swift
//  ChatApp
//
//  Created by Aayush kumar on 28/06/22.
//

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL(string: "https://cdn.schoolstickers.com/products/en/819/10MM_SMILE-02.png")
    var name = "Happy"
    var body: some View {
        HStack(spacing: 20)
        {
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            }
        placeholder:
            {
                ProgressView()
            }
            VStack(alignment: .leading){
                Text(name)
                    .font(.title2).bold()
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.red)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color("Blue"))
    }
}
