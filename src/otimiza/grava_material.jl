
function Grava_material(C10,C01,C20,C11,C02,d)
    
    #
    # String com a definição do material 
    #
    material = " /batch
    /prep7
    toffst,273.15,      
    tref,22.
    TB,HYPE,1,1,5,MOON
    TBDATA,1,$C10,$C01,$C20,$C11,$C02,$d
    MP,DENS,1,1.19e-09,	
    MP,UVID,1,fc4313a1-c4ae-43af-b253-ad2923dee743
    FINISH
    "

    fd = open("material.inp","w")
    write(fd,material)
    close(fd)

end