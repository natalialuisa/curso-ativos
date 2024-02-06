/*
SPDX-License-Identifier: CC-BY-4.0
(c) Desenvolvido por Natalia Pinto
This work is licensed under a Creative Commons Attribution 4.0 International License.
*/
pragma solidity 0.8.19;

/// @author Natalia Pinto
/// @title Um exemplo de Eleicao
contract Eleicao {

    mapping(address=>uint8) public votos;
    uint8 voto;
    
    event InformouUmVoto(address paraQuem, uint8 quanto);
    
    // @dev incrementa um voto e adiciona ao acumulador de um endereco ethereum.
    // @return quantidade total de votos
    function votar() public returns (uint256) {
        require(votos[msg.sender] > 10, "Voto jah fornecido"); 
        voto++;
        votos[msg.sender] = voto;
        emit InformouUmVoto(msg.sender, voto);
        return voto;
    }

}
