### Network security
- Confidenzialità: solo il sender e receiver devono essere in grado di capire i contenuti dei messaggi. Il sender li cripta, il receiver li decripta.
- Autenticazione: sender e receiver vogliono conferma dell'identità reciproca.
- Integrità dei messaggi: sender e receiver vogliono essere sicuri che il messaggio non venga alterato senza essere rilevato.
- accesso e disponibilità: i servizi devono essere accessibili e disponibili agli utenti.
### Minacce alla sicurezza
- intercettazione dei messaggi
- inserire messaggi nella connessione
- creare sorgenti finte nei pacchetti
- prendere controllo della connessione togliendo uno tra sender e receiver e mettendosi al posto suo
- non rendendo il servizio disponibile
### Criptazione di un messaggio
- $m$: messaggio
- $K_A(m)$: messaggio criptato con chiave $K_A$
- $m=K_B(K_A(m))$: messaggio decriptato con chiave $K_B$
