ArrayList<Status> tweets; // on crée un tableau des tweets
ArrayList<Lang>langnum = new ArrayList <Lang>(); //on crée un tableau pour stocker la valeur de la langue de chaque tweet

// on crée une fonction qui s'appelle "search" qui va nous permettre de retourner une arrayList/notre tableau de tweets pour un mot clé correspondant
ArrayList <Status> search (String keyword) { 
  Query query = new Query(keyword); // construction d'une requête
  //paramètres 
  query.setCount(200); //on lui demande 20 résultats
  //query.setLang("fr"); //langue en fr

  /*
   try and catch = fonctionnement particulier
   on l'utilise pour les méthodes "risquées"
   permet de tester quelque chose. Ici, il y a plein d'erreurs possibles.
   Par exemple, si pas internet, on va avoir une erreur.
   permet de tester qqch et si ça ne marche pas, de tester autre chose.
   */
   
  try {
    QueryResult result = tweet.twitter.search(query); //action d'envoi de ma requête
    ArrayList<Status> tweets = (ArrayList)result.getTweets(); //on récupère les tweets
    return tweets; // on retourne l'arraylist tweets
  }
  catch (TwitterException e) { // si erreur, on "attrape" l'erreur
    println("déso, ça a planté bb"); 
    println(e.getMessage()); // affiche le message d'erreur complet
    return null; //retourne "null"
  }
}