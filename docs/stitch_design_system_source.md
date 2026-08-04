---
name: Iqra Design System
colors:
  surface: '#f9f9ff'
  surface-dim: '#cfdaf2'
  surface-bright: '#f9f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f0f3ff'
  surface-container: '#e7eeff'
  surface-container-high: '#dee8ff'
  surface-container-highest: '#d8e3fb'
  on-surface: '#111c2d'
  on-surface-variant: '#434654'
  inverse-surface: '#263143'
  inverse-on-surface: '#ecf1ff'
  outline: '#737686'
  outline-variant: '#c3c5d7'
  surface-tint: '#1353d8'
  primary: '#003fb1'
  on-primary: '#ffffff'
  primary-container: '#1a56db'
  on-primary-container: '#d4dcff'
  inverse-primary: '#b5c4ff'
  secondary: '#855316'
  on-secondary: '#ffffff'
  secondary-container: '#ffbc76'
  on-secondary-container: '#79490b'
  tertiary: '#004a87'
  on-tertiary: '#ffffff'
  tertiary-container: '#0062b0'
  on-tertiary-container: '#cadeff'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#dbe1ff'
  primary-fixed-dim: '#b5c4ff'
  on-primary-fixed: '#00174d'
  on-primary-fixed-variant: '#003dab'
  secondary-fixed: '#ffdcbd'
  secondary-fixed-dim: '#fcb973'
  on-secondary-fixed: '#2c1600'
  on-secondary-fixed-variant: '#683c00'
  tertiary-fixed: '#d4e3ff'
  tertiary-fixed-dim: '#a4c9ff'
  on-tertiary-fixed: '#001c39'
  on-tertiary-fixed-variant: '#004883'
  background: '#f9f9ff'
  on-background: '#111c2d'
  surface-variant: '#d8e3fb'
typography:
  display-reading:
    fontFamily: Be Vietnam Pro
    fontSize: 48px
    fontWeight: '700'
    lineHeight: 60px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Be Vietnam Pro
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
  headline-lg-mobile:
    fontFamily: Be Vietnam Pro
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 36px
  body-xl:
    fontFamily: Be Vietnam Pro
    fontSize: 24px
    fontWeight: '400'
    lineHeight: 36px
  body-lg:
    fontFamily: Be Vietnam Pro
    fontSize: 20px
    fontWeight: '400'
    lineHeight: 30px
  label-bold:
    fontFamily: Be Vietnam Pro
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
    letterSpacing: 0.01em
rounded:
  sm: 0.5rem
  DEFAULT: 1rem
  md: 1.5rem
  lg: 2rem
  xl: 3rem
  full: 9999px
spacing:
  touch-target-min: 64px
  gutter-md: 24px
  margin-mobile: 20px
  stack-lg: 40px
  stack-sm: 12px
---

## Brand & Style

The design system is centered on the concept of **Empowered Literacy**. It bridges the gap between high-end digital aesthetics and extreme accessibility. The brand personality is human, nurturing, and deeply trustworthy, designed to lower the anxiety often associated with reading difficulties.

The visual style is a fusion of **Tactile Minimalism** and **Glassmorphism**. By using soft 3D depths—inspired by the reference logo—the UI provides intuitive physical affordances. We utilize "squishy" tactile elements that respond to touch, reinforcing the "Independent Reading" core value through immediate sensory feedback. The 2026 aesthetic is achieved through ultra-smooth gradients, high-definition micro-shadows, and a focus on clarity over complexity.

**Key Brand Attributes:**
- **Human Centric:** Warmth conveyed through soft curves and organic motions.
- **Cognitive Clarity:** Reduction of visual noise to focus on a single primary action at a time.
- **Premium Utility:** A sophisticated look that treats accessibility as a luxury feature rather than a compromise.

## Colors

This color palette prioritizes **AA/AAA accessibility standards** while maintaining a premium feel. The "Reading Blue" serves as the anchor, providing a sense of calm and institutional trust.

