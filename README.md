# MiniGames — La Aventura de la Biblia

A collection of simple Flash games and interactive experiences that are part of the interactive digital book **"La Aventura de la Biblia"** by *Ediciones Anexa*, which combines 3D animation video sections with interactive games. Built in ActionScript 2 for a kiosk/desktop Flash Player environment, the collection ranges from arcade mini-games (ball rolling/platform phases, catching and shooting games), puzzles and association games ("spot the differences" with error-tracking data files), educational mechanics (connect-the-dots, letter tiles, Simon) to religious exhibition pieces (rosary, liturgy, lectern, kneeler, Cana, Stations-themed scenes...).

- Root `*.swf` files: compiled experiences of the exhibition/book.
- `juegos/`: mini-games with their data files (`diferencias.txt`, `imagen.txt` — FlashVars-style data with images and error coordinates).
- `src/`: source `.fla` documents plus the ActionScript 2 classes (`src/as/`) used by the games.
- `mp3/`: game sounds.
- `videos/`: demo/reference clips (`.wmv`) of the games and animations.

> **This project is shared ONLY for educational purposes. Its use, direct or derived, for professional or economic purposes is not permitted.**

For security reasons, some parts of the project may have been edited or removed. The compiled `piano.exe` projector is kept as-is since it is part of the historical collection.

## Requirements / How to run

- **ActionScript 2** / Flash Player (SWF files run outside the browser or in an `.exe` projector; e.g. Flash Player Projector or a standalone player).
- Rebuild from source: open the `.fla` documents in `src/` in Flash Professional 8 / Adobe Animate. Class sources in `src/as/`.
- Windows-era codecs needed for the `.wmv` clips (Windows Media Video 9).
- `piano.exe` runs standalone on Windows.

## DISCLAIMER

This software is provided without any warranty of any kind, and no liability is accepted for errors or damages resulting from its use.

> **AI training**: the use of the content of this repository (code, assets, documentation) to train or fine-tune machine learning models or AI systems is expressly **not permitted**. All of the repository is licensed under CC-BY-NC-4.0 (see the `LICENSE` file).

---

# MiniGames — La Aventura de la Biblia

Colección de juegos simples en Flash y experiencias interactivas que forman parte del libro digital interactivo **"La Aventura de la Biblia"**, de *Ediciones Anexa*, que combina partes de vídeo de animación 3D con juegos interactivos. Desarrollada en ActionScript 2 para un entorno kiosco/Flash Player de escritorio, la colección va desde mini-juegos arcade (fases tipo bola/plataformas, juegos de atrapar y disparar), puzles y juegos de asociación ("busca las diferencias" con ficheros de datos de errores), mecánicas educativas (unir puntos, fichas de letras, Simon) hasta piezas de exposición religiosa (rosario, liturgia, atril, reclinatorio, Caná, escenas del Via-Crucis…).

- Ficheros `*.swf` raíz: experiencias compiladas de la exposición/el libro.
- `juegos/`: mini-juegos con sus ficheros de datos (`diferencias.txt`, `imagen.txt` — datos al estilo FlashVars con imágenes y coordenadas de errores).
- `src/`: documentos fuente `.fla` más las clases ActionScript 2 (`src/as/`) usadas por los juegos.
- `mp3/`: sonidos de los juegos.
- `videos/`: clips de demo/referencia (`.wmv`) de los juegos y animaciones.

> **Este proyecto se comparte SOLO con valor educativo. No está permitido su uso (directo o derivado) para fines profesionales o económicos.**

Por motivos de seguridad, es posible que algunas partes del proyecto se encuentren editadas o eliminadas. El proyector compilado `piano.exe` se mantiene tal cual por ser parte de la colección histórica.

## Requisitos / Cómo ejecutar

- **ActionScript 2** / Flash Player (los SWF corren fuera del navegador o en un proyector `.exe`; p. ej. Flash Player Projector o un reproductor autónomo).
- Recompilación desde fuente: abrir los `.fla` de `src/` en Flash Professional 8 / Adobe Animate. Clases fuente en `src/as/`.
- Codecs de la era Windows para los clips `.wmv` (Windows Media Video 9).
- `piano.exe` corre de forma autónoma en Windows.

## AVISO

No se presta ningún tipo de garantía ni se acepta responsabilidad alguna por su uso, ante posibles errores o daños que puedan producirse.

> **Entrenamiento de IA**: no se permite expresamente el uso del contenido de este repositorio (código, recursos, documentación) para entrenar o ajustar (*fine-tune*) modelos de aprendizaje automático o sistemas de IA. Todo el repositorio se publica con licencia CC-BY-NC-4.0 (ver el archivo `LICENSE`).
