import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var fTableRowHeight: CGFloat = 40
    fileprivate let kCellIdentifier = "PlaceCellID"
    var isExpanded = false
    var rowNo: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.rowHeight = 44.0
        self.tableView.estimatedRowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath) as! PlaceCell
        
        cell.placeLbl.text = "Place Name"
        cell.placeDescLbl.text = "Place Description Place Description Place Description Place Description Place Description Place Description Place Description Place Description Place Description"
        cell.placeBtn.tag = indexPath.row
        if fTableRowHeight == 40 {
            cell.placeImageView.isHidden = true
        }else {
            cell.placeImageView.isHidden = false
        }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if rowNo == indexPath.row {
            return fTableRowHeight
        }else {
            return 40
        }
        
    }
}

extension ViewController: PlaceCellDelegate {
    func placeBtnTapped(at index: Int, with expand: Bool) {
        if expand {
            rowNo = index
            fTableRowHeight = 130
        }else {
            fTableRowHeight = 40
        }
        
        tableView.reloadData()
    }
    
    
}
