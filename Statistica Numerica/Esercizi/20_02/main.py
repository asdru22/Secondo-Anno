'''
ci sono due giocatori P1 e P2 che giocano a lanciare dadi a 6 faccie.
Vince chi fa il risultato più alto nel lancio. Fanno 50.000 partite.
In caso di parità vince il P1.
'''
import numpy as np
import time
import database as pd

n = 500_000
P1 = np.random.randint(1, 7, size=(n,))
P2 = np.random.randint(1, 7, size=(n,))

print(f"{P1=}\n{P2=}")

# Soluzione 1
t0 = time.time()
V1 = (P1 >= P2).sum()
V2 = (P2 > P1).sum()
print(f"{V1=}\n{V2=}")
print(f"{V1+V2=}")
# tempo esecuzione
print(f"{time.time()-t0=}")
