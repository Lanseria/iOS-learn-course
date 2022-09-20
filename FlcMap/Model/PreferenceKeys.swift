//
//  PreferenceKeys.swift
//  FlcMap
//
//  Created by 张超 on 2022/9/15.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
