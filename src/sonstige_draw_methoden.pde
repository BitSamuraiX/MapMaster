void drawExitRoundConfirmation() {
  if (!showExitRoundConfirm) return;

  // Dark overlay
  fill(0, 0, 0, 200);
  rect(0, 0, width, height);

  // Confirmation box
  fill(50, 50, 50, 200);
  rect(exitRoundConfirmX, exitRoundConfirmY, exitRoundConfirmWidth, exitRoundConfirmHeight, 20);

  // Text
  fill(255);
  textSize(25);
  textAlign(CENTER, CENTER);
  text(getText("exit_round_confirm"), width/2, exitRoundConfirmY + 50);

  // Yes button
  fill(200, 0, 0);
  rect(exitRoundYesButtonX, exitRoundYesButtonY, exitRoundYesButtonWidth, exitRoundYesButtonHeight, 10);
  fill(255);
  textSize(20);
  text(getText("yes2"), exitRoundYesButtonX + exitRoundYesButtonWidth/2, exitRoundYesButtonY + exitRoundYesButtonHeight/2);

  // No button
  fill(100, 200, 100);
  rect(exitRoundNoButtonX, exitRoundNoButtonY, exitRoundNoButtonWidth, exitRoundNoButtonHeight, 10);
  fill(255);
  textSize(20);
  text(getText("no2"), exitRoundNoButtonX + exitRoundNoButtonWidth/2, exitRoundNoButtonY + exitRoundNoButtonHeight/2);

  redraw();
}

void drawExitConfirmation() {
  if (!showExitConfirm) return;

  // Dark overlay
  fill(0, 0, 0, 200);
  rect(0, 0, width, height);

  // Confirmation box
  fill(50, 50, 50, 200);
  rect(exitConfirmX, exitConfirmY, exitConfirmWidth, exitConfirmHeight, 20);

  // Text
  fill(255);
  textSize(25);
  textAlign(CENTER, CENTER);
  text(getText("exit_confirm"), width/2, exitConfirmY + 50);

  // Yes button
  fill(200, 0, 0);
  rect(exitYesButtonX, exitYesButtonY, exitYesButtonWidth, exitYesButtonHeight, 10);
  fill(255);
  textSize(20);
  text(getText("yes"), exitYesButtonX + exitYesButtonWidth/2, exitYesButtonY + exitYesButtonHeight/2);

  // No button
  fill(100, 200, 100);
  rect(exitNoButtonX, exitNoButtonY, exitNoButtonWidth, exitNoButtonHeight, 10);
  fill(255);
  textSize(20);
  text(getText("no"), exitNoButtonX + exitNoButtonWidth/2, exitNoButtonY + exitNoButtonHeight/2);
}

void drawDashedLine(PVector p1, PVector p2) {
  float dashLength = 10 / zoom;
  float gapLength = 5 / zoom;

  PVector dir = PVector.sub(p2, p1);
  float totalLength = dir.mag();
  dir.normalize();

  stroke(dashedLineColor);
  strokeWeight(dashedLineStroke / zoom);
  noFill();

  float drawnLength = 0;
  while (drawnLength < totalLength) {
    float nextLength = min(dashLength, totalLength - drawnLength);
    PVector start = PVector.add(p1, PVector.mult(dir, drawnLength));
    PVector end = PVector.add(start, PVector.mult(dir, nextLength));
    line(start.x, start.y, end.x, end.y);
    drawnLength += dashLength + gapLength;
  }
}

