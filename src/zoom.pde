void mouseWheel(MouseEvent event) {
  if (gameStarted && showExitRoundConfirm == false && showSettings == false) {
    float delta = event.getCount();
    float zoomFactor = (delta > 0) ? 0.9f : 1.1f;

    // Mausposition in Bildkoordinaten (vor Transformation)
    float mouseWorldX = (mouseX - offsetX) / zoom;
    float mouseWorldY = (mouseY - offsetY) / zoom;

    // Neuen Zoom berechnen
    float newZoom = zoom * zoomFactor;
    newZoom = constrain(newZoom,
      max((float)width / img.width, (float)height / img.height),
      5.0); // Maximaler Zoom 5x

    // Offset anpassen für Mauszentrierung
    offsetX = mouseX - mouseWorldX * newZoom;
    offsetY = mouseY - mouseWorldY * newZoom;
    
    zoom = newZoom;
    constrainOffsets();
    redraw();
  }
}

void mouseDragged() {
  if (showSettings && showExitRoundConfirm == false) {
    checkSliderInteraction();
  } else if (gameStarted && mouseButton == RIGHT && showExitRoundConfirm == false && showSettings == false) {
    // Glattere Bewegung mit delta-Mausposition
    offsetX += (mouseX - pmouseX) * 1.2; // 1.2 für etwas mehr Reaktionsfreude
    offsetY += (mouseY - pmouseY) * 1.2;
    constrainOffsets();
    redraw();
  }
}

void constrainOffsets() {
  float imgW = img.width * zoom;
  float imgH = img.height * zoom;
  
  // Begrenze Offsets, damit Bild nicht über Rand hinausgeht
  offsetX = constrain(offsetX, width - imgW, 0);
  offsetY = constrain(offsetY, height - imgH, 0);
  
  // Falls Bild kleiner als Fenster, zentriere es
  if (imgW < width) offsetX = (width - imgW)/2;
  if (imgH < height) offsetY = (height - imgH)/2;
}
