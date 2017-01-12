import java.util.Random;
/*
    Vincenzo Quaranta - MeteoMakerInFF

    in mancanza del DHT 11 simuliamo il rilevamento di temperatura ed umidità

*/
public class esempio_get_temperatura {

    public static void main (String arg[]){

        float minTemp = 25.0f;
        float minUmid = 15.0f;
        float maxTemp = 39.0f;
        float maxUmid = 50.0f;
        Random rand = new Random();
        float temperatura = rand.nextFloat() * (maxTemp - minTemp) + minTemp;
        Random rand2 = new Random();
        float umidita = rand2.nextFloat() * (maxUmid - minUmid) + minUmid;
        temperatura=Math.round(temperatura - 0.5f);
        umidita=Math.round(umidita - 0.5f);
        System.out.print("Temp = "+temperatura);
        System.out.println(" Hum = "+umidita);

    }

}
