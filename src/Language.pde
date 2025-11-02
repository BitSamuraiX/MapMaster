String getText(String key) {
    if (isEnglish) {
        switch(key) {
            case "start": return "Start";
            case "guess": return "Guess";
            case "submit": return "Submit";
            case "restart": return "Restart";
            case "exit": return "Exit";
            case "volume": return "Volume: ";
            case "music_selection": return "Music Selection";
            case "settings": return "Settings";
            case "credits_button": return "Credits";
            case "controls": return "Controls";
            case "controls_title": return "Game Controls";
            case "controls_mute": return "Mute Music";
            case "controls_click": return "Set Point on Map";
            case "controls_zoom": return "Zoom in/out";
            case "controls_drag": return "Drag map";
            case "left": return "Left Mouse Click";
            case "right": return "Right Mouse Click";
            case "wheel": return "Mousewheel";
            case "controls_languageD": return "Change Language to German";
            case "controls_languageE": return "Change Language to English";
            case "LEFT": return "Arrow Key Left";
            case "RIGHT": return "Arrow Key Right";
            case "prev_track": return "Previous Track";
            case "next_track": return "Next Track";
            case "language": return "Language";
            case "music": return "Music";
            case "back": return "Back";
            case "exit_confirm": return "Really quit the game?";
            case "yes": return "Quit Game";
            case "no": return "Cancel";
            case "exit_round_confirm": return "Really quit the Round?";
            case "yes2": return "Back to Main Menu";
            case "no2": return "Cancel";
            case "click": return "Click to Close";
            case "credits": return "Development Team\n\n" + 
                                   " - Game Design: Mihnea Mates, Emil Schubert and Jonas Schumann\n" +
                                   " - Programming: Mihnea Mates, Emil Schubert and Jonas Schumann\n" + 
                                   " - Pictures: Google Street View © 2025 (Don't worry, we have the rights)\n" +
                                   " - Music: Alone by BoDleasons\n" + 
                                   "                  Volg Music by MFCC\n" +
                                   "                  Spinning Head by Gvidon\n" +
                                   "                  Lost in Dreams by Kulakovka\n" +
                                   "                  Stylish Deep Electronic by RoyaltyFreeMusic\n" +
                                   "                  Showreel Music by MFCC\n" +
                                   "                  Tell Me The Truth by Denys_Brodovskyi\n" +
                                   "                  Soulsweeper by ItsWatR\n" +
                                   "                  Creative Technology Showreel by Pumpupthemind\n" +
                                   "                  Tokyo Drift by Teriyaki Boyz\n\n\n" +
                                   "Externel Resources\n\n" +
                                   " - Minim-Library for Audio (Processing)\n" +
                                   " - Standard Java Library (Processing)\n\n\n" +
                                   "Special Thanks\n\n" +
                                   " - To all testers!!!\n" + 
                                   " - Herr Steuer\n" +
                                   " - ChatGPT, who took over the basic program\n" +
                                   " - DeepSeek, who helped us by bugs and other things\n" +
                                   "No © 2025";
            default: return key;
        }
    } else {
        switch(key) {
            case "start": return "Start";
            case "guess": return "Raten";
            case "submit": return "Bestätigen";
            case "restart": return "Neustart";
            case "exit": return "Beenden";
            case "volume": return "Lautstärke: ";
            case "music_selection": return "Musikauswahl";
            case "settings": return "Einstellungen";
            case "credits_button": return "Credits";
            case "controls": return "Steuerung";
            case "controls_title": return "Spielsteuerung";
            case "controls_mute": return "Stummschalten";
            case "controls_click": return "Punkt setzen";
            case "controls_zoom": return "Vergrößern/Verkleinern";
            case "controls_drag": return "Karte verschieben";
            case "left": return "Maus Click links";
            case "right": return "Maus Click rechts";
            case "wheel": return "Mausrad";
            case "controls_languageD": return "Ändere Sprache zu Deutsch";
            case "controls_languageE": return "Ändere Sprache zu Englisch";
            case "LEFT": return "Linke Pfeiltaste";
            case "RIGHT": return "Rechte Pfeiltaste";
            case "prev_track": return "Vorheriger Song";
            case "next_track": return "Nächster Song";
            case "language": return "Sprache";
            case "music": return "Musik";
            case "back": return "Zurück";
            case "exit_confirm": return "Spiel wirklich beenden?";
            case "yes": return "Spiel Verlassen";
            case "no": return "Abbrechen";
            case "exit_round_confirm": return "Runde wirklich beenden?";
            case "yes2": return "Zurück zum Start Menü";
            case "no2": return "Abbrechen";
            case "click": return "Klicken zum Schließen";
            case "credits": return "Entwicklungsteam\n\n" + 
                                   " - Game Design: Mihnea Mates, Emil Schubert und Jonas Schumann\n" +
                                   " - Programmierung: Mihnea Mates, Emil Schubert und Jonas Schumann\n" + 
                                   " - Grafiken: Google Street View © 2025 (Wir haben Rechte keine Sorge)\n" +
                                   " - Musik: Alone von BoDleasons\n" + 
                                   "                  Volg Music von MFCC\n" +
                                   "                  Spinning Head von Gvidon\n" +
                                   "                  Lost in Dreams von Kulakovka\n" +
                                   "                  Stylish Deep Electronic von RoyaltyFreeMusic\n" +
                                   "                  Showreel Music von MFCC\n" +
                                   "                  Tell Me The Truth von Denys_Brodovskyi\n" +
                                   "                  Soulsweeper von ItsWatR\n" +
                                   "                  Creative Technology Showreel von Pumpupthemind\n" +
                                   "                  Tokyo Drift von Teriyaki Boyz\n\n\n" +
                                   "Externe Ressourcen\n\n" +
                                   " - Minim-Bibliothek für Audio (Processing)\n" +
                                   " - Standart Java Erweiterungen (Processing)\n\n\n" +
                                   "Besonderer Dank\n\n" +
                                   " - An alle Tester!!!\n" + 
                                   " - Herr Steuer\n" +
                                   " - ChatGPT, der uns das Grundgerüst abgenommen hat\n" +
                                   " - DeepSeek, der uns bei Bugs und anderen Sachen geholfen hat\n" +
                                   "Nicht © 2025";
            default: return key;
        }
    }
}
