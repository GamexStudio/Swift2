
import UIKit

protocol PlaceCellDelegate: class {
    func placeBtnTapped(at index: Int,with expand: Bool )
}

class PlaceCell: UITableViewCell {
    @IBOutlet weak var placeDescLbl: UILabel!
    
    @IBOutlet weak var placeLbl: UILabel!
    @IBOutlet weak var placeImageView: UIImageView!
    
    @IBOutlet weak var placeBtn: UIButton!
    weak var delegate: PlaceCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func placeNameTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        delegate?.placeBtnTapped(at: sender.tag, with: sender.isSelected)
        
    }
}
