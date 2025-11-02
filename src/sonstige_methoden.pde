void changeTrack(int trackIndex) {
    player.close();
    player = minim.loadFile(musicFiles[trackIndex], 2048);
    player.loop();
    if (isMuted) {
        player.pause();
    } else {
        player.setGain(map(sliderValue, 1, 100, -30, 0));
    }
    redraw();
}

void displayhighsore() {
  // Berechne die Farbe des Scores basierend auf der Distanz
  PVector target = targetLocations[currentImage];
  if (target != null && point != null) {
  } else {
    fill(0, 255, 0); // Standardfarbe Grün, wenn kein Ziel vorhanden
  }

  textSize(30);
  textAlign(LEFT, BOTTOM);
  text("Highscore: " + highscore + "/100", 10, height - 80);  // Score in der linken unteren Ecke
}

void displayScore() {

  // Berechne die Farbe des Scores basierend auf der Distanz
  PVector target = targetLocations[currentImage];
  if (target != null && point != null) {
    float distance = dist(point.x, point.y, target.x, target.y);
    int maxDistance = width/2;  // Maximale Distanz für 100% Punktzahl
    int scoreColor = color(map(distance, 0, maxDistance, 0, 255), 0, map(distance, 0, maxDistance, 255, 0)); // Farbabstufung von grün nach rot
    fill(scoreColor);
  } else {
    fill(0, 255, 0); // Standardfarbe Grün, wenn kein Ziel vorhanden
  }

  textSize(30);
  textAlign(LEFT, BOTTOM);
  text("Score: " + score + "/100", 10, height - 120);  // Score in der linken unteren Ecke
}

void checkGuess() {
  // Überprüfe, ob der Punkt gesetzt wurde
  if (point == null) {
    println("Fehler: Du hast keinen Punkt gesetzt.");
    return;  // Brich die Funktion ab, wenn der Punkt nicht gesetzt wurde
  }

  PVector target = targetLocations[currentImage];

  if (target != null) {
    float distance = dist(point.x, point.y, target.x, target.y);
    int maxDistance = width / 2;  // Maximale Distanz für 100% Punktzahl
    int tolerance = 5;  // Toleranzbereich in Pixeln

    if (distance <= tolerance) {
      score = 100;  // Volle Punktzahl, wenn der Tipp sehr genau ist
    } else {
      score = max(0, (int) map(distance, tolerance, maxDistance, 100, 0));  // Berechnung mit Toleranzbereich
    }

    redraw();
  } else {
    println("Fehler: Zielpunkt oder gesetzter Punkt fehlen.");
  }
}

int getRandomInt() {
  // Falls alle Zahlen aufgebraucht sind, Liste neu füllen
  if (numbers.isEmpty()) {
    for (int i = 1; i < images.length; i++) {
      numbers.add(i);
    }
    Collections.shuffle(numbers); // Mische die Zahlen für Zufälligkeit
  }

  int i = numbers.remove(0); // Nimm die erste Zahl aus der Liste
  println("RNG: " + i);
  return i;
}


void restartGame() {
  println("Restarting the game...");

  currentImage = getRandomInt(); // Wähle ein neues zufälliges Bild
  img = loadImage(imageUrls[currentImage]); // Lade das neue Bild

  // Statusvariablen zurücksetzen
  isGuessed = false;  // Der Spieler hat den Guess Button nicht betätigt
  pointSet = false;   // Kein Punkt wurde gesetzt
  isSubmit = false;   // Die Auswahl wurde nicht bestätigt
  score = -1;         // Punktzahl zurücksetzen
  point = null;       // Der gesetzte Punkt wird gelöscht

  // Zoom/Pan neu initialisieren
  if (img != null) {
    zoom = max((float)width / img.width, (float)height / img.height);
    offsetX = 0;
    offsetY = 0;
  }
  redraw();           // Neu zeichnen
}
