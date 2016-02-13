//
//  TableViewControllerMaster.swift
//  VistasJerarquicasOpenLibrary
//
//  Created by Israel Durán Martínez on 29/01/16.
//  Copyright © 2016 Israel Durán Martínez. All rights reserved.
//

import UIKit
import CoreData

class TableViewControllerMaster: UITableViewController
{
    //Pila de Core Data - contexto
    var contexto : NSManagedObjectContext? = nil
    
    @IBAction func redireccionaBusquedaISBN(sender: AnyObject)
    {
        //Este hace referencia al Storyboard
        let miStoryBoard: UIStoryboard =  UIStoryboard(name: "Main", bundle: nil)
        //Asociación de la vista al Story Board
        let vista = miStoryBoard.instantiateViewControllerWithIdentifier("isbnView") as! ViewControllerISBN
        //Se envía el control a la vista
        self.navigationController!.pushViewController(vista, animated: true)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "Libros"
        
        print("Vista Tabla")
        //libros.append(Libro(titulo: "Libroi", autores: "Autores", portada: "portada", isbn: "12345"))
        
        //ASIGNACION DEL CONTEXTO
        self.contexto = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        //TRAE TODO EL CONTENIDO DE LIBROS
        let librosEntidad = NSEntityDescription.entityForName("Libros", inManagedObjectContext: self.contexto!)
        let peticion = librosEntidad?.managedObjectModel.fetchRequestTemplateForName("peticionLibros")
        
        do
        {
            //TRAE TODO LO DEL LIBRO
            let peticionLibrosEntidad = try self.contexto?.executeFetchRequest(peticion!)
            
            //RECORRE LAS SECCIONES
            for libro in peticionLibrosEntidad!
            {
                //RECUPEREA EL NOMBRE DE A SECCION
                let isbn = libro.valueForKey("isbn") as! String
                let titulo = libro.valueForKey("titulo") as! String
                let autores = libro.valueForKey("autores") as! String
                let portada = libro.valueForKey("portada") as! String

                libros.append(Libro(titulo: titulo, autores: autores, portada: portada, isbn: isbn))
            }
        }
        catch
        {
            
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        print(libros.count)
        return libros.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("celda", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel!.text = libros[indexPath.row].titulo

        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let control = segue.destinationViewController as! ViewControllerDetalle
        let indexPath = self.tableView.indexPathForSelectedRow
        control.librito = libros[indexPath!.row]
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
}
