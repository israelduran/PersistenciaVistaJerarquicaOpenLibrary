//
//  Libros.swift
//  VistasJerarquicasOpenLibrary
//
//  Created by Israel Durán Martínez on 29/01/16.
//  Copyright © 2016 Israel Durán Martínez. All rights reserved.
//

import Foundation
import UIKit

struct Libro
{
    var titulo : String = ""
    var autores : String = ""
    var portada : String = ""
    var isbn : String = ""
    
    init(titulo: String, autores: String, portada: String, isbn: String)
    {
        self.titulo = titulo
        self.autores = autores
        self.portada = portada
        self.isbn = isbn
    }
    
    init()
    {}
}

var libros = [Libro]()