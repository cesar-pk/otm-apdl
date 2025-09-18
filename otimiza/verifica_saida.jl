#
# Verifica se o ansys rodou certinho
#
function Verifica_saida_ansys(arquivo_saida)

   # Abre o arquivo de saída
   tudo = readlines(arquivo_saida)

   # String de erro
   erro = "*** ERROR - ANSYS license not available."

   # Verifica se tivemos erro em alguma linha
   flag_sucesso = true
   for linha in tudo
     if occursin(erro,linha)
        flag_sucesso = false
        break
     end
    end

    return flag_sucesso

end
