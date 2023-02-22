import UIKit

class LoginTableViewController: UITableViewController
{
//  outlets for all the TextFields on login screen.
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var imgprofile: UIImageView!
    @IBOutlet weak var passwordTF: UITextField!

//  outlets for labels required for checking validation on login screen.
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    
//  outlet for Sign In button on login screen.
    @IBOutlet weak var submitButton: UIButton!
    
//  This function is designed to perform an action on the email text field located on the login screen, and it will display a validation message on the label accordingly.
    @IBAction func emailChanged(_ sender: Any)
    {
        if let email=emailTF.text
        {
            if let errorMessage=invalidEmail(email)
            {
                emailError.text=errorMessage
                emailError.isHidden=false
            }
            else
            {
                emailError.isHidden=true
            }
        }
        checkForValidation()
    }
    
//  This function is designed to validate the email Text Field.
    func invalidEmail(_ value: String) -> String?
    {
//  Regular expression which will validate email Text Field.
        let regularExpression = "[A-Z0-9a-z>_%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3}"
        let predicate=NSPredicate(format: "SELF MATCHES%@", regularExpression)
        if emailTF.text==""
        {
            return "Required"
        }
        else if !predicate.evaluate(with: value)
        {
            return "Invalid Email Address"
        }
        return nil
    }
    
//  This function is designed to perform an action on the password text field located on the login screen, and it will display a validation message on the label accordingly.
    @IBAction func passwordChanged(_ sender: Any)
    {
        if let password=passwordTF.text
        {
            if let errorMessage=invalidPassword(password)
            {
                passwordError.text=errorMessage
                passwordError.isHidden=false
            }
            else
            {
                passwordError.isHidden=true
            }
        }
        checkForValidation()
    }
    
//  This function is designed to validate the password text field.
    func invalidPassword(_ value: String) -> String?
    {
//  Regular Expression which will validate password Text Field.
        let password="^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
        let predicate=NSPredicate(format: "SELF MATCHES%@",password)
        if passwordTF.text==""
        {
            return "Required"
        }
        else if !predicate.evaluate(with: value)
        {
            return "Enter 8 characters password"
        }
        return nil
    }
    
//  This Action function needs to be written to perform an action when a button is clicked.
    @IBAction func submitACTION(_ sender: Any) {
    }
    
//  This function is used to enable or disable the submit button.
    func checkForValidation()
    {
        if emailError.isHidden && passwordError.isHidden
        {
            submitButton.isEnabled = true
        }
        else
        {
            submitButton.isEnabled=false
        }
    }
    
//  This function will enable and disable a button when the screen is loaded, and it will clear the email and password text fields when the screen is loaded again.
    func buttonDisableEnable()
    {
        submitButton.isEnabled=false
        emailError.isHidden=false
        passwordError.isHidden=false
        
        emailError.text="Required"
        passwordError.text="Required"
        
        emailTF.text=""
        passwordTF.text=""
    }
    
//  This function will run and perform an action when the screen is loaded.
    override func viewDidLoad()
    {
        super.viewDidLoad()
        buttonDisableEnable()
        
//  The code below allows user interaction for the image view and adds a UITapGestureRecognizer to it.
        let tapGesture=UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer: )))
        imgprofile.isUserInteractionEnabled=true
        imgprofile.addGestureRecognizer(tapGesture)
    }
    
//  The code opens the Gallery app.
    @objc
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer )
    {
        openGallery()
    }
}

//  This code is an extension of UINavigationControllerDelegate and UIImagePickerControllerDelegate, which opens the    Gallery app when the user taps on an image.
//  This code is also used to open the gallery when the user clicks on the camera icon in the navigation bar.
extension LoginTableViewController:UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
//  This code is trying to open the gallery if the user has a saved photos album.
    func openGallery()
    {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            let picker=UIImagePickerController()
            picker.delegate=self
            picker.sourceType = .savedPhotosAlbum
            present(picker, animated: true)
        }
    }
    
//  This code is a function that runs when the user selects an image from their camera roll. It first checks if the selected image has been saved in the device's photo library and saves it as a new profile picture for the login screen.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let img=info[.originalImage] as? UIImage
        {
            imgprofile.image=img
        }
        dismiss(animated: true)
    }
}
