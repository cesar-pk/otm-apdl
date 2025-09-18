#
# Calcula o erro quadrático médio 
# 


#
# Iterpolações dos comportamentos das garras. Pressão normalizada para [0:1]
#
function ApproxX(x)

   34.628*x^2 - 0.674*x + 0.0973

end

function ApproxY(x)

     -11.503*x^2 + 60.293*x - 0.5889   

end


#
# p -> vetor com as pressões normalizadas do ANSYS (segunda coluna do CSV)
# X -> vetor com os deslocamentos X (terceira coluna do CSV)
# Y -> vetor com os deslocamentos Y (quarta coluna do CSV)
#
function Erro_quaratico(p::Vector,X::Vector,Y::Vector)

    # Calcula os deslocamentos interpolados 
    interpX = ApproxX.(p)
    interpY = ApproxY.(p)

    # Erro quadrático médio 
    erro = sqrt( sum(  (X.-interpX).^2 .+ (Y.-interpY).^2  )   )

end
