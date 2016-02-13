//
//  ViewControllerDetalle.swift
//  VistasJerarquicasOpenLibrary
//
//  Created by Israel Durán Martínez on 29/01/16.
//  Copyright © 2016 Israel Durán Martínez. All rights reserved.
//

import UIKit

class ViewControllerDetalle: UIViewController
{

    @IBOutlet weak var labelISBN: UILabel!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var textViewAutores: UITextView!
    @IBOutlet weak var imagePortada: UIImageView!
    
    var librito : Libro = Libro();
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(librito.isbn)
        print(librito.titulo)
        
        labelISBN.text = librito.isbn
        labelTitulo.text = librito.titulo
        textViewAutores.text = librito.autores
        
        let urlPortada = NSURL(string: librito.portada)
        
        if let data = NSData(contentsOfURL: urlPortada!)
        {
            imagePortada.image = UIImage(data: data)
        }
        else
        {
            imagePortada.image = UIImage(contentsOfFile: "Sin_imagen_disponible")
            print("Sin imagen")
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
