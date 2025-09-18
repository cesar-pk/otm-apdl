#
# Roda o ansys 
#
# cmd = `$ansys  -b -i $apdl -o saida.txt`
#
#
function Roda_Ansys(cmd,arquivo_saida)

    @label aqui
    try
      run(cmd,wait=true)
    catch 

      if !Verifica_saida_ansys(arquivo_saida)
        println("tentando...")
        @goto aqui
      end
    end

end