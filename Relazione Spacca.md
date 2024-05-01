### Requisiti  
Per eseguire il jar è necessaria almeno la versione 21 di java ([Download](https://www.oracle.com/it/java/technologies/downloads/#java21))  
### Software usato  
IntelliJ: IDE e download librerie.    
Github Dekstop: Upload e download modifiche dalla repository online.    
Scene Builder: Creazione file `.fxml`.  
### Librerie Usate  
JavaFX: Parte grafica del progeto    
GSON: Lettura/scrittura/caricamento file Json  
Javax.mail: API per invio mail  
### Siti web usati  
[GitHub](https://github.com/): Workspace condiviso    
[Freesound](https://freesound.org/): Audio ed effetti sonori    
[Canva](https://www.canva.com/it_it/): Editor di immagini  
## Partita  
1. Cliccare crea partita  
2. Fare login con username `admin` e password `spacca`  
3. L'admin inserisce i nomi dei giocatori ed eventualmente le loro mail  
4. L'admin sceglie eventuali bot   
5. Cliccare "crea partita" e copiare il codice generato  
6. Tornare alla home  
7. Cliccare gioca partita  
8. Ogni giocatore inseirsce il proprio nome e il codice della parita da giocare (Admin possono entrare in tutte le partite)  
## Torneo  
1. Cliccare crea torneo  
2. Fare login con username `admin` e password `spacca`  
3. L'admin sceglie il numero di giocatori per il torneo  
4. L'admin inserisce i giocatori. Se il numero dei giocatori è inferiore a quello dei giocatori selezionati, verranno automaticamente creati bot per raggiungere il numero richiesto  
5. Tornare alla home  
6. Cliccare gioca torneo e inserire il codice del torneo  
7. Appare la schermata del tabellone con le varie partite da giocare. Certe partite saranno bloccate fino a quando non terminano tutte quelle del round precedente   
8. Cliccare la partita da giocare  
9. Finita la finale, il torneo verrà eliminato  
## Privilegi Amministratore  
Eseguendo l'accesso da admin, oltre che creare partite e tornei, è possibile  
- modificare i nomi dei giocatori e le loro mail  
- cancellare partite e tornei in sospeso  
- cambiare il numero dei turni delle partite  
## Opzioni  
Dal menù impostazioni si può  
- cambiare lingua  
- attivare o disattivare effetti sonori e musica  
- uscire da una partita salvando i progressi  
- visualizzare le regole  
- visualizzare la classifica  
## Sviluppo del progetto  
#### Partita  
#### Salvataggi  
#### Invio Mail  
#### Suoni e Audio  
## Suddivisione del lavoro  
- Nanni: Tutte le classi nella cartella [classi](https://github.com/asdru22/ProgettoSpacca/tree/main/src/main/java/gioco/progettospacca/classi) ad eccezione di qualche metodo in `Partita.java` e `Carta.java`. Vari collegamenti con le opzioni, salvataggi e metodi della classe Utili all'interno dei [controller](https://github.com/asdru22/ProgettoSpacca/tree/main/src/main/java/gioco/progettospacca/controller).  
- Manieri: Grafica e design (FXML), collegamenti tra le scene e classi [controller](https://github.com/asdru22/ProgettoSpacca/tree/main/src/main/java/gioco/progettospacca/controller) associate, creazione di tutte le immagini.  
- Silvestri: [PartitaController.java](https://github.com/asdru22/ProgettoSpacca/tree/main/src/main/java/gioco/progettospacca/controller/PartitaController.java): Implementazione partita vera e propria (animazioni, bot, eventi e algoritmo principale di gioco). Gestione di tutti gli eventi dell'intera applicazione (eventi javafx: mouseEvent, clickEvent, keyEvent ecc...), metodi funzionali alla partita nelle classi `Partita.java` e `Carta.java` nella cartella [classi](https://github.com/asdru22/ProgettoSpacca/tree/main/src/main/java/gioco/progettospacca/classi). Meccanismo di invio mail.