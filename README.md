Semplice esempio di piccola stazione metereologica scritto in python a scopo didattico, presentata in occasione del MakerInFF a Francavilla Fontana (Br) nel Settembre del 2015.
Un server http rende disponibili i dati della temperatura e dell’ umidità rilevati da un sensore (DHT 11) e riportati su di un grafico che ne visualizza l’ andamento. 
Questi dati li possiamo raggiungere connettendoci dal nostro pc o cellulare direttamente all’ indirizzo IP del Raspberry Pi. 
La piattaforma è scritta in python, scrive e legge i dati da un database sqlite e visualizza il grafico attraverso l'uso di javascript.
Vengono usate il microframework BottlePy e la libreria ChartJs, entrambe con licenza MIT.

Per il suo funzionamento ha bisogno dell'installazione di Java (esclusivamente
per l'emulazione del dispositivo DHT che rileva gli indici di umidità e
pressione) e di sqlite3.
 
utilizzo:

./meteo.py

dal browser:

http://127.0.0.1:8080/tabella
