import Foundation
import UIKit

class MyReceiptsViewController: UIViewController {
  let contentView: MyReceiptsView
  weak var flowDelegate: MyReceiptsFlowDelegate?
  let viewModel = MyReceiptsViewModel()
  
  private var medicines: [Medicine] = []

  init(contentView: MyReceiptsView, flowDelegate: MyReceiptsFlowDelegate) {
    self.contentView = contentView
    self.flowDelegate = flowDelegate
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    setupTableView()
    loadData()
  }
  
  private func loadData() {
    medicines = viewModel.fetchData()
  }

  private func setup() {
    view.addSubview(contentView)
    view.backgroundColor = Colors.gray600

    setupConstraints()
  }

  private func setupConstraints() {
    setupContentViewToBounds(contentView: contentView)
  }
  
  private func setupTableView() {
    contentView.tableView.dataSource = self
    contentView.tableView.delegate = self
    contentView.tableView.register(RemedyCell.self, forCellReuseIdentifier: RemedyCell.identifier)
    contentView.tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    
  }
  
}

extension MyReceiptsViewController: UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return medicines.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 90
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = UIView()
    headerView.backgroundColor = .clear
    return headerView
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 4
  }
}

extension MyReceiptsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: RemedyCell.identifier, for: indexPath) as! RemedyCell
    let medicamento = medicines[indexPath.section]
    cell.configure(title: medicamento.remedy, time: medicamento.time, recurrence: medicamento.recurrence)
    
    cell.onDelete = { [weak self] in
      guard let self = self else { return }
      
      self.viewModel.deleteReceipt(byId: medicamento.id)
    }
    return cell
  }
  
}
