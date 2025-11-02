void drawBackButton() {
  if (gameStarted && isGuessed) { // Nur sichtbar wenn auf Weltkarte

    pushMatrix(); //
    resetMatrix(); // (ignoriert Zoom/Offset)

    fill(150, 100, 255); // Lila wie andere Buttons
    rect(backButtonX, backButtonY, backButtonWidth, backButtonHeight, 10);

    fill(255);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(getText("back"), backButtonX + backButtonWidth/2, backButtonY + backButtonHeight/2);

    popMatrix();
  }
}

void drawControlsButton() {
  if (!showSettings || showMusicMenu) return;

  fill(150, 100, 255);
  rect(controlsButtonX, controlsButtonY, controlsButtonWidth, controlsButtonHeight, 10);

  fill(255);
  textSize(20);
  textAlign(CENTER, CENTER);
  text(getText("controls"), controlsButtonX + controlsButtonWidth/2, controlsButtonY + controlsButtonHeight/2);
}

void drawLanguageButton() {
  fill(isEnglish ? color(150, 100, 255) : color(255, 150, 0));
  rect(langButtonX, langButtonY, langButtonWidth, langButtonHeight, 10);

  fill(255);
  textSize(20);
  textAlign(CENTER, CENTER);
  text(languages[isEnglish ? 1 : 0], langButtonX + langButtonWidth/2, langButtonY + langButtonHeight/2);
}

void drawMusicMenuButton() {
  if (!showSettings || showMusicMenu) return; // Nur im Settings-Menü anzeigen

  fill(150, 100, 255); // Blauer Button
  rect(musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight, 10);

  fill(255);
  textSize(20);
  textAlign(CENTER, CENTER);
  text(getText("music_selection"), musicButtonX + musicButtonWidth/2, musicButtonY + musicButtonHeight/2);
}

// Zeichnet den Credits-Button
void drawCreditsButton() {
  fill(150, 100, 255);
  rect(creditsButtonX, creditsButtonY, creditsButtonWidth, creditsButtonHeight, 10);

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text(getText("credits_button"), creditsButtonX + creditsButtonWidth / 2, creditsButtonY + creditsButtonHeight / 2);
}

// Zeichnet den Exit-Button
void drawExitButton() {

  pushMatrix(); //
  resetMatrix(); // (ignoriert Zoom/Offset)

  fill(200, 0, 0); // Rote Farbe für den Exit-Button
  rect(exitButtonX, exitButtonY, exitButtonWidth, exitButtonHeight, 10);

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text(getText("exit"), exitButtonX + exitButtonWidth / 2, exitButtonY + exitButtonHeight / 2);

  popMatrix();
}

//Zeichne den Start-Button
void drawStartButton() {
  fill(0, 200, 0);
  rect(startButtonX, startButtonY, startButtonWidth, startButtonHeight, 10);

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text(getText("start"), width/2 - 20, 1035);
}

// Zeichnet den Settings-Button im Startbildschirm
void drawSettingsButton() {
  image(settingsImage, settingsButtonX, settingsButtonY, settingsButtonWidth, settingsButtonHeight);
}

// Zeichne die Buttons
void drawGuessButton() {

  pushMatrix(); //
  resetMatrix(); // (ignoriert Zoom/Offset)

  fill(100, 200, 255);
  rect(guessButtonX, guessButtonY, guessButtonWidth, guessButtonHeight, 10);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(20);

  text(getText("guess"), guessButtonX + guessButtonWidth / 2, guessButtonY + guessButtonHeight / 2);

  popMatrix();
}

void drawConfirmButton() {

  pushMatrix(); //
  resetMatrix(); // (ignoriert Zoom/Offset)

  fill(200, 255, 150);
  rect(confirmguessButtonX, confirmguessButtonY, confirmguessButtonWidth, confirmguessButtonHeight, 10);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(20);
  text(getText("submit"), confirmguessButtonX + confirmguessButtonWidth / 2, confirmguessButtonY + confirmguessButtonHeight / 2);

  popMatrix();
}

void drawRestartButton() {

  pushMatrix(); //
  resetMatrix(); // (ignoriert Zoom/Offset)

  fill(255, 200, 150);
  rect(restartguessButtonX, restartguessButtonY, restartguessButtonWidth, restartguessButtonHeight, 10);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(20);
  text(getText("restart"), restartguessButtonX + restartguessButtonWidth / 2, restartguessButtonY + restartguessButtonHeight / 2);

  popMatrix();
}

// Zeichnet den zweiten Exit-Button
void drawExitButton2() {
    pushMatrix();
    resetMatrix(); // (ignoriert Zoom/Offset)

    fill(200, 0, 0); // Rote Farbe für den Exit-Button
    rect(exitButtonX, exitButtonY, exitButtonWidth, exitButtonHeight, 10);

    fill(255);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(getText("exit"), exitButtonX + exitButtonWidth / 2, exitButtonY + exitButtonHeight / 2);

    popMatrix();
}
