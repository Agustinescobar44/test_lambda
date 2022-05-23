defmodule TestLambda do
  def darVueltaPalabras(oracion) do
    List.to_string(
      for palabra <- String.split(oracion) do
       String.reverse(palabra) <> " "
      end
    ) |> String.trim()
  end

  def leerDiario do
    {_estado, oracion} = File.read("diario.txt")
    String.split(oracion)
  end

  def sePuedeEscribir?(nota) do
    palabrasDiario = Enum.frequencies(leerDiario())
    for palabra <- String.split(nota) do
      if Map.has_key?(palabrasDiario,palabra) do
        {_,cantidadPalabra} = Map.fetch(palabrasDiario,palabra)
        if cantidadPalabra >= 1 do
          Map.put(palabrasDiario,palabra, cantidadPalabra - 1)
        else
          false
        end
      else
       false
      end
    end

  end
end
