# Reference Anchors (iOS / SwiftUI)

These are the **only** acceptable starting points for aesthetic decisions. Show this file to the user (one-line summary per anchor) during Step 1 intake. The user picks 1–3. If 2–3, the user designates which anchor contributes type, color, and motion separately.

**Hard rule:** every value the user sees in `Theme/Tokens.swift` must trace to the recipe of an anchor below. Mixing values from different anchors without an explicit blend rule is forbidden.

**Native ranking on iOS:** Apple Music / Podcasts and Arc/Raycast/Things 3 are the most native iOS feels. Linear, Stripe, Notion, Editorial, Brutalist all work but require deliberate justification on a touch device. Material You is a deliberate cross-platform choice (Android-influenced) — only pick it if the user wants a multi-platform brand identity.

---

## 1. Linear / Vercel / Geist
**One-line:** Tools-for-hackers. Monochrome stone, sharp edges, instant motion, keyboard-first. Rare on iOS — use only for developer-tool apps.

**Type:**
- Display: `.system(size: 32, weight: .semibold, design: .default)` (SF Pro Display fallback). Tracking `-0.02`. Line-height tight.
- Body: `.system(.body, design: .default)` weight `.regular`.
- Mono: `.system(.body, design: .monospaced)` for code surfaces.
- Scale (pt): 12, 13, 14, 16, 18, 20, 24, 32. Body default: 14pt (call out: under HIG minimum body 17pt — only acceptable for power-user developer apps).

**Color:** Stone neutrals — light: `Color(white: 0.98)` background, `Color(white: 0.10)` text via assets. One accent: pure black on light, pure white on dark. Semantic: red/emerald/amber at 600-equivalent. NO secondary accent. NO gradient.

**Radius:** 6pt (sm), 8pt (md), 10pt (lg). Buttons never above 8pt.

**Shadow:** none. Elevation = 1pt hairline border in `Theme.Color.borderSubtle`.

**Spacing:** 4, 8, 12, 16, 20, 24, 32, 40, 48, 64. Component padding 12pt default, 16pt on touch surfaces.

**Motion:**
- Duration: `Motion.fast = 0.06`, `Motion.base = 0.12`, `Motion.slow = 0.18`.
- Easing: `.easeOut` for hover-equivalent, `.easeInOut` for layout. NO springs.

**Don't pair with:** soft pastels, glass, large radii, drop shadows.

---

## 2. Stripe / Plaid
**One-line:** Financial-grade trust. Calm indigo, restrained color, generous reading whitespace. Works well for fintech and admin tools on iPad.

**Type:**
- Display: `.system(size: 32, weight: .medium, design: .default)`. Tracking `-0.01`.
- Body: `.system(.body)` `.regular`. Line-height generous.
- Scale (pt): 14, 16, 17, 20, 24, 32, 40, 56. Body default: 17pt.

