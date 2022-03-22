defmodule ElixAgenciasBancos do
  @moduledoc """
  Documentation for `Elixagenciasbancos`.
  """
  require Logger
  @doc """
  Busca as agências localizadas de acordo com o CEP.
  """
  def get_agencias_by_cep(cep, quantidade_retorno \\ 1) when is_bitstring(cep) do
    case HTTPoison.get("https://olinda.bcb.gov.br/olinda/servico/Informes_Agencias/versao/v1/odata/Agencias?$top=#{quantidade_retorno}&$skip=0&$filter=Cep%20eq%20'#{cep}'&$format=json&$select=NomeIf,Segmento,NomeAgencia,Endereco,Numero,Complemento,Bairro,Cep,Municipio,UF,Telefone",
                        %{"User-Agent" => "elixagenciasbancos/1.0.1"}) do
      {:ok, %{body: raw_body, status_code: _code}} ->
      retorno = Jason.decode!(raw_body)

      retorno["value"]

      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error(inspect(reason))
    end
  end

  @doc """
  Busca as agências localizadas de acordo com o Municipio.
  """
  def get_agencias_by_municipio(municipio, quantidade_retorno \\ 1) when is_bitstring(municipio) do

    municipio_maiusculo = String.upcase(municipio)

    case HTTPoison.get("https://olinda.bcb.gov.br/olinda/servico/Informes_Agencias/versao/v1/odata/Agencias?$top=#{quantidade_retorno}&$skip=0&$filter=Municipio%20eq%20'#{municipio_maiusculo}'&$format=json&$select=NomeIf,Segmento,NomeAgencia,Endereco,Numero,Complemento,Bairro,Cep,Municipio,UF,Telefone",
                        %{"User-Agent" => "elixagenciasbancos/1.0.1"}) do
      {:ok, %{body: raw_body, status_code: _code}} ->
      retorno = Jason.decode!(raw_body)

      retorno["value"]

      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error(inspect(reason))
    end
  end

  @doc """
  Busca as agências localizadas de acordo com o Municipio e Banco informados.
  """
  def get_agencias_by_municipio_e_nome_banco(municipio, nome_banco, quantidade_retorno \\ 1)
                                              when is_bitstring(municipio) and is_bitstring(nome_banco) do

    municipio_maiusculo = String.upcase(municipio)
    nome_banco_maiusculo = String.upcase(nome_banco)

    case HTTPoison.get("https://olinda.bcb.gov.br/olinda/servico/Informes_Agencias/versao/v1/odata/Agencias?$top=#{quantidade_retorno}&$skip=0&$filter=Municipio%20eq%20'#{municipio_maiusculo}'%20and%20contains(NomeIf%2C'#{nome_banco_maiusculo}')&$format=json&$select=NomeIf,Segmento,NomeAgencia,Endereco,Numero,Complemento,Bairro,Cep,Municipio,UF,Telefone",
                        %{"User-Agent" => "elixagenciasbancos/1.0.1"}) do
      {:ok, %{body: raw_body, status_code: _code}} ->

      retorno = Jason.decode!(raw_body)

      retorno["value"]

      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error(inspect(reason))
    end
  end

end
