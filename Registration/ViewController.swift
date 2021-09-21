import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

@IBOutlet weak var nameTextField: UITextField!

@IBOutlet weak var surnameTextField: UITextField!

@IBOutlet weak var birthTextField: UITextField!

@IBOutlet weak var loginTextField: UITextField!

@IBOutlet weak var passworTextField: UITextField!

@IBOutlet weak var buttonSignUp: UIButton!

let datePicker = UIDatePicker()

    
@IBAction func signUp(_ sender: Any) {
guard let name = nameTextField.text, let surname = surnameTextField.text, let birthDate = birthTextField.text, let login = loginTextField.text, let password = passworTextField.text
else{
return
}
    
    
    let set = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ")
    let setForBdate = CharacterSet(charactersIn: "0123456789.")
        func check(texxtField: String) -> Bool{
            if(texxtField.rangeOfCharacter(from: set.inverted) != nil ){
                   return false
                   } else {
                     return true
                   }
        }
   
    func checkBdateField(bdateField: String) -> Bool{
        if(bdateField.rangeOfCharacter(from: setForBdate.inverted) != nil ){
               return false
               } else {
                 return true
               }
    }

    var buttonCheck: Int = 0
    if(name != "" && check(texxtField: name) == true){
    nameTextField.backgroundColor = .white
    nameTextField.alpha = 1
    nameTextField.textColor = .black
    buttonCheck += 1
    } else if(name == "" || check(texxtField: name) == false){
    nameTextField.backgroundColor = .red
    nameTextField.textColor = .black
    nameTextField.alpha = 0.2
    }
    
    if(surname != "" && check(texxtField: surname) == true){
    surnameTextField.backgroundColor = .white
    surnameTextField.textColor = .black
    surnameTextField.alpha = 1
    buttonCheck += 1
    } else if(surname == "" || check(texxtField: surname) == false){
    surnameTextField.backgroundColor = .red
    surnameTextField.textColor = .black
    surnameTextField.alpha = 0.2
    }
    
    if(login != ""){
    loginTextField.backgroundColor = .white
    loginTextField.textColor = .black
    loginTextField.alpha = 1
        buttonCheck += 1
    } else {
    loginTextField.backgroundColor = .red
    loginTextField.textColor = .black
    loginTextField.alpha = 0.2
    }
    
    if(password != ""){
    passworTextField.backgroundColor = .white
    passworTextField.textColor = .black
    passworTextField.alpha = 1
    buttonCheck += 1
    } else {
    passworTextField.backgroundColor = .red
    passworTextField.textColor = .black
    passworTextField.alpha = 0.2
    }
    
    if(birthDate != "" && checkBdateField(bdateField: birthDate) == true){
    birthTextField.backgroundColor = .white
    birthTextField.textColor = .black
    birthTextField.alpha = 1
    buttonCheck += 1
    } else if (birthDate == "" || checkBdateField(bdateField: birthDate) == false  ) {
    birthTextField.backgroundColor = .red
    birthTextField.textColor = .black
    birthTextField.alpha = 0.2
    }
    
    if(buttonCheck == 5){
        buttonSignUp.backgroundColor = .green
    } else {
        buttonSignUp.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    }
}
   
override func viewDidLoad() {
super.viewDidLoad()
    birthTextField.inputView = datePicker
    datePicker.datePickerMode = .date
    datePicker.preferredDatePickerStyle = .wheels
    let toolbar = UIToolbar()
    toolbar.sizeToFit()
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
    _ = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    toolbar.setItems([doneButton], animated: true)
 
    datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
    self.view.addGestureRecognizer(tapGesture)
    
nameTextField.layer.cornerRadius = 12
surnameTextField.layer.cornerRadius = 12
birthTextField.layer.cornerRadius = 12
loginTextField.layer.cornerRadius = 12
passworTextField.layer.cornerRadius = 12
buttonSignUp.layer.cornerRadius = 12
birthTextField.delegate = self

}
    @objc func doneAction() {
        view.endEditing(true)
    }
    @objc func dateChanged() {
        getDate()
       
    }
    @objc func tapGestureDone(){
        view.endEditing(true)
    }
    func getDate(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        birthTextField.text = formatter.string(from: datePicker.date)
    }

}

extension String{
func textFieldFormatNameSurname() -> String{
var inputText = self
inputText = inputText.prefix(1).uppercased() + inputText.dropFirst()
return inputText
    }
}





