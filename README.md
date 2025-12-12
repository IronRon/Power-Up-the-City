# Power Up the City – XR Sustainable Energy Experience

**Name:** Ronak Pathak  
**Student Number:** C22309236  
**Class Group:** XR Programming 2025  
**GitHub:** https://github.com/IronRon/Power-Up-the-City  
**Video:** https://www.youtube.com/watch?v=uam2_1z9bk4


---

## Description of the Project

**Power Up the City** is an interactive VR experience built in Godot 4 using the Godot XR Toolkit, designed to teach players about **Sustainable Development Goal 7 — Affordable and Clean Energy**.

The player explores a polluted low-poly city containing several dirty energy sites (coal, oil, gas). By finding and inserting clean energy capsules (wind, solar, hydro), the player:

- ✅ Upgrades each facility
- ✅ Reduces CO₂ emissions
- ✅ Cleans the environment (fog decreases, sky brightens)
- ✅ Causes nature to regrow
- ✅ Improves the city's atmosphere
- ✅ Sees real-time stats on their wrist UI

When all sites are upgraded, the world fully recovers and the player receives a win message and sound.

This project combines VR interaction, visual feedback, environmental changes, spatial audio, animation, and game state logic to give a satisfying sense of progression and environmental restoration.

---

## Instructions for Use

1. Launch the game with a VR-ready headset.
2. Walk around the world to discover clean energy capsules.
3. Approach a capsule's info panel to learn about its energy type.
4. Pick up the capsule using VR grab controls.
5. Bring it to a bad energy site and insert it into the socket.
6. Watch the facility transform into a clean energy model (wind turbine, hydro plant, solar panels).
7. Track progress on your wrist UI:
   - CO₂ saved
   - Number of upgraded sites
8. After upgrading all sites, enjoy a final win effect and a restored clean world.

---

## How It Works

### 1. XR Interaction
- Uses `XRToolsPickable`, `XRToolsSnapZone`, and custom scripts for grabbing and snapping capsules.
- Capsules contain data such as energy type, CO₂ value, and icon.

### 2. Energy Sites
Each bad energy site contains:
- A capsule socket
- A floating info panel
- A polluted factory mesh
- Clean energy replacement models (wind, solar, hydro)
- An animation player (e.g., wind turbines spinning)
- Spatial audio that updates based on the chosen clean energy type

**When a capsule is inserted:**
- The old factory scales down with tweens
- The new clean model scales up smoothly
- The info panel updates with new text, color, and icon
- The spatial audio switches to a relevant looping sound
- A signal is sent to the World Manager

### 3. World Manager
Tracks the number of upgraded sites and:
- Gradually reduces fog thickness
- Lerps fog color toward clear blue sky
- Turns off fog fully at max upgrades
- Grows trees using tweened scaling
- Updates the wrist UI (CO₂ saved, energy sites upgraded)

### 4. Visual Feedback
- Billboard info panels that face the player
- Animated pop-in/pop-out effects using Tween
- Capsule glow effects
- Particle burst when snapping capsules

### 5. Win Condition
When all sites are upgraded:
- Play win sound
- Display centered win message UI
- World environment becomes fully clear

---

## List of Classes/Assets in the Project

| Class / Asset | Source |
|---------------|--------|
| `XRToolsPickable` | XR Toolkit (modified) |
| `XRToolsSnapZone` | XR Toolkit (modified) |
| `energy_capsule.gd` | Self-written |
| `bad_energy_source.gd` | Self-written/AI |
| `goodcapsulespot.gd` | Self-written |
| `capsule_socket.gd` | Self-written/AI |
| `infopanel.gd` | Self-written/AI |
| `world.gd` (World Manager) | Self-written/AI |
| WristUI scenes & scripts | AI |
| Wind Turbine GLTF | Free model – sketchfab |
| Solar Panel GLTF | Free model – sketchfab |
| Hydro Plant GLTF | Free model – sketchfab |
| City assets | Free asset kit kenney.nl |
| Sound effects | Freesound.org (links in references) |

---

## List of Scenes in the Project

| Scene Name                    | Purpose                                                                                                   |
| ----------------------------- | --------------------------------------------------------------------------------------------------------- |
| **Player Scene**              | XR player rig containing camera, controllers, movement, and interaction setup using the Godot XR Toolkit. |
| **World Scene**               | Main game scene that manages the environment, fog, sky, trees, win condition, and overall game state.     |
| **City Mesh Scene**           | Low-poly city environment containing buildings                |
| **Bad Energy Source Scene**   | Represents a dirty energy facility (coal, oil, gas) that can be upgraded using clean energy capsules.     |
| **Good Energy Spot Scene**    | Location where a clean energy model (wind, solar, hydro) appears after upgrading a bad energy source.     |
| **Energy Capsule Scene**      | Pickable VR object representing a clean energy type, containing CO₂ data, icons, and visual effects.      |
| **Capsule Socket Scene**      | Snap socket that accepts energy capsules and triggers the energy upgrade logic.                           |
| **Capsule Snap Zone Scene**   | XR snap zone used to detect and securely place capsules into sockets.                                     |
| **Floating Info Panel Scene** | Billboard UI panel that displays energy information about SDG to the player.                              |
| **Wrist UI Content Scene**    | VR wrist-mounted UI displaying CO₂ saved, upgraded energy sites, and player progress.                     |
| **Win UI Scene**              | Centered UI displayed when all energy sites are upgraded, including win message and sound.                |

