void buttonsKlicken() {
  // 1. Back-Arrow in allen Menüs
  if ((showMusicMenu || showControlsMenu || showCredits || showExitConfirm == false || showResolutionWarning == false) &&
    mouseX > backArrowX && mouseX < backArrowX + backArrowWidth &&
    mouseY > backArrowY && mouseY < backArrowY + backArrowHeight) {
    showMusicMenu = false;
    showControlsMenu = false;
    showCredits = false;
    showSettings = true;
    redraw();
    return;
  }

  // 2. Wenn Credits-Menü aktiv ist, nur Klicks zum Schließen erlauben
  if (showCredits && showExitConfirm == false && showResolutionWarning == false) {
    showCredits = false;
    showSettings = true;
    redraw();
    return;
  }

  // 3. Music-Menü-Interaktionen
  if (showMusicMenu && showExitConfirm == false && showResolutionWarning == false) {
    float listY = height/4 + 80;

    for (int i = 0; i < musicFiles.length; i++) {
      // Play/Pause-Button
      if (dist(mouseX, mouseY, 520, listY + 15) < 15) {
        if (i == currentTrackIndex && player.isPlaying()) {
          player.pause();
        } else {
          currentTrackIndex = i;
          changeTrack(currentTrackIndex);
        }
        redraw();
        return;
      }

      // Track-Auswahl
      if (mouseX > 500 && mouseX < 1420 && mouseY > listY - 5 && mouseY < listY + 35) {
        currentTrackIndex = i;
        changeTrack(currentTrackIndex);
        redraw();
        return;
      }
      listY += 50;
    }
  }

  // 4. Controls-Button (in Settings)
  if (showSettings && !showMusicMenu && !showCredits && showExitConfirm == false && showResolutionWarning == false &&
    mouseX > controlsButtonX && mouseX < controlsButtonX + controlsButtonWidth &&
    mouseY > controlsButtonY && mouseY < controlsButtonY + controlsButtonHeight) {
    showControlsMenu = true;
    redraw();
    return;
  }

  // 5. Music-Button (in Settings)
  if (showSettings && !showControlsMenu && !showCredits && showExitConfirm == false && showResolutionWarning == false &&
    mouseX > musicButtonX && mouseX < musicButtonX + musicButtonWidth &&
    mouseY > musicButtonY && mouseY < musicButtonY + musicButtonHeight) {
    showMusicMenu = true;
    redraw();
    return;
  }

  // 6. Credits-Button (in Settings)
  if (showSettings && !showMusicMenu && !showControlsMenu && showExitConfirm == false && showResolutionWarning == false &&
    mouseX > creditsButtonX && mouseX < creditsButtonX + creditsButtonWidth &&
    mouseY > creditsButtonY && mouseY < creditsButtonY + creditsButtonHeight) {
    showCredits = true;
    showSettings = false;
    redraw();
    return;
  }

  // 7. Language-Button (in Settings)
  if (showSettings && !showMusicMenu && !showControlsMenu && !showCredits && showExitConfirm == false && showResolutionWarning == false &&
    mouseX > langButtonX && mouseX < langButtonX + langButtonWidth &&
    mouseY > langButtonY && mouseY < langButtonY + langButtonHeight) {
    isEnglish = !isEnglish;
    redraw();
    return;
  }

  // 8. Exit-Button (im Spiel)
  if (gameStarted && !showMusicMenu && !showControlsMenu && !showCredits && showResolutionWarning == false &&
    mouseX > exitButtonX && mouseX < exitButtonX + exitButtonWidth &&
    mouseY > exitButtonY && mouseY < exitButtonY + exitButtonHeight) {
    showExitRoundConfirm = true;
    redraw();
    return;
  }

  // Exit confirmation buttons
  if (showExitRoundConfirm) {
    if (mouseX > exitRoundYesButtonX && mouseX < exitRoundYesButtonX + exitRoundYesButtonWidth && showResolutionWarning == false &&
      mouseY > exitRoundYesButtonY && mouseY < exitRoundYesButtonY + exitRoundYesButtonHeight) {
      gameStarted = false;
      showExitRoundConfirm = false;
      showSettings = false;
      showMusicMenu = false;
      showControlsMenu = false;
      return;
    }

    if (mouseX > exitRoundNoButtonX && mouseX < exitRoundNoButtonX + exitRoundNoButtonWidth && showResolutionWarning == false &&
      mouseY > exitRoundNoButtonY && mouseY < exitRoundNoButtonY + exitRoundNoButtonHeight) {
      showExitRoundConfirm = false;
      redraw();
      return;
    }
  }

  // 9. Back-Button (von Weltkarte zum Bild)
  if (gameStarted && isGuessed && !showSettings && showExitRoundConfirm == false && showResolutionWarning == false &&
    mouseX > backButtonX && mouseX < backButtonX + backButtonWidth &&
    mouseY > backButtonY && mouseY < backButtonY + backButtonHeight) {
    if (images[currentImage] == null) {
      images[currentImage] = loadImage(imageUrls[currentImage]);
    }
    img = images[currentImage];
    isGuessed = false;
    zoom = max((float)width / img.width, (float)height / img.height);
    offsetX = 0;
    offsetY = 0;
    redraw();
    return;
  }

  // 10. Settings-Button
  if (!showSettings && !showMusicMenu && !showControlsMenu && !showCredits && showExitConfirm == false && showResolutionWarning == false &&
    mouseX > settingsButtonX && mouseX < settingsButtonX + settingsButtonWidth &&
    mouseY > settingsButtonY && mouseY < settingsButtonY + settingsButtonHeight) {
    showSettings = true;
    redraw();
    return;
  }

  // 11. Close-Settings-Button
  if (showSettings && !showMusicMenu && !showControlsMenu && !showCredits && showResolutionWarning == false &&
    mouseX > settingsCloseButtonX && mouseX < settingsCloseButtonX + settingsCloseButtonWidth &&
    mouseY > settingsCloseButtonY && mouseY < settingsCloseButtonY + settingsCloseButtonHeight) {
    showSettings = false;
    showMusicMenu = false;
    showControlsMenu = false;
    redraw();
    return;
  }

  // 12. Start-Button
  if (!gameStarted && !showSettings && !showMusicMenu && !showControlsMenu && !showCredits && showExitConfirm == false && showResolutionWarning == false &&
    mouseX > startButtonX && mouseX < startButtonX + startButtonWidth &&
    mouseY > startButtonY && mouseY <startButtonY + startButtonHeight) {
    restartGame();
    gameStarted = true;
    redraw();
    return;
  }

  // 13. Guess-Button
  if (gameStarted && score == -1 && !isGuessed && !showSettings && showExitRoundConfirm == false && showResolutionWarning == false &&
    mouseX > guessButtonX && mouseX < guessButtonX + guessButtonWidth &&
    mouseY > guessButtonY && mouseY < guessButtonY + guessButtonHeight) {
    img = worldImage;
    isGuessed = true;
    zoom = max((float)width / img.width, (float)height / img.height);
    offsetX = 0;
    offsetY = 0;
    redraw();
    return;
  }

  // 14. Confirm-Button
  if (gameStarted && isGuessed && pointSet && score == -1 && !showSettings && showExitRoundConfirm == false && showResolutionWarning == false &&
    mouseX > confirmguessButtonX && mouseX < confirmguessButtonX + confirmguessButtonWidth &&
    mouseY > confirmguessButtonY && mouseY < confirmguessButtonY + confirmguessButtonHeight) {
    isSubmit = true;
    checkGuess();
    redraw();
    return;
  }

  // 15. Restart-Button
  if (gameStarted && score > -1 && !showSettings && showExitRoundConfirm == false && showResolutionWarning == false &&
    mouseX > restartguessButtonX && mouseX < restartguessButtonX + restartguessButtonWidth &&
    mouseY > restartguessButtonY && mouseY < restartguessButtonY + restartguessButtonHeight) {
    restartGame();
    redraw();
    return;
  }

  // 16. Punkt auf Karte setzen
  if (gameStarted && isGuessed && !isSubmit && mouseButton == LEFT && !showSettings && showExitRoundConfirm == false && showResolutionWarning == false) {
    float adjustedX = (mouseX - offsetX) / zoom;
    float adjustedY = (mouseY - offsetY) / zoom;

    if (adjustedX >= 0 && adjustedX <= worldImage.width &&
      adjustedY >= 0 && adjustedY <= worldImage.height) {
      point = new PVector(adjustedX, adjustedY);
      pointSet = true;
      redraw();
    }
  }

  // 17. Zweiter Exit-Button (schließt das Spiel)
  if (gameStarted == false && showResolutionWarning == false &&
    mouseX > exitButtonX && mouseX < exitButtonX + exitButtonWidth &&
    mouseY > exitButtonY && mouseY < exitButtonY + exitButtonHeight) {
    showExitConfirm = true;
    return;
  }

  // Exit confirmation buttons
  if (showExitConfirm) {
    if (mouseX > exitYesButtonX && mouseX < exitYesButtonX + exitYesButtonWidth &&
      mouseY > exitYesButtonY && mouseY < exitYesButtonY + exitYesButtonHeight) {
      exit(); // Close the program
      return;
    }

    if (mouseX > exitNoButtonX && mouseX < exitNoButtonX + exitNoButtonWidth &&
      mouseY > exitNoButtonY && mouseY < exitNoButtonY + exitNoButtonHeight) {
      showExitConfirm = false;
      redraw();
      return;
    }
  }

  // Behandlung des OK-Buttons der Warnmeldung
  if (showResolutionWarning &&
    mouseX > width/2 - 100 && mouseX < width/2 + 100 &&
    mouseY > height/2 + 50 && mouseY < height/2 + 100) {
    exit();
    redraw();
    return;
  }
}

