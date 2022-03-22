defmodule ElixAgenciasBancosTest do
  use ExUnit.Case
  doctest ElixAgenciasBancos

  test "retorna 03 agencias procuradas pelo CEP" do
    assert length(ElixAgenciasBancos.get_agencias_by_cep("04543-011", 3)) === 3
  end

  test "retorna 01 agencia procurada pelo CEP - parametro default" do
    assert length(ElixAgenciasBancos.get_agencias_by_cep("04543-011")) === 1
  end

  test "retorna 01 agencia procurada pelo municipio" do
    assert length(ElixAgenciasBancos.get_agencias_by_municipio("aparecida", 1)) === 1
  end

  test "retorna 01 agencia procurada pelo municipio - parametro default" do
    assert length(ElixAgenciasBancos.get_agencias_by_municipio("aparecida")) === 1
  end

  test "retorna 01 agencia procurada pelo municipio e pelo nome do banco" do
    assert length(ElixAgenciasBancos.get_agencias_by_municipio_e_nome_banco("aparecida", "santander", 1)) === 1
  end

  test "retorna 01 agencia procurada pelo municipio e pelo nome do banco - parametro default" do
    assert length(ElixAgenciasBancos.get_agencias_by_municipio_e_nome_banco("aparecida", "santander")) === 1
  end

end
