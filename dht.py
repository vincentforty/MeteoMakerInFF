import subprocess
RILEVA_DHT = "/home/minotauro/esempio_dht_veloce.sh"

def leggiSensore(tipo,pin):
  outputbytes=subprocess.check_output(["sudo",RILEVA_DHT,str(tipo),str(pin)])
  output=outputbytes.decode("utf-8")
  indice=output.find("Temp = ")
  if indice==-1:
    return False,0.0,0.0

  temperatura=float(output[indice+7:-13])
  indice=output.find("Hum = ")
  if indice==-1:
    return False,0.0,0.0

  umidita=float(output[indice+6:-1])
  return True, temperatura, umidita

