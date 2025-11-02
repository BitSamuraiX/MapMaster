// Überprüfe die Eingabe
void mousePressed() {
  if (showSettings) {
    // Startet die Slider-Interaktion (nur beim ersten Klick)
    checkSliderInteraction();
  }
}

void mouseReleased() {
  sliderActive = false;

  // Wenn Credits-Menü aktiv ist, schließe es bei jedem Klick
  if (showCredits) {
    showCredits = false;
    showSettings = true;
    redraw();
    return;
  }

  buttonsKlicken();
}

void keyPressed() {
  if (key == 'm' || key == 'M') { // Mute-Toggle
    if (player.isPlaying()) {
      player.pause();
      fill(255, 0, 0);
      text("Mute", 1910, 990);
      redraw();
    } else {
      player.play();
      redraw();
    }
  }

  if (key == 'd' || key == 'D') { // Deutsch-Toggle
    isEnglish = false;
  } else if (key == 'e' || key == 'E') { // Englisch-Toggle
    isEnglish = true;
  }

  // Pfeiltasten für Track-Wechsel
  if (key == CODED) {
    if (keyCode == LEFT) { // Vorheriger Track
      currentTrackIndex--;
      if (currentTrackIndex < 0) {
        currentTrackIndex = musicFiles.length - 1; // Zurück zum letzten Track
      }
      changeTrack(currentTrackIndex);
    } else if (keyCode == RIGHT) { // Nächster Track
      currentTrackIndex++;
      if (currentTrackIndex >= musicFiles.length) {
        currentTrackIndex = 0; // Zurück zum ersten Track
      }
      changeTrack(currentTrackIndex);
    }
  }

  if (gameStarted && isGuessed && pointSet && score == -1 && !showSettings && showExitRoundConfirm == false && showResolutionWarning == false && key == ' ') {
    isSubmit = true;
    checkGuess();
    redraw();
    return;
  }
}
