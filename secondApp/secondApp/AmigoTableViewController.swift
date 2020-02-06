//
//  AmigoTableViewController.swift
//  secondApp
//
//  Created by Aula11 on 5/11/19.
//  Copyright © 2019 Jose Antonio Parra Sánchez. All rights reserved.
//

import UIKit

class AmigoTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet var tablaAmigos: UITableView!
    @IBOutlet weak var barraBusqueda: UISearchBar!
    
    var posicionAct = [Amigo]()
    var amigos = [Amigo](){
        didSet{
            guardarDatos()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 90
        cargarDatos()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //MARK: Métodos
    
    private func setUpSearchBar(){
        barraBusqueda.delegate = self
    }
    
    func guardarDatos(){
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: self.amigos,requiringSecureCoding: false){
            UserDefaults.standard.set(savedData, forKey: "listadoAmigos")
            posicionAct = amigos
        } }
    
    func cargarDatos(){
        if let savedData = UserDefaults.standard.object(forKey: "listadoAmigos") as? Data{
            if let decodedData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData)
                as? [Amigo]{
                amigos = decodedData!
                posicionAct = amigos
                filterList()
            }
        }
    }
    
    
    func filterList() {
    posicionAct = posicionAct.sorted() { $0.nombre > $1.nombre }
    tablaAmigos.reloadData();
}
    func filterList1() {
        posicionAct = posicionAct.sorted() { $0.nombre < $1.nombre }
        tablaAmigos.reloadData();
    }
    func filterList2() {
        posicionAct = posicionAct.sorted() { $0.gradoAfinidad > $1.gradoAfinidad }
        tablaAmigos.reloadData();
    }
    func filterList3() {
        posicionAct = posicionAct.sorted() { $0.gradoAfinidad < $1.gradoAfinidad }
        tablaAmigos.reloadData();
    }
    
    
    
    
    
    
    
    
    @IBAction func ordenarBtn(_ sender: UIBarButtonItem) {
        
        //Elegir método de Ordenación
        let alert = UIAlertController(title:  "¿Qué parámetro quieres utilizar para ordenar?", message: "", preferredStyle: .alert)
        
        let botonUno = UIAlertAction(title: "Nombre", style: UIAlertAction.Style.default, handler: { (action) -> Void in
            
            //Ordenar por Nombre
            
            let alert2 = UIAlertController(title:  "¿Orden Ascendente o Descendente?", message: "", preferredStyle: .alert)
            
            let botonUno1 = UIAlertAction(title: "Descendente", style: UIAlertAction.Style.default, handler: { (action) -> Void in
                
                self.filterList()
                
                
            } )
            let botonDos1 = UIAlertAction(title: "Ascendente", style: UIAlertAction.Style.default, handler: { (action) -> Void in
                
                
                self.filterList1()
            } )
            alert2.addAction(botonDos1)
            alert2.addAction(botonUno1)
            
            self.present(alert2, animated: true, completion: nil)
            
            
        } )
        let botonDos = UIAlertAction(title: "G.Afinidad", style: UIAlertAction.Style.default, handler: { (action) -> Void in
            //Ordenar por gAfinidad
            
            let alert3 = UIAlertController(title:  "¿Orden Ascendente o Descendente?", message: "", preferredStyle: .alert)
            
            let botonUno2 = UIAlertAction(title: "Descendente", style: UIAlertAction.Style.default, handler: { (action) -> Void in
                
                self.filterList3()
                
                
            } )
            let botonDos2 = UIAlertAction(title: "Ascendente", style: UIAlertAction.Style.default, handler: { (action) -> Void in
                
                
                self.filterList2()
            } )
            alert3.addAction(botonDos2)
            alert3.addAction(botonUno2)
            
            self.present(alert3, animated: true, completion: nil)
        } )
        alert.addAction(botonDos)
        alert.addAction(botonUno)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posicionAct.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AmigoTableViewCell", for: indexPath) as! AmigoTableViewCell
        posicionAct = amigos
        cell.nombre.text = posicionAct[indexPath.row].nombre
        cell.foto.image = posicionAct[indexPath.row].foto
        cell.evaluacion.gradoAfinidad = posicionAct[indexPath.row].gradoAfinidad
        
        // Configure the cell...
        
        return cell
    }
    
    // MARK: - Unwind segue desde AmigoViewController
    
    @IBAction func actualizarTabla(sender: UIStoryboardSegue){
        let amigo : Amigo = (sender.source as! AmigoViewController).amigo
        let filaSeleccionada = tableView.indexPathForSelectedRow
        if filaSeleccionada == nil{
            addNuevoAmigo(amigo: amigo)
            posicionAct = amigos
        }else{
            updateNuevoAmigo(amigo: amigo, idFila: filaSeleccionada!)
            posicionAct = amigos
        }
    }
    
    func addNuevoAmigo(amigo: Amigo){
        amigos.append(amigo)
        let newIndexPath: IndexPath = IndexPath(row: amigos.count-1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .bottom)
    }
    
    func updateNuevoAmigo(amigo: Amigo, idFila: IndexPath){
        amigos[idFila.row] = amigo
        tableView.reloadRows(at: [idFila], with: .fade)
    }
    
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Eliminar"
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath) {
        if editingStyle != .delete {return}
        
        let alert = UIAlertController(title:  "¿Seguro que deseas eliminar este amigo?", message: "", preferredStyle: .alert)
        
        let botonUno = UIAlertAction(title: "No", style: UIAlertAction.Style.destructive, handler: { (action) -> Void in
           
        } )
        let botonDos = UIAlertAction(title: "Si", style: UIAlertAction.Style.default, handler: { (action) -> Void in
        
            self.amigos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } )
        
        alert.addAction(botonDos)
        alert.addAction(botonUno)
        
        present(alert, animated: true, completion: nil)

        
    }
    
    
    override func tableView(_ tableView: UITableView,
                            canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        guard !searchText.isEmpty else {
            posicionAct = amigos
            tablaAmigos.reloadData()
            return
        }
        posicionAct = amigos.filter({ Amigo -> Bool in
            return Amigo.nombre.contains(searchText)
        })
        tablaAmigos.reloadData()
        
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
 */


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "updateAmigo"{
            return
        }
        let selectedRow = tableView.indexPath(for: sender as! AmigoTableViewCell)?.row
        let viewDestiny = segue.destination as! AmigoViewController
        viewDestiny.amigo = amigos[selectedRow!]
        posicionAct = amigos
        
    }
    

}
