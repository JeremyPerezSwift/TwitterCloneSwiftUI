//
//  FilterButtonView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 29/11/2021.
//

import SwiftUI

enum TweetFileterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
            
        case .tweets:
            return "Tweets"
        case .replies:
            return "Tweets & Replies"
        case .likes:
            return "Likes"
        }
    }
}

struct FilterButtonView: View {
    @Binding var selectedOption: TweetFileterOptions
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(TweetFileterOptions.allCases.count)
    
    private var padding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(TweetFileterOptions.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(TweetFileterOptions.allCases, id: \.self) { option in
                    Button(action: {
                        self.selectedOption = option
                    }) {
                        Text(option.title)
                            .frame(width: underlineWidth - 8)
                            .foregroundColor(.blue)
                            .font(.system(size: 14))
                    }
                }
            }
            
            Rectangle()
                .frame(width: underlineWidth - 10, height: 3, alignment: .center)
                .foregroundColor(.blue)
                .padding(.leading, padding)
                .animation(.spring())
        }
    }
}

struct FilterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtonView(selectedOption: .constant(.tweets))
    }
}
