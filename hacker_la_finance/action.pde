int index=0;
void makeAction() {
  
  int val=0;
  Status t = tweets.get(index);
  String text = t.getText();
  println(text);

  String[] list = split(text, ' '); //breaks a String into pieces using a character or string as the delimiter. A String[] array is returned that contains each of the pieces. 
  listeDeMots.add(list); //on ajoute cette liste list à un tableau listeDeMots; pour pouvoir y accéder en dehors de la boucle pour comparer
  
  for (int i  = 0; i < list.length; i++) {
    println(i+ " > "+list[i]); // affiche la liste de mots
    for(int j=0;j<listeMeliorative.length;j++){
      if(list[i].equals(listeMeliorative[j])){
        val++;
      }
    }
  }

  println("val  > "+val);


  index++;
  if (index>tweets.size()-1)index=0;
}