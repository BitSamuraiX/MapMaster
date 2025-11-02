void setup() {
  fullScreen();

  // Überprüfe die Bildschirmauflösung
  if (width != 1920 || height != 1080) {
    showResolutionWarning = true;
  } else {
    showResolutionWarning = false;
  }

  // Exit confirmation dialog dimensions
  exitConfirmWidth = 400;
  exitConfirmHeight = 250;
  exitConfirmX = width/2 - exitConfirmWidth/2;
  exitConfirmY = height/2 - exitConfirmHeight/2;

  // Yes/No buttons
  exitYesButtonWidth = 350;
  exitYesButtonHeight = 50;
  exitYesButtonX = exitConfirmX + exitConfirmWidth/4 - exitYesButtonWidth/2 + 100;
  exitYesButtonY = exitConfirmY + exitConfirmHeight - 157;

  exitNoButtonWidth = 350;
  exitNoButtonHeight = 50;
  exitNoButtonX = exitConfirmX + exitConfirmWidth/4 - exitNoButtonWidth/2 + 100;
  exitNoButtonY = exitConfirmY + exitConfirmHeight - 80;

  // Exit confirmation dialog dimensions
  exitRoundConfirmWidth = 400;
  exitRoundConfirmHeight = 250;
  exitRoundConfirmX = width/2 - exitConfirmWidth/2;
  exitRoundConfirmY = height/2 - exitConfirmHeight/2;

  // Yes/No buttons
  exitRoundYesButtonWidth = 350;
  exitRoundYesButtonHeight = 50;
  exitRoundYesButtonX = exitConfirmX + exitConfirmWidth/4 - exitYesButtonWidth/2 + 100;
  exitRoundYesButtonY = exitConfirmY + exitConfirmHeight - 157;

  exitRoundNoButtonWidth = 350;
  exitRoundNoButtonHeight = 50;
  exitRoundNoButtonX = exitConfirmX + exitConfirmWidth/4 - exitNoButtonWidth/2 + 100;
  exitRoundNoButtonY = exitConfirmY + exitConfirmHeight - 80;

  // Initialisiere Minim
  minim = new Minim(this);

  // Lade die Audiodatei
  player = minim.loadFile(musicFiles[0], 2048);

  // Spiele die Musik in einer Endlosschleife ab
  player.loop();

  // Slider-Positionierung (erst hier bekannt, da width/height jetzt verfügbar)
  sliderWidth = width * 0.3; // 30% der Bildschirmbreite
  sliderHeight = 15;
  sliderX = (width - sliderWidth) / 2;
  sliderY = 370;

  startScreen = loadImage(startURL);
  startScreen.resize(width, width/16*9);

  worldImage = loadImage(worldUrl);
  worldImage.resize(width, height);

  settingsImage = loadImage(settingsURL);

  kreuzImage = loadImage(kreuzImageURL);

  backArrow = loadImage(backArrowURL);

  ladeDaten(); // Methode zum Laden der Standorte und Koordinaten

  currentImage = getRandomInt();
  images[currentImage] = loadImage(imageUrls[currentImage]); //Lade das Bild
  img = images[currentImage];
}

void draw() {

  if (showResolutionWarning) {
    drawResolutionWarning();
    return; // Verhindere das Zeichnen des restlichen Spiels
  }

  if (gameStarted == false) {
    image(startScreen, 0, 0);
    drawStartButton();
    drawExitButton2();
  } else {

    // Zeichne das Bild mitsamt Zoom-/Pan-Transformation
    if (gameStarted == true) {
      pushMatrix();
      translate(offsetX, offsetY);
      scale(zoom);
      image(img, 0, 0);
      popMatrix();
    }
  }

  drawSettingsButton();

  if (gameStarted == true) {
    drawExitButton();
  }

  // draw Music Menu
  if (showMusicMenu) {
    drawMusicSelectionMenu();
  }

  if (gameStarted == true) {
    drawBackButton();
  }

  // Zeichne den gesetzten Punkt, wenn vorhanden
  if (gameStarted == true && point != null && isGuessed == true && pointSet == true) {
    drawPoint();  // Hier wird der Punkt gezeichnet
    redraw();
  }

  // Zeige den Button "Guess"/"Zurück" nur, wenn das Spiel noch läuft
  if (gameStarted == true && score == -1 && isGuessed == false) {
    drawGuessButton();
  }

  // Zeige den "Bestätigen"-Button nur auf der Weltkarte
  if (gameStarted == true && isGuessed == true && pointSet == true && score == -1) {
    drawConfirmButton();
  }

  // Wenn der Spieler Punkte erzielt hat, zeige den "Neu starten"-Button
  if (gameStarted == true && score > -1) {
    drawRestartButton();
    displayScore();
    if (highscore<=score)highscore=score;
    displayhighsore();
  }

  // Zeige das Ziel nur nach dem Bestätigen
  if (gameStarted == true && isSubmit == true) {
    PVector target = targetLocations[currentImage];
    if (target != null) {
      drawTargetLocation(target);  // Zeichne das Ziel
    }
  }

  // Zeige die Koordinaten des gesetzten Punktes und des Zielorts in der linken unteren Ecke
  if (gameStarted == true && isSubmit == true && point != null) {
    drawCoordinates("Gesetzt: (" + (int)point.x + ", " + (int)point.y + ")", height - 180);
  }
  PVector target = targetLocations[currentImage];
  if (target != null && isSubmit == true) {
    drawCoordinates("Ziel: (" + (int)target.x + ", " + (int)target.y + ")", height - 160);
  }

  if (gameStarted == true && score > 0 || isSubmit) {  // Zeige den Restart-Button auch bei Score 0 nach Bestätigung
    drawRestartButton();
    displayScore();
    if (highscore <= score) highscore = score;
    displayhighsore();
  }

  // Nur EIN Menü gleichzeitig anzeigen
  if (showMusicMenu) {
    drawMusicSelectionMenu();
  } else if (showCredits) {
    drawCreditsMenu();
  } else if (showControlsMenu) {
    drawControlsMenu();
  } else if (showSettings) {
    drawSettingsMenu();
    drawMusicMenuButton();  // Music-Button im Settings-Menü
    drawVolumeSlider();
    drawLanguageButton();
    drawControlsButton();
    creditsY = 1120;
  }

  if (gameStarted == true) {
    drawExitButton();
  }



  // Draw exit confirmation
  if (showExitRoundConfirm) {
    drawExitRoundConfirmation();
  }

  // Draw exit confirmation
  if (showExitConfirm) {
    drawExitConfirmation();
  }
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}
