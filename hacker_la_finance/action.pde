int index=0;
String varlang="";
float varlangnum = 0;
float valLang = 0;

void makeAction() {

  int val=1;
  Status t = tweets.get(index);
  String text = t.getText();
  println(text);
  println(t.getUser().getFollowersCount());

  //pour attribuer une valeur numéraire à une langue
  if (t.getUser().getLang().equals("en")||t.getUser().getLang().equals("en-gb")) {
    //langnum[i] = 2.5;
    valLang=3;
  } else if (t.getUser().getLang().equals("ar")||t.getUser().getLang().equals("es")) {
    valLang=1.9;
  } else if (t.getUser().getLang().equals("fr")||t.getUser().getLang().equals("pt")) {
    valLang=1.7;
  } else if (t.getUser().getLang().equals("id")||t.getUser().getLang().equals("hi")) {
    valLang=1.3;
  } else if (t.getUser().getLang().equals("ru")||t.getUser().getLang().equals("ja")||t.getUser().getLang().equals("de")||t.getUser().getLang().equals("it")) {
    valLang=1.2;
  } else {
    valLang=1;
  }
  //on imprime la valeur du coeff qui est calculé en multipliant valeur de la langue avec le nb de fav avec le nb de RT puis qui est mappé pour réduire l'échelle youhou
  float coeff = map(valLang*(t.getFavoriteCount()+1)*(t.getRetweetCount()+1)*(t.getUser().getFollowersCount()/2000 +1), 1, 50, 0, 100);

  String[] list = split(text, ' '); //breaks a String into pieces using a character or string as the delimiter. A String[] array is returned that contains each of the pieces. 
  //listeDeMots.add(list); //on ajoute cette liste list à un tableau listeDeMots; pour pouvoir y accéder en dehors de la boucle pour comparer

  for (int i  = 0; i < list.length; i++) {
    //println(i+ " > "+list[i]); // affiche la liste de mots
    for (int j=0; j<listeMeliorative.length; j++) {
      if (list[i].equals(listeMeliorative[j])) {
        val++;
      }
    }
  }
  
  float valcoeff = val*coeff;
  
  //println("val : " + val);
  //println("coeff : " +coeff);
  //println("valxcoeff  > "+valcoeff);
  
  tabPoints.add(new Point(xPoint,valcoeff));

  index++;
  if (index>tweets.size()-1)index=0;
}