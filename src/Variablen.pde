import ddf.minim.*;
import java.util.Collections;

Minim minim;
AudioPlayer player;

// Slider-Variablen
float sliderX, sliderY, sliderWidth, sliderHeight; // Werte werden in setup() gesetzt
float sliderValue = 100.0; // Startwert (100%)
boolean sliderActive = false; // Wird der Slider gerade gezogen?
int sliderColor = color(150, 100, 255); // Farbe des Slider-Knopfs

// Lautstärke-Label
String volumeText = "Volume: 100%";

boolean isMuted = false;
float lastVolume = 50; // Speichert Lautstärke vor Mute

ArrayList<Integer> numbers = new ArrayList<>();

String startURL = "../assets/screens/Start Screen.jpg"; // Start Screen
PImage startScreen;

String worldUrl = "../assets/screens/Weltkarte.jpg"; // Weltkarte
PImage worldImage;

String settingsURL = "../assets/screens/Settings.png"; // Setting Button
PImage settingsImage;

String kreuzImageURL = "../assets/screens/kreuz.png"; // Zurück Pfeil
PImage kreuzImage;

String backArrowURL = "../assets/screens/Zurückpfeil.png"; // Zurück Pfeil
PImage backArrow;

PImage[] images = new PImage[43];  // Array für Bilder
String[] imageUrls = new String[43];  // Array für Bild-URLs

int currentImage;  // Variable, um das aktuell angezeigte Bild zu verfolgen
PImage img; // Variable um das aktuelle Bild anzuzeigen

// Button-Parameter für "Guess" und "Zurück"
int startButtonX = 20;
int startButtonY = 1010;
int startButtonWidth = 1880;
int startButtonHeight = 50;

// Button-Parameter für "Guess" und "Zurück"
int guessButtonX = 20;
int guessButtonY = 1010;
int guessButtonWidth = 1880;
int guessButtonHeight = 50;

// Button-Parameter für "Bestätigen"
int confirmguessButtonX = 20;  // 20px rechts vom ersten Button
int confirmguessButtonY = 1010;
int confirmguessButtonWidth = 1650;
int confirmguessButtonHeight = 50;

// Button-Parameter für "Neu starten"
int restartguessButtonX = 20;
int restartguessButtonY = 1010;
int restartguessButtonWidth = 1880;
int restartguessButtonHeight = 50;

// Position & Größe des Settings-Buttons
int settingsButtonX = 1830;
int settingsButtonY = 20;
int settingsButtonWidth = 70;
int settingsButtonHeight = 70;

// Position & Größe des Exit-Buttons
int exitButtonX = 20;
int exitButtonY = 20;
int exitButtonWidth = 100;
int exitButtonHeight = 40;

// Position & Größe des Credits-Buttons
int creditsButtonX = width +760;
int creditsButtonY = 720;
int creditsButtonWidth = 200;
int creditsButtonHeight = 40;

int settingsCloseButtonX = 1405;
int settingsCloseButtonY = 250;
int settingsCloseButtonWidth = 30;
int settingsCloseButtonHeight = 30;

// Positionen (in setup() anpassen)
int musicButtonX = width +760;  // Position im Settings-Menü
int musicButtonY = 450;
int musicButtonWidth = 200;
int musicButtonHeight = 40;

// Back-Pfeil Position
int backArrowX = 485;
int backArrowY = 255;
int backArrowWidth = 30;
int backArrowHeight = 30;

boolean gameStarted = false; // Flag für den Start Screen
boolean isSubmit = false; // Flag für den Submit-Button
boolean isGuessed = false; // Flag für den Guess-Button
boolean pointSet = false; // Flag für den gesetzten punkt
boolean showSettings = false; // Flag für das Einstellungsmenü
boolean showCredits = false; // Flag für das Credits-Menü

// Vorab definierte Pixelkoordinaten für Zielorte
PVector[] targetLocations = new PVector[43];
PVector point = null;  // Speichert den gesetzten Punkt auf der Weltkarte

int score = -1;  // Die Punktzahl des Spielers
int highscore = 0;

// Fügen Sie diese Variablen zu den bestehenden hinzu
String[] musicFiles = {
    "../assets/music/Alone.mp3", 
    "../assets/music/Vlog Music.mp3", 
    "../assets/music/Tell me the Truth.mp3", 
    "../assets/music/Stylish deep Electronic.mp3", 
    "../assets/music/Spinning Head.mp3", 
    "../assets/music/Soulsweeper.mp3", 
    "../assets/music/Showreel Music.mp3", 
    "../assets/music/Lost in Dreams.mp3", 
    "../assets/music/Creative Technology Showreel.mp3", 
    "../assets/music/Tokyo Drift.mp3"}; // Fügen Sie Ihre Musikdateien hinzu
int currentTrackIndex = 0;
boolean showMusicMenu = false;

// Variablen für Zoom und Pan (nur für das Bild)
float zoom = 1.0;
float offsetX = 0;
float offsetY = 0;

// Sprachsteuerung
boolean isEnglish = true; // Standard: Englisch
String[] languages = {"DE", "EN"}; // Angezeigte Sprachcodes

// Button-Position (im Settings-Menü)
int langButtonX = width +760;
int langButtonY = 540; // Unterhalb des Volume-Sliders
int langButtonWidth = 200;
int langButtonHeight = 40;

boolean showControlsMenu = false;
int controlsButtonX = width +760;  // Position neben Music-Button
int controlsButtonY = 630;
int controlsButtonWidth = 200;
int controlsButtonHeight = 40;

// Back-Button Variablen (neben den anderen Button-Variablen)
int backButtonX = 1690;
int backButtonY = 1010; // Unter dem Exit-Button
int backButtonWidth = 210;
int backButtonHeight = 50;

color dashedLineColor = color(255, 0, 0); // Rot
float dashedLineStroke = 2; // Basis-Strichstärke

float creditsY = 1120; // Startposition unterhalb des Bildschirms
float scrollSpeed = 1.5; // Scroll-Geschwindigkeit
float maskHeight = 50; // Höhe des unsichtbaren Bereichs am unteren Rand

// Exit confirmation variables
boolean showExitConfirm = false;
int exitConfirmX, exitConfirmY, exitConfirmWidth, exitConfirmHeight;
int exitYesButtonX, exitYesButtonY, exitYesButtonWidth, exitYesButtonHeight;
int exitNoButtonX, exitNoButtonY, exitNoButtonWidth, exitNoButtonHeight;

// Exit confirmation variables
boolean showExitRoundConfirm = false;
int exitRoundConfirmX, exitRoundConfirmY, exitRoundConfirmWidth, exitRoundConfirmHeight;
int exitRoundYesButtonX, exitRoundYesButtonY, exitRoundYesButtonWidth, exitRoundYesButtonHeight;
int exitRoundNoButtonX, exitRoundNoButtonY, exitRoundNoButtonWidth, exitRoundNoButtonHeight;

boolean showResolutionWarning = true; // Zeigt die Warnmeldung an, wenn true
