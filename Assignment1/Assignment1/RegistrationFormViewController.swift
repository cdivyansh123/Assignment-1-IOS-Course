import UIKit

class RegistrationFormViewController: UIViewController
{
//  outlets for TextFields on Registration Form screen that is RegistrationFormViewController.
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var AgeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var occupationTextField: UITextField!
    
//  This function will run and perform an action when the screen is loaded.
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
//  This is a function which will be performed on clicking the button which contains the code that submits the form by calling a function or performing an action. In summary, this code sets the text fields of the DisplayDataController class with specific values before submitting the form.
    @IBAction func submitForm(_ sender: Any)
    {
        
//  This code creates a new instance of the DisplayDataViewController class.
    let controller=storyboard?.instantiateViewController(withIdentifier: "DisplayData") as! DisplayDataViewController
        
        controller.nameText=nameTextField.text
        controller.ageText=AgeTextField.text
        controller.emaiLText=emailTextField.text
        controller.addressText=addressTextField.text
        controller.phoneText=phoneNumberTextField.text
        controller.occupationText=occupationTextField.text
        
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
}
