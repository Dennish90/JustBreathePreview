[ENG](#just-breathe--showcase-eng) | [SV](#just-breathe--showcase-sv)

# Just Breathe – Showcase (ENG)

> A custom breathing exercise app built from scratch using Flutter

---

## Why I'm building this

I was curious to dive deeper into frontend development and understand how to build an actual app from the ground up.
As someone focused on becoming better at fullstack development, I wanted to explore the mobile side of things. Including animations, audio handling, state management, and responsive UI.

But more than that, I was tired of switching between multiple apps just to get the breathing exercises I wanted.  
Most existing apps are too rigid. They don't let you **tweak the flow**, **adjust the rhythm**, or **finetune the transitions**.  
We're all different. We have different lungs, different needs, and different definitions of calm.  
So I started developing **Just Breathe** to solve that for myself.

---

## Demo clip

![Breathing Demo](media/app_demo.gif)

---

## Customize Everything

Choose from built-in breathing modes or create your own:
- Set inhale/hold/exhale durations
- Define number of reps and optional breath retention
- Enable background music
- Turn on guided voice cues or minute markers

### Menus & Setup

<p align="center">
  <img src="media/exercise_menu.png" width="240" />
  <img src="media/exercise_setup.png" width="240" />
</p>

On the left: the **Exercise Menu**, where all breathing exercises are listed.  
Each one is loaded into the animation and previews its flow visually.

On the right: the **Exercise Setup**, where users can toggle background sound,  
guided breathing voice cues, start countdown, and more.

---

##  Under the Hood

Here's a basic example of how the app determines which breathing audio cue to play during a session:

```dart
  // Returns the duration (in seconds) for the current breathing phase, 
  // based on the selected exercise settings.
  double _getDurationForPhase(BreathingPhase phase) {
    final ex = widget.exercise;
    switch (phase) {
      case BreathingPhase.inhale:
        return ex.secIn;
      case BreathingPhase.holdIn:
        return ex.secInHold;
      case BreathingPhase.exhale:
        return ex.secOut;
      case BreathingPhase.holdOut:
        return ex.secOutHold;
    }
  }

// Plays a guided audio cue for the given phase,
// choosing the closest available audio file that does not exceed the desired duration.
// File names follow the pattern: sounds/inhale_3_5s.mp3 (i.e. 3.5 seconds)

Future<void> _playGuidedSound(String phaseName, double seconds) async {
  if (!ExerciseSetupManager.isGuidedEnabled) return;

  // All available durations in 0.5s steps
  final durations = List.generate(16, (i) => 0.5 + i * 0.5); // [0.5, 1.0, ..., 8.0]

  // Find the closest duration less than or equal to the requested length
  final suitable = durations.where((d) => d <= seconds).toList();
  final selected = suitable.isNotEmpty ? suitable.last : durations.first;

  final durationLabel = selected.toStringAsFixed(1).replaceAll('.', '_');
  final soundPath = 'sounds/${phaseName}_${durationLabel}s.mp3';

  try {
    await breathAudioPlayer.play(
      AssetSource(soundPath),
      volume: ExerciseSetupManager.guidedVolume,
    );
  } catch (e) {
    debugPrint('Failed to play guided sound: $e');
  }
}
```
---

## Music

The current background music was generated using **Suno** during a paid subscription —  
but future ambient soundscapes (like forest sounds and meditative loops) will be recorded and crafted by me.

▶️ [Listen to a short song demo](https://www.dropbox.com/scl/fi/vv7khpsgdc3gjlvpsnxso/sacred_rhythms_preview.mp3?rlkey=5nynnhx32vhz6lwfmt6ndunzo&st=37ymugq2&raw=1)

## Roadmap & Progress

A quick overview of what’s been built and what’s coming.  
This app isn't just functional – it’s designed with flexibility, modularity and user individuality in mind.

---

### Core Features (Completed)

- [x] **Breathing Animation Circle**  
  Smooth and scalable animation — works in both small and fullscreen formats.
  
- [x] **Built-in Breathing Exercises**  
  Exercises defined as data, not hardcoded. Easy to extend and modify.

- [x] **Dynamic Sound Matching**  
  Guided sounds auto-match phase durations (2–8s) and adjust volume accordingly.

- [x] **Toggleable Features in Setup**  
  - Enable/disable music
  - Guided breathing voice cues
  - Minute markers
  - Retention timers

- [x] **Reusable Settings Components**  
  Sliders, toggles and selectors built for modular use in both preset and future custom flows.

---

### In Progress / Coming Soon

- [ ] **Custom-Made Exercise Builder**  
  Create your own breathing routines. UI is next – backend already supports it.

- [ ] **Loop Options & Repetition Feedback**  
  Show users their progress in real time (e.g. breaths left, animations synced to reps).

- [ ] **Meditation Music Creation & Mastering**  
  Produce additional background tracks tailored for specific moods and flows.
  Polish sound quality with proper mixing and mastering for a smooth audio experience.

- [ ] **Visuals & Theming** 
  Customizable themes & color modes (not just dark mode)

- [ ] **Stats & History Tracking**  
  Log your sessions, time spent, and improvements over time.

---

> All of this is being built modularly. The goal isn’t just “another breathing app” — it’s a flexible breathing platform where the user is in control.

---

# Just Breathe – Showcase (SV)

> En skräddarsydd app för andningsövningar, byggd från grunden i Flutter

---

## Varför jag bygger det här

Jag ville fördjupa mig inom frontendutveckling och förstå hur man bygger en faktisk app från grunden.  
Eftersom jag strävar efter att bli bättre på fullstack ville jag även utforska mobila gränssnitt – inklusive animationer, ljudhantering, tillståndshantering och responsiv UI.

Men ännu viktigare: jag tröttnade på att behöva växla mellan flera appar för att få till de andningsövningar jag ville ha.  
De flesta befintliga appar är för stela. De låter dig inte **justera flödet**, **anpassa rytmen** eller **fintrimma övergångarna**.  
Vi är alla olika. Vi har olika lungor, olika behov och olika definitioner av lugn.  
Så jag började utveckla **Just Breathe** för att lösa det – först och främst för mig själv.

---

## Demoklipp

![Andningsdemo](media/app_demo.gif)

---

## Anpassa Allt

Välj bland förinställda andningslägen eller skapa egna:
- Sätt inandnings-, håll- och utandningstider
- Definiera antal repetitioner och valfri andningsretention
- Aktivera bakgrundsmusik
- Slå på guidande ljud eller minutmarkörer

### Menyer & Inställningar

<p align="center">
  <img src="media/exercise_menu.png" width="240" />
  <img src="media/exercise_setup.png" width="240" />
</p>

Till vänster: **Övningsmenyn**, där alla andningsövningar listas.  
Varje övning laddas in i animationen och förhandsvisar sitt flöde visuellt.

Till höger: **Övningsinställningar**, där användaren kan slå på eller av bakgrundsljud,  
guidad andning, nedräkning innan start med mera.

---

## Under Huven

Här är ett exempel på hur appen bestämmer vilket andningsljud som ska spelas under en session:

```dart
  // Returns the duration (in seconds) for the current breathing phase, 
  // based on the selected exercise settings.
  double _getDurationForPhase(BreathingPhase phase) {
    final ex = widget.exercise;
    switch (phase) {
      case BreathingPhase.inhale:
        return ex.secIn;
      case BreathingPhase.holdIn:
        return ex.secInHold;
      case BreathingPhase.exhale:
        return ex.secOut;
      case BreathingPhase.holdOut:
        return ex.secOutHold;
    }
  }

// Plays a guided audio cue for the given phase,
// choosing the closest available audio file that does not exceed the desired duration.
// File names follow the pattern: sounds/inhale_3_5s.mp3 (i.e. 3.5 seconds)

Future<void> _playGuidedSound(String phaseName, double seconds) async {
  if (!ExerciseSetupManager.isGuidedEnabled) return;

  // All available durations in 0.5s steps
  final durations = List.generate(16, (i) => 0.5 + i * 0.5); // [0.5, 1.0, ..., 8.0]

  // Find the closest duration less than or equal to the requested length
  final suitable = durations.where((d) => d <= seconds).toList();
  final selected = suitable.isNotEmpty ? suitable.last : durations.first;

  final durationLabel = selected.toStringAsFixed(1).replaceAll('.', '_');
  final soundPath = 'sounds/${phaseName}_${durationLabel}s.mp3';

  try {
    await breathAudioPlayer.play(
      AssetSource(soundPath),
      volume: ExerciseSetupManager.guidedVolume,
    );
  } catch (e) {
    debugPrint('Failed to play guided sound: $e');
  }
}
```

## Musik

Den nuvarande bakgrundsmusiken genererades med **Suno** under ett aktivt abonnemang —  
men framtida ljudlandskap (t.ex. skogsljud och meditativa loopar) kommer att spelas in och produceras av mig själv.

▶️ [Lyssna på en kort låt-demo](https://www.dropbox.com/scl/fi/vv7khpsgdc3gjlvpsnxso/sacred_rhythms_preview.mp3?rlkey=5nynnhx32vhz6lwfmt6ndunzo&st=37ymugq2&raw=1)

---

## Plan & Framsteg

En snabb översikt över vad som redan är byggt och vad som är på gång.
Appen är inte bara funktionell, den är designad för flexibilitet, modularitet och för att kunna anpassas efter individens behov.

---

### Färdiga funktioner

- [x] **Animerad andningscirkel**  
  Mjuk och skalbar animation – fungerar både i små och helskärmsformat.

- [x] **Förinstallerade andningsövningar**  
  Övningar definieras som data (inte hårdkodat). Lätt att lägga till och justera.

- [x] **Dynamisk ljudmatchning**  
  Guidad andning anpassar sig automatiskt efter fasens längd (2–8 sek) och justerar volymen.

- [x] **Inställningsbara funktioner i setup-menyn**  
  - Slå på/av musik  
  - Aktivera röststyrd guidning  
  - Minutmarkörer  
  - Andningsretention

- [x] **Återanvändbara komponenter**  
  Sliders, växlare och valmenyer som fungerar för både fasta övningar och framtida anpassade rutiner.

---

### Pågående / Kommande funktioner

- [ ] **Egen övningsbyggare**  
  Möjlighet att skapa egna andningssekvenser. Backend är redan klart – UI kommer härnäst.

- [ ] **Loop-inställningar & visuell feedback**  
  Visa antal andetag kvar, repetitioner i realtid och synkad animation.

- [ ] **Egen musikproduktion & mastering**  
  Skapa fler bakgrundsspår för olika stämningar och känslolägen.  
  Polera ljudkvalitet med mixning och mastering.

- [ ] **Teman & visuella inställningar**  
  Fler färglägen än bara mörkt. Möjlighet att välja tema utifrån smak och tillfälle.

- [ ] **Statistik & historik**  
  Logga dina sessioner, total tid och framsteg över tid.

---

> Allt byggs modulärt. Målet är inte bara “ännu en andningsapp”, utan en flexibel andningsplattform där användaren har full kontroll.
