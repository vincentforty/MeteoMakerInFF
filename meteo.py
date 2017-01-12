#! /usr/bin/env python3

import dht
import sqlite3 as sqlite
import time
import datetime
import meteoserver
import threading

# MeteoMakerInFF by Vincenzo Quaranta

connessione=sqlite.connect("meteomakerinff.db")

server=threading.Thread(target=meteoserver.avviaServer)
server.start()

with connessione:
  while True:
    dativalidi, temperatura, umidita = dht.leggiSensore(11,25)
    if not dativalidi:
      print("Errore nella lettura dei dati")
    else:
      cursore=connessione.cursor()
      comandosql="INSERT INTO VALORI VALUES(?,?,?,?,?,0)"
      data_completa = datetime.datetime.now()
      data_giorno = (" "+str(data_completa.day)+"-"+str(data_completa.month)+"-"+str(data_completa.year))
      ora_rilevazione =(" "+str(data_completa.hour)+"-"+str(data_completa.minute)+"-"+str(data_completa.second))
      cursore.execute(comandosql,(data_completa,data_giorno,ora_rilevazione,temperatura,umidita))
      connessione.commit()
      print("Dati salvati - temperatura: "+str(temperatura)+" umidita: "+str(umidita))
    time.sleep(30)

