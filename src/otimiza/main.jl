include("verifica_saida.jl")
include("roda_ansys.jl")
include("grava_material.jl")


#
# LPop    https://github.com/CodeLenz/LPop
#



using LPop 

# Numero de partículas 
Np = 2

# Número de iterações
niter = 2

# Valor de referência 
x = [-27.782;38.6665;0.087766;-0.75145;9.2331]

# Roda na referência para termos o objetivo 
fatual = Roda_analise(x)

# Limites inferiores
xl = [-34.0;30.0;0.05;-1.0;7.0]

# Limites superiores
xu = [-20.0;50.0;0.1;-0.5;11.0 ]

# Call the optimizer
x_opt = PSO(Roda_analise,Np,niter,xl,xu, verbose=true)




#
# Calcula a resposta da garra dado um conjunto de parâmetros do Mooney 5P
#
function Roda_analise(x::Vector)

    # Passa do x para os coeficientes
    C10,C01,C20,C11,C02 = x[:]

    # Caso os coeficientes não tenham significado físico, 
    # retorna um objetivo grande
    # return ALTO

    # Fixa a compressibilidade (incompressível)
    d = 0.0

    # Gera o material.inp
    Grava_material(C10,C01,C20,C11,C02,d)

    # Executável 
    ansys = "C:\\Program Files\\ANSYS Inc\\v251\\ansys\\bin\\winx64\\MAPDL.exe"

    # Nome do arquivo que tem os comandos para o ANSYS
    apdl = "ajuste.inp"

    # Nome do arquivo com os parâmetros do material 
    arquivo_material = "material.inp"

    # Arquivo de saida 
    saida = "saida.txt"

    # Comando para rodar o ANSYS
    #cmd = `$ansys  -b -i $apdl -o $saida`
    cmd = `$ansys -i $apdl`

    # Chama o Ansys
    Roda_Ansys(cmd, saida)

    # Le o arquivo com os deslocamentos do ANSYS

    # Le o arquivo com os deslocamentos de referência 

    # Calcula o erro 

    # retorna o erro (objetivo)

end