- **Primary Blue (#1A56DB):** Used for critical actions and brand presence. It is deep enough to ensure text legibility on light backgrounds.
- **Secondary Warmth (#FDBA74):** A soft, sunset orange used sparingly for "Human" moments, like the hand in the logo, providing a warm focal point.
- **Soft Whites & Neutrals:** We avoid pure white (#FFFFFF) for backgrounds to reduce eye strain, opting for a very soft, warm grey-blue (#F8FAFC).
- **Voice Blue (#60A5FA):** A vibrant, lighter blue dedicated to audio-visual feedback and speech-to-text interactions.

**Contrast Strategy:** High-contrast tokens are applied to all text-on-surface combinations to ensure users with low vision can navigate without friction.

## Typography

Typography is the interface. For a low-literacy audience, we utilize **Be Vietnam Pro** for its contemporary, open apertures and exceptional legibility in both Latin and companion Arabic scripts.

**Guiding Principles:**
- **Oversized Scale:** Our "Body" size (24px) is what most systems consider a headline. This ensures effortless reading.
- **Generous Leading:** Line heights are set at 150% for body text to prevent "line-skipping" during reading.
- **Arabic First:** The system ensures that Arabic glyphs are rendered with proper height and weight to match the Latin counterparts, avoiding the common issue of Arabic appearing too small at identical point sizes.
- **No Small Caps:** We avoid condensed or all-caps styling which can be difficult for dyslexic or low-literacy users to decode.

## Layout & Spacing

The layout philosophy follows a **Safe-Zone Grid**. Since the target audience may have motor-skill challenges or use oversized touch gestures, we enforce a strict **64px minimum touch target** (well above the standard 44px).

- **Fluid Mobile Model:** A single-column layout is preferred to minimize cognitive load. Content "stacks" vertically with generous white space (40px+) between logical sections.
- **Horizontal Breath:** 20px side margins ensure that the user’s thumb does not accidentally trigger edges while holding the device.
- **Rhythm:** We use an 8px base unit, but most spacing tokens are multiples of 16px or 24px to maintain an "airy" and uncrowded interface.

## Elevation & Depth

This design system uses **Tactile Layering** to communicate hierarchy. Instead of traditional flat shadows, we use:

1.  **Soft Inner Glows:** To make buttons look like they are physically "raised" from the surface, similar to the 3D document in the logo.
2.  **Ambient Occlusion Shadows:** Very soft, large-radius shadows (Blur: 40px, Opacity: 8%) that make cards appear to float in a real 3D space.
3.  **Depth Displacement:** Active states do not just change color; they "press down" (scale 0.98x) to provide a physical metaphor for a button press.
4.  **Backdrop Blurs:** Used on navigation overlays to maintain context of the page behind, reducing the "disorientation" of screen transitions.

## Shapes

The shape language is **Ultra-Rounded**. Inspired by the logo's speech bubble and rounded document corners, we use a minimum corner radius of 24px (`rounded-xl`).

- **Rounded-XL (24px - 32px):** Default for cards, input fields, and main containers.
- **Pill (Full Round):** Used for the core Floating Action Button and all chips/tags.
- **Continuity:** Avoid mixing sharp corners with rounded ones. Every edge in the system must feel soft to the touch, reinforcing the "warm and friendly" brand narrative.

## Components

### The "Pulse" Floating Button (Heart of the Experience)
The primary action is a pill-shaped, oversized floating button at the bottom center. It uses a soft gradient (Primary Blue to Tertiary Blue) and features a subtle "pulse" animation when the app is waiting for user input.

### Voice-Feedback Visuals
When the app speaks or listens, a **Waveform Component** appears. It uses translucent "Glassmorphic" layers of Voice Blue that ripple in sync with the audio frequency. This provides a non-textual cue that the app is "active."

### Input Fields
Inputs are tall (72px+) with 24px internal padding. They use a "Warm White" background and a thick 2px border on focus to ensure the user knows exactly where they are typing.

### Interaction Cards
Cards use a high-contrast treatment: dark text on very light surfaces. They do not use borders; instead, they rely on the Ambient Occlusion shadows defined in the Elevation section to separate themselves from the background.

### Oversized Lists
List items feature 16px of vertical padding and 24px leading icons. Every list item acts as a giant button, ensuring high accuracy for users with limited motor precision.