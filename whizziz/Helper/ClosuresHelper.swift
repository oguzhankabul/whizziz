//
//  Closures.swift
//  whizziz
//
//  Created by Oğuzhan Kabul on 12.02.2023.
//

import UIKit

public typealias BoolClosure = ((Bool) -> Void)
public typealias StringClosure = ((String) -> Void)
public typealias VoidClosure = (() -> Void)
public typealias IndexPathClosure = ((IndexPath) -> Void)
public typealias DecodableClosure<T: Decodable> = ((T) -> Void)
public typealias DoubleClosure = ((Double) -> Void)
public typealias IntClosure = ((Int) -> Void)
public typealias CGFloatClosure = ((CGFloat) -> Void)
