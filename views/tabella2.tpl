<!doctype html>
<html>
        <head>
            <title>MeteoMakerInFF</title>
            <script type="text/javascript"  src="../Chart.js" charset="utf-8"></script>
            <link type="text/css" href="../mainpagecss.css" rel="stylesheet">
        </head>
        <body>

            <div id="logo" align=center>
                <p id="spinnerLogo" class="spinner"><img src="../logoMeteo.png" /></p>
            </div> 
            <div id="grafo">  
                        <div id="makerinff" align=center>
                                <canvas id="canvas" height="150" width="600"></canvas>
                        </div>
		
            </div>
            <div id="tabula">
            <div>
% if indice!=0:
<a href="/tabella/{{indice-valoriperpagina}}">Valori precedenti</a>
% end
% if len(righe)>=valoriperpagina:
<a href="/tabella/{{indice+valoriperpagina}}">Valori successivi</a>
% end
           <table border="1">
           <tr>
           <th>Data</th><th>Ora</th><th>Temperatura</th><th>Umidit&agrave</th>
           </tr>
% for riga in righe:
<tr>
<td id="sa">{{riga[1]}}</td>
<td>{{riga[2]}}</td>
<td id="sa">{{riga[3]}}</td>
<td>{{riga[4]}}</td>
% end
</table>
</div>
</div>
<div id="info">
In occasione del MakerInFF
vi presentiamo un piccolo esempio
di stazione meteorologica
a scopo didattico.
Un server http rende disponibili i dati della temperatura e dell&rsquo; umidit&agrave; 
rilevati da un sensore e riportati su di un grafico che ne visualizza l&rsquo; andamento.
Questi dati li possiamo raggiungere connettendoci dal nostro pc o cellulare direttamente all&rsquo; indirizzo 
IP del raspberry pi.
La piattaforma &egrave; scritta in python, scrive e legge i dati da un database sqlite e
visualizza il grafico attraverso l&rsquo uso di javascript
<br><br>
<i>l&rsquo; educatore Vincenzo Quaranta</i>
</div>

<script>
var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
var infodata=[];//informazioni sulla data e ora
var mio=[];//temperatura
var mio2=[];//umidita
% for riga in righe:
var gef="{{riga[2]}}";
infodata.push(gef);
mio.push({{riga[3]}});
mio2.push({{riga[4]}});
% end
                var lineChartData = {

                        labels : [infodata[0],infodata[1],infodata[2],infodata[3],infodata[4],infodata[5],infodata[6],infodata[7],infodata[8],infodata[9],infodata[10],infodata[11],infodata[12],infodata[13]],
                        datasets : [
                            {
                                    label: "My First dataset",
                                    fillColor : "rgba(220,220,220,0.2)",
                                    strokeColor : "rgba(220,220,220,1)",
                                    pointColor : "rgba(220,220,220,1)",
                                    pointStrokeColor : "#fff",
                                    pointHighlightFill : "#fff",
                                    pointHighlightStroke : "rgba(220,220,220,1)",
                                    data : [mio2[0], mio2[1], mio2[2], mio2[3], mio2[4], mio2[5], mio2[6], mio2[7], mio2[8], mio2[9], mio2[10], mio2[11], mio2[12], mio2[13]]

                            },
                            {
                                    label: "My Second dataset",
                                    fillColor : "rgba(151,187,205,0.2)",
                                    strokeColor : "rgba(151,187,205,1)",
                                    pointColor : "rgba(151,187,205,1)",
                                    pointStrokeColor : "#fff",
                                    pointHighlightFill : "#fff",
                                    pointHighlightStroke : "rgba(151,187,205,1)",
                                    data : [mio[0], mio[1], mio[2], mio[3], mio[4], mio[5], mio[6], mio[7], mio[8], mio[9], mio[10], mio[11], mio[12], mio[13]]
                            }


                        ]

                }

        window.onload = function(){
                var ctx = document.getElementById("canvas").getContext("2d");
                window.myLine = new Chart(ctx).Line(lineChartData, {
                        responsive: true
                });
        }


        </script>
        </body>
</html>