---

## References

- **Godot XR Toolkit** - https://github.com/godotvr/godot-xr-tools
- **Wind turbine sound** - Freesound.org
- **Water flow sound** - Freesound.org
- **Electric hum sound** - Freesound.org
- **Low-poly city assets** - https://kenney.nl/
- **Trees / nature assets** - https://kenney.nl/
- **Clean Energy Models** - sketchfab
---

## What I Am Most Proud Of

- 🌍 Building a complete environmental transformation system that reacts to player actions
- 🎮 Creating smooth XR interactions with grabbing, snapping, and animated transitions
- 📚 Implementing clean energy education through panels, visuals, and audio
- ✨ Using tweens, particles, animations, and spatial audio to create immersive feedback
- 🎯 Designing a full gameplay loop that fits SDG 7 and makes learning enjoyable

---

## What I Learned

- How to build VR interactions using the Godot XR Toolkit
- How to structure larger Godot projects with multiple scenes and managers
- How to use Tweens for smooth animations and environmental effects
- How to manage spatial audio, fog, sky systems, and world environment
- How to connect signals across scenes to control game state
- How to design educational but fun gameplay around a real-world SDG
- How to use tool scripts, pickables, snap zones, and subviewports effectively


##Proposal

## ⚡ Power Up the City
### eXtended Reality Prototyping Assignment 2025  
**Quest:SDG – Extended Reality for Sustainable Development**

---

## 🧭 Project Overview

**Type:** Standalone XR Experience

**SDG Focus:** SDG 7 – Affordable and Clean Energy  

**Concept:**  
*Power Up the City* is an interactive XR experience that lets users transform a polluted, fossil-fuel-powered city into a clean, sustainable environment. The user explores a small virtual city where “dirty” energy sources—coal plants, oil generators, diesel units—emit smog and unpleasant sounds. Using hand tracking and spatial awareness, the user locates these sources through their distinct rumbling audio cues.  

Once found, the player picks up and installs renewable replacements such as solar panels, wind turbines, hydro systems, and battery storage. As each swap is completed, the city visually improves: smog clears, trees grow, lights turn on, and real-life energy facts appear in floating 3D panels (e.g., *“Replacing a coal plant with solar saves 2,300 tons of CO₂/year”*).  

The experience encourages players to see the tangible benefits of clean energy, making climate awareness interactive and rewarding.  

---

## 🎯 SDG Alignment

**SDG 7 – Affordable and Clean Energy**  
This project supports SDG 7 by promoting awareness of renewable energy technologies and demonstrating their environmental impact in a visual, hands-on way. The experience reinforces the message that small changes—switching from fossil fuels to clean energy—create large-scale environmental improvement.

---

## 🧩 Key Features and Interactions

- **Hand-tracked Energy Replacement:**  
  Pick up and place clean energy sources using natural hand movements.  
- **Spatial Audio Cues:**  
  Listen for rumbling, buzzing, or coughing sounds to locate dirty energy sources.  
- **Environmental Transformation:**  
  City visuals shift from smoggy to vibrant as clean energy is installed.  
- **3D Stat Panels:**  
  Floating text appears to show real-life clean energy facts after each replacement.  
- **Gamified Feedback:**  
  A “City Health” bar fills as more clean energy sources are placed.  

---

## 🧠 XR Technologies Used

- **Hand Tracking:** For grabbing, carrying, and placing energy modules.  
- **Spatial Audio:** For locating dirty sources and hearing environmental improvement.  
- **3D UI Panels:** For displaying clean energy facts and feedback.  
- **Particle and Shader Effects:** For visual changes (smog clearing, trees growing).  
- **Physics Interactions:** For realistic object placement and motion.  

---

## 🏙️ Sketches and Diagrams


### 1. Main User Interface  
_Visual showing the City Health bar, floating stat panels, and object interaction hints._

![UI Sketch Placeholder](sketches/ui_sketch.png)

---

### 2. Key Interactions  
_Illustration of hand-tracked swapping: picking up a clean energy source and replacing a dirty one._

![Interaction Sketch Placeholder](sketches/interaction_sketch.png)

---

### 3. Spatial Layout / Environment  
_Top-down or perspective layout of the small city scene, showing positions of energy sources and interaction zones._

![Layout Sketch Placeholder](sketches/layout_sketch.png)

---
