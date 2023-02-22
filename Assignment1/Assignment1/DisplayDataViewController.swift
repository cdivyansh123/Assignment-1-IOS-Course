import UIKit

class DisplayDataViewController: UIViewController
{
//  outlets for all the labels in DisplayDataViewController which is used to take data from previous screen and display on current screen
    @IBOutlet weak var nameData: UILabel!
    @IBOutlet weak var ageData: UILabel!
    @IBOutlet weak var emailData: UILabel!
    @IBOutlet weak var addressData: UILabel!
    @IBOutlet weak var phoneData: UILabel!
    @IBOutlet weak var occupationData: UILabel!
    
//  using nameText property to getting name from the previous screen.
    var nameText: String?
    
//  using ageText property to getting age from the previous screen.
    var ageText: String?
    
//  using emailText property to getting email from the previous screen.
    var emaiLText: String?
    
//  using addressText property to getting address from the previous screen.
    var addressText: String?

//  using phoneText property to getting phone number from the previous screen.
    var phoneText: String?
    
//  using occupationText property to getting occupation from the previous screen.
    var occupationText: String?
    
//  This function will run and perform an action when the screen is loaded.
    override func viewDidLoad()
    {
        super.viewDidLoad()
//  The code checks whether there is any value in the textFields and sets the corresponding data to those textFields.
        if nameText != nil
        {
            nameData.text=nameText
        }
        if ageText != nil
        {
            ageData.text=ageText
        }
        if emaiLText != nil
        {
            emailData.text=emaiLText
        }
        if addressText != nil
        {
            addressData.text=addressText
        }
        if phoneText != nil
        {
            phoneData.text=phoneText
        }
        if occupationText != nil
        {
            occupationData.text=occupationText
        }
    }
}
