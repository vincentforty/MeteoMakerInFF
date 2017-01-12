import bottle
from bottle import route, static_file 
import dht
import datetime
import sqlite3 as sqlite


# MeteoMAkerInFF by Vincenzo Quaranta
@route('/<filename:re:.*\.js>')
def javascripts(filename):
  return static_file(filename, root='static/js')


@route('/<filename:re:.*\.css>')
def stylesheets(filename):
    return static_file(filename, root='static/css')

@route('/<filename:re:.*\.(jpg|png|gif|ico)>')
def images(filename):
    return static_file(filename, root='./static/img')

@route('/<filename:re:.*\.(eot|ttf|woff|svg)>')
def fonts(filename):
    return static_file(filename, root='static/fonts')

valori_per_pagina=20

@bottle.route("/tabella")
def paginaTemperatureZero():
  return paginaTemperature(0)

@bottle.route("/tabella/<indice>")
def paginaTemperature(indice):
  indice=int(indice)
  connessione=sqlite.connect("meteomakerinff.db")
  with connessione:
    righe=list()
    cursore=connessione.cursor()
    cursore.execute("SELECT * FROM VALORI ORDER BY DATA DESC")
    contatore=0
    riga=cursore.fetchone()
    while contatore<indice and riga!=None:
      riga=cursore.fetchone()
      contatore+=1
    if riga==None:
      return bottle.template("tabella2",righe=righe,indice=indice,valoriperpagina=valori_per_pagina)
    contatore=0
    while contatore<valori_per_pagina and riga!=None:
      riga=cursore.fetchone()
      if riga==None:
        break
      righe.append(riga)
      contatore+=1
  return bottle.template("tabella2",righe=righe,indice=indice,valoriperpagina=valori_per_pagina)

def avviaServer():
  bottle.run(host="0.0.0.0", port=8080) 