void drawControlsMenu() {
  if (!showControlsMenu) return;

  // Dark overlay
  fill(0, 0, 0, 200);
  rect(0, 0, width, height);

  // Hintergrund
  fill(50, 50, 50, 200);
  rect(480, 250, 960, 580, 20);

  // Titel
  fill(255);
  textSize(25);
  textAlign(CENTER, CENTER);
  text(getText("controls_title"), width/2, 330);

  // Steuerungsliste
  textSize(18);
  textAlign(LEFT, CENTER);
  float yPos = 380;

  String[][] controls = {
    {getText("right"), getText("controls_click")},
    {getText("wheel"), getText("controls_zoom")},
    {getText("left"), getText("controls_drag")},
    {"M", getText("controls_mute")},
    {"E", getText("controls_languageE")},
    {"D", getText("controls_languageD")},
    {getText("RIGHT"), getText("prev_track")},
    {getText("LEFT"), getText("next_track")},
  };

  for (String[] control : controls) {
    fill(255, 200, 100);
    text(control[0] + ":", 550, yPos);
    fill(255);
    text(control[1], 750, yPos);
    yPos += 40;
  }

  // Back-Button
  image(backArrow, backArrowX, backArrowY, backArrowWidth, backArrowHeight);
}

void drawMusicSelectionMenu() {

  // Dark overlay
  fill(0, 0, 0, 140);
  rect(0, 0, width, height);

  // Hintergrund
  fill(50, 50, 50, 200);
  rect(480, 250, 960, 580, 20);

  // Titel
  fill(255);
  textSize(25);
  textAlign(CENTER, CENTER);
  text(getText("music_selection"), width / 2, height / 4 + 30);

  // Track-Liste
  float listY = height/4 + 70;
  float buttonSize = 30;

  for (int i = 0; i < musicFiles.length; i++) {
    // Highlight aktuellen Track
    if (i == currentTrackIndex) {
      fill(100, 100, 255, 150);
      rect(500, listY - 5, 920, 40);
    }

    // Play/Pause Button Hintergrund
    fill(i == currentTrackIndex && player.isPlaying() ? 255 : 100, 200, 100);
    ellipse(520, listY + 15, buttonSize, buttonSize);

    // Trackname + Lautstärke
    fill(255);
    textSize(18);
    textAlign(LEFT, CENTER);
    String displayText = musicFiles[i];
    if (i == currentTrackIndex) {
      displayText += "  (Vol: " + (int)sliderValue + "%)";
    }
    text(displayText, 560, listY + 15);

    // Play/Pause Symbole (zwei Striche für Pause)
    fill(0);
    if (i == currentTrackIndex && player.isPlaying()) {
      // Zwei vertikale Striche für Pause
      rect(515, listY + 7, 4, 15);  // Linker Strich
      rect(522, listY + 7, 4, 15);  // Rechter Strich
    } else {
      // Play-Dreieck
      triangle(515, listY + 5, 515, listY + 25, 530, listY + 15);
    }

    listY += 50;
  }

  // Back arrow
  image(backArrow, backArrowX, backArrowY, backArrowWidth, backArrowHeight);
}

void drawCreditsMenu() {
  // 1. Vollständig schwarzer Hintergrund
  background(0);

  // 2. Zeichne nur den sichtbaren Teil der Credits mit Maskierung
  fill(255);
  textAlign(LEFT);

  // Titel (erscheint erst wenn er den unteren Rand erreicht)
  if (creditsY < height) {
    textSize(40);
    text("Credits", 500, creditsY - 40);
  }

  // Inhalt
  textSize(30);
  if (creditsY + 50 < height) text(getText("credits"), 500, creditsY + 50);


  // 3. Dunkler Überlagerungsbereich am unteren Rand (als "Maske")
  fill(0);
  noStroke();
  rect(0, height - maskHeight, width, maskHeight);

  // 4. Schließen-Button (immer sichtbar im maskierten Bereich)
  fill(255, 200);
  textSize(18);
  text(getText("click"), width/2 - 40, 1065);

  // 5. Scroll-Logik
  creditsY -= scrollSpeed;
  if (creditsY < -1100) creditsY = 1120; // Zurücksetzen
}

