//
//  TableViewController.swift
//  eggplant-brownie
//
//  Created by Douglas Dreer on 01/02/23.
//  Copyright © 2023 Alura. All rights reserved.
//

import UIKit

class RefeicoesViewController: UITableViewController {
    var SEM_REGISTRO: String = "Sem itens cadastrados"
    let ADICIONAR_SEGUE: String = "adicionarSegue"
    var refeicaoList = [
        Refeicao(nome: "Sem itens cadastrados", felicidade: 0)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("total de registros são \(refeicaoList.count)")
        return refeicaoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicaoList[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        return celula
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ADICIONAR_SEGUE {
            if let viewController = segue.destination as? ViewController {
                viewController.tableViewController = self
            }
        }
        
    }
    
    func adicionarItem(_ refeicao: Refeicao) {
        if refeicaoList.contains(where: { $0.nome == SEM_REGISTRO }) {
            refeicaoList.remove(at: 0)
        }
        
        refeicaoList.append(refeicao)
        tableView.reloadData()
    }
    
}
