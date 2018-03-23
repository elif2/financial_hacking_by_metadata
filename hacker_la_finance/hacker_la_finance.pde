import processing.sound.*;

/*
 1) se créer un compte twitter
 2) aller sur apps.twitter.com
 3) créer une nouvelle app
 4) aller dans keys and access token
 5) créer mon access token
 // ne pas divulguer ces accès car donne accès au compte
 */

// deux librairies à importer avec Simple Tweet librairy
import gohai.simpletweet.*;
import twitter4j.*;

//on créer l'objet
SimpleTweet tweet;

SoundFile file;

String contenuTweet = ""; //variable dans laquelle on va venir stocker le texte de chaque tweet

ArrayList<String[]> listeDeMots = new ArrayList<String[]>(); //on crée un tableau qui contiendra les mots présents pour chaque tweet
String [] listeMeliorative = {"de", "les", "une", "vente", "à"};
String [] listeDepreciative = {"nul", "pourri", "relou"};

PrintWriter output; 
int valeurContenuTweet =0;



void setup() {
  //size(800, 800, P2D);
  file = new SoundFile(this, "caisse.mp3");
  
  fullScreen(P2D);
  //background(0);

  output =createWriter("test05.txt"); //Create a new file in the sketch directory

  //configuration de la connexion
  tweet = new SimpleTweet(this);
  tweet.setOAuthConsumerKey("IyrmnRUsEMEeo9P4jh1gX3ERV");
  tweet.setOAuthConsumerSecret("pdBwRnpfcwhZavJdEUymrkMH1TPUpGuakTMjHUBTPPADsBCsNr");
  tweet.setOAuthAccessToken("592083835-q3kcApqfrRXPUmrV0AQz7sF7tNNccCEhL4I0a7EI");
  tweet.setOAuthAccessTokenSecret("S2y8PIVlKIWk2CAFQwseMowQfxNag4rWGXoJk3MaZCoDS");

  //on cherche le mot clé "#trump"
  tweets = search("#chien -filter:retweets"); //on crée un filtre pour éviter de faire apparaître les RT
}

void draw() {
  background(240);
  traitementContenuTweet();
  pushMatrix();
  translate(0, height-20);
  drawPoint();
  popMatrix();
}

int timer=0;
int timerMax=60;
int xPoint=0;

void traitementContenuTweet() {
  /*
  for (int i =0; i<tweets.size(); i++) { 
   contenuTweet = tweets.get(i).getText();
   println(contenuTweet);
   //stockerTweetDansTxt(); //on appelle la fonction qui va venir extraire les String vers un fichier txt -> utilisé pour le text mining
   String[] list = split(contenuTweet, ' '); //breaks a String into pieces using a character or string as the delimiter. A String[] array is returned that contains each of the pieces. 
   listeDeMots.add(list); //on ajoute cette liste list à un tableau listeDeMots; pour pouvoir y accéder en dehors de la boucle pour comparer
   for (int j  = 0; j < list.length; j++)
   println(j+ " > "+list[j]); // affiche la liste de mots
   }*/

  if (timer>timerMax) {
    file.play();
    file.amp(0.3);
    makeAction();
    xPoint+=50;
    if (xPoint > width+50) {
      xPoint =0;
    }
    timer=0;
  }
  timer++;


  //output.close(); // Finishes the file
  //exit(); // Stops the program
  /*
  for (int i=0; i<listeDeMots.size(); i++) {//parcourt la ligne, et ressort un tableau de string [] qui contient tous les mots d'un tweet
   String[] mots = (String[]) listeDeMots.get(i); // ligne contenant un tweet,  savoir une liste de mots bien segemntée dans un tableau
   for (int j=0; j<mots.length; j++) { //parcourt chaque case du tableau de string []
   //variable temporaire qui s'appelle mots et qui stocke notre tableau de String [] (qui correspont à un tweet)
   for (String s : listeMeliorative) { //itère sur la liste 
   if (s.compareTo((String) mots[j]) == 0) {
   //valeurContenuTweet++;
   println("HOURA");
   }
   }
   }
   }
   */
}