void checkSliderInteraction() {
  // 1. Knopf-Position berechnen
  float knobX = sliderX + map(sliderValue, 0, 100, 0, sliderWidth);

  // 2. Farbe nur zurücksetzen, wenn nicht aktiv
  if (!sliderActive) {
    if (dist(mouseX, mouseY, knobX, sliderY + sliderHeight/2) < 20) {
      cursor(HAND);
      sliderColor = color(150, 230, 255); // Hellblau bei Hover
    } else {
      cursor(ARROW);
      sliderColor = color(150, 100, 255); // Lila als Standardfarbe
    }
  }

  // 3. Slider-Drag-Logik (unverändert)
  if (mousePressed && (sliderActive || dist(mouseX, mouseY, knobX, sliderY + sliderHeight/2) < 20)) {
    sliderActive = true;
    sliderColor = color(150, 100, 255); // Lila während des Drags

    // Slider-Wert aktualisieren
    sliderValue = constrain(map(mouseX, sliderX, sliderX + sliderWidth, 0, 100), 0, 100);
    volumeText = "Lautstärke: " + (int)sliderValue + "%";

    // Ersetze den Musik-Steuerungs-Teil durch:
    if (sliderValue == 0) {
      player.pause();
    } else {
      if (!player.isPlaying()) player.play();

      // Nur Lautstärke ändern, wenn nicht gemuted
      if (!isMuted) {
        player.setGain(map(sliderValue, 1, 100, -30, 0));
      }
    }

    redraw(); // Neuzeichnen erzwingen
  }
}
