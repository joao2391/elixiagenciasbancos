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
  def get_agencias_by_cep(cep, quantidade_retorno) do
    case HTTPoison.get("https://olinda.bcb.gov.br/olinda/servico/Informes_Agencias/versao/v1/odata/Agencias?$top=#{quantidade_retorno}&$skip=0&$filter=Cep%20eq%20'#{cep}'&$format=json&$select=NomeIf,Segmento,NomeAgencia,Endereco,Numero,Complemento,Bairro,Cep,Municipio,UF,Telefone",
                        %{"User-Agent" => "elixagenciasbancos/1.0.1"}) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      retorno = Jason.decode!(raw_body)

      retorno

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end


end
