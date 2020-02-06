//
//  ViewController.swift
//  secondApp
//
//  Created by Aula11 on 8/10/19.
//  Copyright © 2019 Jose Antonio Parra Sánchez. All rights reserved.
//

import UIKit

class AmigoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    //MARK: Atributo
    
    var amigo: Amigo!
    
    @IBOutlet weak var guardarBtn: UIBarButtonItem!
    @IBOutlet weak var usuario: UILabel!
    @IBOutlet weak var usuarioTxt: UITextField!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var evaluationControl: EvaluationControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usuarioTxt.delegate = self
        
        if amigo == nil{
            guardarBtn.isEnabled = false
        }else{
            guardarBtn.isEnabled = true
            usuarioTxt.text = amigo.nombre
            imageView.image = amigo.foto
            evaluationControl.gradoAfinidad = amigo.gradoAfinidad
        }
    }
    
    //MARK: Actions
    
    @IBAction func seleccionarImagen(_ sender: UITapGestureRecognizer) {
        usuarioTxt.resignFirstResponder()
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present (picker, animated: true, completion: nil)
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn (_ textField: UITextField) -> Bool {
        usuarioTxt.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text!.isEmpty || textField.text == ""{
        
        }else{
            guardarBtn.isEnabled = true
            usuario.text = textField.text
        }
    }
    
    //MARK: UIImageViewControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Navegación
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        amigo = Amigo(nombre: usuarioTxt.text ?? "", foto: imageView.image, gAfinidad: evaluationControl.gradoAfinidad)
        
        
    }
}