// Zeichnet das Einstellungsmenü
void drawSettingsMenu() {

  // Dark overlay
  fill(0, 0, 0, 200);
  rect(0, 0, width, height);

  fill(50, 50, 50, 200); // Dunkler Hintergrund
  rect(480, 250, 960, 580, 20);

  fill(255);
  textSize(25);
  textAlign(CENTER, CENTER);
  text(getText("settings"), width / 2, height / 4 + 30);

  // Close-Button
  fill(200, 0, 0);
  image(kreuzImage, settingsCloseButtonX, settingsCloseButtonY, settingsCloseButtonWidth, settingsCloseButtonHeight);

  drawCreditsButton();
  drawVolumeSlider();

  if (showCredits == true) drawCreditsMenu();

  if (!player.isPlaying()) {
    fill(255, 0, 0);
    text("MUTE", 954, 415);
  }

  fill(255);
  textSize(20);
  textAlign(LEFT, LEFT);
  text(getText("music") + ":", 550, 350);
  text(getText("language") + ":", 550, 570);
  text(getText("controls") + ":", 550, 658);
}

void drawPoint() {
  if (point != null) {
    pushMatrix();
    translate(offsetX, offsetY);
    scale(zoom);

    // Zeichne den Punkt in Weltkoordinaten
    fill(255);
    stroke(0);
    strokeWeight(2/zoom); // Strichstärke skaliert mit
    ellipse(point.x, point.y, 10/zoom, 10/zoom);

    popMatrix();
  }
}

// Zeichne die Koordinaten
void drawCoordinates(String text, float yPosition) {
  fill(0); // Schwarz für Text
  textSize(15);
  textAlign(LEFT, BOTTOM);
  text(text, 10, yPosition);  // Position in der linken unteren Ecke
}

void drawTargetLocation(PVector target) {
  if (target != null && point != null) {
    pushMatrix();
    translate(offsetX, offsetY);
    scale(zoom);

    // Zeichne gestrichelte Linie
    drawDashedLine(point, target);

    // Zeichne Zielpunkt (bleibt unverändert)
    fill(255, 0, 0);
    stroke(0);
    strokeWeight(2/zoom);
    ellipse(target.x, target.y, 15/zoom, 15/zoom);

    popMatrix();
  }
}

void drawVolumeSlider() {
  // 1. Schiene (Hintergrund)
  noStroke();
  fill(80, 80, 80, 200);
  rect(sliderX, sliderY, sliderWidth, sliderHeight, 10);

  // 2. Füllung (fortschrittlicher Teil)
  fill(sliderColor);
  float fillWidth = map(sliderValue, 0, 100, 0, sliderWidth); // LIVE-Berechnung
  rect(sliderX, sliderY, fillWidth, sliderHeight, 10);

  // 3. Knopf (dragbarer Kreis)
  float knobX = sliderX + fillWidth; // Nutze fillWidth für genaue Position
  fill(255);
  ellipse(knobX, sliderY + sliderHeight/2, 25, 25);

  // 4. Text-Label (aktualisiert sich automatisch via volumeText)
  fill(255);
  textSize(16);
  textAlign(CENTER, CENTER);
  text(volumeText, sliderX + sliderWidth/2, sliderY - 25);
}

void drawResolutionWarning() {
  if (!showResolutionWarning) return;

  // Dunkler Hintergrund
  fill(0, 0, 0, 200);
  rect(0, 0, width, height);

  // Warnmeldungs-Box
  fill(50, 50, 50);
  rect(width/2 - 300, height/2 - 150, 600, 300, 20);

  // Text
  fill(255);
  textSize(25);
  textAlign(CENTER, CENTER);
  text("Warning: Not optimal screen resolution", width/2, height/2 - 80);
  textSize(18);
  text("For the game to work properly, you must set your resolution to 1920x1080", width/2, height/2 - 10);

  // Schließen-Button
  fill(255, 50, 50);
  rect(width/2 - 100, height/2 + 50, 200, 50, 10);
  fill(255);
  textSize(20);
  text("Exit", width/2, height/2 + 75);
}
