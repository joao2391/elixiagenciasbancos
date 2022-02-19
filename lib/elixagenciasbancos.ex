defmodule Elixagenciasbancos do
  @moduledoc """
  Documentation for `Elixagenciasbancos`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Elixagenciasbancos.get_agencias_by_cep("03114-000", 10)
      :world

  """
  def get_agencias_by_cep(cep, quantidade_retorno \\ 1) when is_bitstring(cep) do
    case HTTPoison.get("https://olinda.bcb.gov.br/olinda/servico/Informes_Agencias/versao/v1/odata/Agencias?$top=#{quantidade_retorno}&$skip=0&$filter=Cep%20eq%20'#{cep}'&$format=json&$select=NomeIf,Segmento,NomeAgencia,Endereco,Numero,Complemento,Bairro,Cep,Municipio,UF,Telefone",
                        %{"User-Agent" => "elixagenciasbancos/1.0.1"}) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      retorno = Jason.decode!(raw_body)

      retorno["value"]

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

   @doc """
  Hello world.

  ## Examples

      iex> Elixagenciasbancos.get_agencias_by_municipio("SAO PAULO", 10)
      :world
  """
  def get_agencias_by_municipio(municipio, quantidade_retorno \\ 1) when is_bitstring(municipio) do
    case HTTPoison.get("https://olinda.bcb.gov.br/olinda/servico/Informes_Agencias/versao/v1/odata/Agencias?$top=#{quantidade_retorno}&$skip=0&$filter=Municipio%20eq%20'#{municipio}'&$format=json&$select=NomeIf,Segmento,NomeAgencia,Endereco,Numero,Complemento,Bairro,Cep,Municipio,UF,Telefone",
                        %{"User-Agent" => "elixagenciasbancos/1.0.1"}) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      retorno = Jason.decode!(raw_body)
      IO.puts(code)

      retorno["value"]

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  #"https://olinda.bcb.gov.br/olinda/servico/Informes_Agencias/versao/v1/odata/Agencias?$top=#{quantidadeRetorno}&$skip=0&$filter=Municipio%20eq%20'#{municipio}'%20and%20contains(NomeIf%2C'#{nomeBanco}')'&$format=json&$select=NomeIf,Segmento,NomeAgencia,Endereco,Numero,Complemento,Bairro,Cep,Municipio,UF,Telefone"

end