**Color:** Slate neutrals via asset catalog. Primary accent: indigo (~#635BFF, declared in `Accent` color asset with dark variant). Sober single-stop gradient in hero only (indigo→deep indigo). Semantic: red, emerald, amber.

**Radius:** 4pt (sm), 8pt (md), 12pt (lg).

**Shadow:** Subtle, layered: `Theme.Shadow.sm` (`y: 1, blur: 2, opacity: 0.06`), `md` (`y: 4, blur: 12, opacity: 0.08`), `lg` (`y: 16, blur: 40, opacity: 0.12`). Always paired with hairline border.

**Spacing:** 4, 8, 12, 16, 24, 32, 48, 64, 96.

**Motion:** `Motion.base = 0.15`, `Motion.slow = 0.25`. Easing `.easeInOut`. One single fade-in for above-fold.

**Don't pair with:** brutalist, neon, decorative serifs, glass on cards.

---

## 3. Notion / Craft
**One-line:** Document-feel productivity. Warm neutrals, optional serif accents, generous reading column. Strong fit for reader/writer apps on iPad.

**Type:**
- Display: serif via custom font (e.g. Lyon, Tiempos) — declare system fallback `.system(.title, design: .serif)`.
- Body: `.system(.body)` weight `.regular`.
- Scale (pt): 14, 16, 17, 21, 28, 36, 48. Body default: 17pt. Reading column max 680pt.

**Color:** Warm stone (NOT cool slate). Background `Color("Background")` warm-cream in light, near-black in dark. Single brand hue at link/highlight role; default amber.

**Radius:** 4pt (sm), 6pt (md), 10pt (lg). Subtle.

**Shadow:** none on surfaces. Hairline border for separation. Hover-equivalent (selection) is a tinted background, not transform.

**Spacing:** 4, 8, 12, 16, 24, 32, 48, 64.

**Motion:** `Motion.base = 0.10`, `Motion.slow = 0.20`. Easing `.easeOut`. Selection states are background fills, not scales.

**Don't pair with:** neon, brutalist, sharp 0pt radii.

---

## 4. Editorial / NYT / Are.na
**One-line:** Text-first publication. Serif headers, restrained chrome, baseline-grid discipline. Best for long-form reader apps.

**Type:**
- Display: serif via custom font, weight 400 or 700, line-height 1.05. Declare `.system(.largeTitle, design: .serif)` fallback.
- Body: `.system(.body)` (sans). Line-height 1.55.
- Scale (pt): 13, 15, 17, 21, 28, 40, 56, 80. Body default: 17pt.
- Baseline grid: 8pt. Every line aligns.

**Color:** True neutrals via assets. Background pure white / pure near-black in dark. Single accent (red ~700) used sparingly.

**Radius:** 0pt everywhere except images (4pt optional).

**Shadow:** none.

**Spacing:** 8, 16, 24, 32, 48, 64, 96, 128. Column gutters 32–48pt.

**Motion:** `Motion.fast = 0`, `Motion.base = 0.20`. Linear easing. NO transforms. NO layout animation. The only animation: image fade-in on load.

**Don't pair with:** glass, neon, large radii, drop shadows.

---

## 5. Arc / Raycast / Things 3
**One-line:** Apple-native polish. Tinted glass on chrome, vivid accent on neutral, soft radii, spring motion. **Native iOS feel — recommended default for productivity apps.**

**Type:**
- Display: `.system(size: 28, weight: .semibold, design: .default)` (SF Pro Display).
- Body: `.system(.body)` `.regular`.
- Scale (pt): 13, 15, 17, 20, 24, 32, 40, 56. Body default: 17pt.

**Color:** Zinc neutrals with hue-shifted highlights. Accent: system blue (`Color.accentColor` bound to `Color("Accent")`) — user can override to any vivid hue. `.ultraThinMaterial` allowed on toolbars and sheet chrome ONLY (not on cards). Semantic: red/green/orange (Apple system colors).

**Radius:** 8pt (sm), 12pt (md), 16pt (lg), 24pt (xl). Sheet detents use 24pt top corners (system handles this).

**Shadow:** `Shadow.sm` (`y: 1, blur: 2, opacity: 0.05`), `md` (`y: 8, blur: 24, opacity: 0.08`). Never on buttons — buttons use tint (`.tint(Theme.Color.accent)`).

**Spacing:** 4, 8, 12, 16, 20, 24, 32, 40, 56, 80.

**Motion:**
- `Motion.base = 0.20`, `Motion.slow = 0.32`, `Motion.sheet = 0.40`.
- Easing: `.interactiveSpring(response: 0.32, dampingFraction: 0.72, blendDuration: 0)` — Apple's signature feel. `.smooth` (iOS 17+) acceptable.
- Press: `.scaleEffect(isPressed ? 0.97 : 1.0)` over `Motion.fast`.

**Don't pair with:** brutalist, hard shadows, square radii.

---

## 6. Apple Music / Apple Podcasts (most native to iOS)
**One-line:** Edge-to-edge artwork. Large titles. `.ultraThinMaterial` chrome. Card-based content with dynamic accent. **The most native choice — pick this if unsure.**

**Type:**
- Display: `.system(size: 34, weight: .bold, design: .default)`. Tracking `-0.025`. Line-height tight.
- Body: `.system(.body)`.
- Scale (pt): 13, 15, 17, 22, 28, 34, 44, 60. Body default: 17pt. Use `.navigationTitle` with `.large` display mode where appropriate.

**Color:** Album-artwork-driven dynamic accent (extract dominant via `UIImage`-based palette OR fall back to `.red` system). Background near-black in dark mode (default), near-white in light. Translucent chrome via `.ultraThinMaterial` on toolbar and tab bar.

**Radius:** 6pt (artwork sm), 12pt (artwork md), 20pt (cards), 28pt (sheets — system handles).

**Shadow:** `y: 12, blur: 32, opacity: 0.4` only on lifted/expanded cards. None at rest.

**Spacing:** 4, 8, 16, 20, 24, 32, 48, 64.

**Motion:**
- `Motion.base = 0.20`, `Motion.slow = 0.32`, `Motion.sheet = 0.48`.
- Easing: `.interactiveSpring(response: 0.36, dampingFraction: 0.78, blendDuration: 0)` or `.smooth`.
- `matchedGeometryEffect` for hero artwork → detail transitions.

**Don't pair with:** brutalist, editorial serif.

---

## 7. Material You (Android Expressive — translated to iOS)
**One-line:** Dynamic color from a brand seed. Expressive shapes. Bold motion physics. **Cross-platform choice — pick only if you also ship Android and want one identity.**

**Type:**
- Display: custom Roboto Flex with `.system(.title, design: .default)` fallback. Weight `.medium`.
- Body: `.system(.body)`.
- Scale (pt): 11, 12, 14, 16, 22, 28, 32, 36, 45, 57. Body default: 14pt (under HIG body minimum — call this out to user).

**Color:** Generated from a brand seed via M3 algorithm. User provides hex; you list out the role tokens (`primary`, `onPrimary`, `primaryContainer`, `onPrimaryContainer`, `secondary`, `tertiary`, `surface`, surface-1…surface-5). All declared as named color assets.

**Radius:** 4pt (xs), 8pt (sm), 12pt (md), 16pt (lg), 28pt (xl), `.capsule` (full pill). Vary by component intentionally.

**Shadow:** Material 3 elevation tokens e1–e5 (translated to SwiftUI `.shadow` modifiers). e1 default for cards.

**Spacing:** 4, 8, 12, 16, 20, 24, 32, 40, 48, 56.

**Motion:** `Motion.base = 0.20`, `Motion.slow = 0.30`, `Motion.xl = 0.50`. Easing emphasized: `.easeInOut` with longer durations. Springs for state changes via `.interactiveSpring(response: 0.4, dampingFraction: 0.7, blendDuration: 0)`.

**Don't pair with:** Linear, editorial serif, brutalist.

---

## 8. Brutalist / mono / hacker
**One-line:** High-contrast, monospace, raw. Deliberately loud. Niche on iOS — pick only for art/manifesto/tool apps with explicit personality.

**Type:**
- Display: `.system(.title, design: .monospaced)` weight `.bold`. Custom mono font (Berkeley Mono / JetBrains Mono / IBM Plex Mono) with mono fallback.
- Body: same family `.regular`.
- Scale (pt): 12, 14, 16, 20, 28, 40. Body default: 14pt (under HIG — flag to user).

**Color:** Black + white only. One full-saturation accent (chartreuse / hot pink / electric blue) via `Color("Accent")`. No mid-grays. Borders are 1pt solid `Color.primary`.

**Radius:** 0 everywhere. No exceptions.

**Shadow:** offset hard shadow simulated via stacked `ZStack` with `.offset(x: 4, y: 4)` of black background. Not a blur shadow.

**Spacing:** 8, 16, 24, 32, 48, 64. Always multiples of 8.

**Motion:** `Motion.fast = 0`, `Motion.base = 0.10`. Linear. Hover-equivalent (selection) inverts colors, never transforms.

**Don't pair with:** anything soft. Brutalist is exclusive — pick it or pick something else.

---

## Blending rules

- User picks 1 anchor → use it whole.
- User picks 2 anchors → designate one as **primary** (provides type, color, spacing, radius, shadow) and one as **accent** (may override only the typography display family OR only the motion personality OR only the accent hue — never all three).
- User picks 3 anchors → primary + type-anchor + motion-anchor. Color always from primary.
- **Forbidden blends:** Brutalist + anything. Editorial + Apple Music. Material You + Linear. Linear + Apple Music chrome. If the user requests one of these, ask which they want to drop.
- Regardless of anchor choice: **HIG mechanics still win.** Touch targets, Dynamic Type, safe area, swipe-back, and `.sheet` semantics are not negotiable.
