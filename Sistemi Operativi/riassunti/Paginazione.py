import math

def calcByteFrame(x):
    # Restituisce il numero di byte minimo richiesto per contenere x bit
    return math.ceil(x / 8)

def paginazione(bitIndirizziLogici, bitOffset, bitRAM):
    
    nPagine = bitIndirizziLogici - bitOffset
    print(f"{nPagine=} ({bitIndirizziLogici}-{bitOffset})")
    
    
    # 2^nPagine >= 2^bitOffset ?
    if 2**nPagine >= 2**bitOffset:
        print(f"2^{nPagine}>=2^{bitOffset}")
        
        # numero frame (2^bitRam-2^bitOffset)
        nFrame = bitRAM-bitOffset
        print(f"{nFrame=} ({bitRAM}-{bitOffset})")
        
        # dimensione in byte di un entry della page table
        byteFrame = calcByteFrame(nFrame)
        print(f"{byteFrame=}")
        
        # taglia massima di una PT nel sistema
        PTMax = int(math.log2((2**nPagine)*byteFrame))
        print(f"PTmax=2^{PTMax} (2^{(nPagine)}*{byteFrame})")
        
        # paginazione della PT massimale (2^PTMax/2^bitOffset)
        PagMax = PTMax - bitOffset
        print(f"PagMax=2^{PagMax} (2^{(PTMax)}/2^{bitOffset})")
        
        # PT di secondo livello più grande
        PT2Max = int(math.log2((2**PagMax)*byteFrame))
        print(f"PT2Max=2^{PT2Max} (2^{(PagMax)}*{byteFrame})")
        
        print(f"\np1  p2  d\n{PagMax}b  {nFrame}b   {bitOffset}b")
        
        print(f"{PagMax+nFrame+bitOffset=}, {bitIndirizziLogici=}")


paginazione(bitIndirizziLogici=32, bitOffset=15, bitRAM = 29)