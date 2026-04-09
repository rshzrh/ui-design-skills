# Reference Anchors (Web)

These are the **only** acceptable starting points for aesthetic decisions. Show this file to the user (one-line summary per anchor) during Step 1 intake. The user picks 1–3. If 2–3, the user designates which anchor contributes type, color, and motion separately.

**Hard rule:** every value the user sees in `tailwind.config.ts` must trace to the recipe of an anchor below. Mixing values from different anchors without an explicit blend rule is forbidden.

---

## 1. Linear / Vercel / Geist
**One-line:** Tools-for-hackers. Monochrome stone, sharp edges, instant motion, keyboard-first.

**Type:**
- Display: Inter Display, weight 600, tracking -0.02em, line-height 1.1
- Body: Inter, weight 400, line-height 1.5
- Mono: JetBrains Mono, line-height 1.5
- Scale (px): 12, 13, 14, 16, 18, 20, 24, 32, 48
- Body default: 14px / 1.5

**Color:**
- Neutrals: stone-50, stone-100, stone-200, stone-300, stone-400, stone-500, stone-600, stone-700, stone-800, stone-900, stone-950
- Single accent: stone-900 (light mode primary action) / stone-50 (dark mode primary action)
- Semantic: red-600 (danger), emerald-600 (success), amber-600 (warn). One shade only.
- NO secondary accent. NO gradient.

**Radius:** 6px (sm), 8px (md), 10px (lg). Buttons never above 8px.

**Shadow:** none. Elevation = 1px stone-200 (light) / stone-800 (dark) borders.

**Spacing:** 4, 8, 12, 16, 20, 24, 32, 40, 48, 64, 80. Component padding: 12px default, 16px on touch surfaces.

**Motion:**
- Duration: 60ms (hover/press), 120ms (layout), 180ms (modals).
- Easing: cubic-bezier(0.16, 1, 0.3, 1) for layout, ease-out for hover.
- No springs. No entrance animations on page load.

**Don't pair with:** soft pastels, glass, large radii, drop shadows, decorative serifs, brand gradients.

---

## 2. Stripe / Plaid
**One-line:** Financial-grade trust. Calm blues, restrained color, generous reading whitespace.

**Type:**
- Display: Söhne (or Inter Display fallback), weight 500, tracking -0.01em, line-height 1.15
- Body: Söhne (or Inter fallback), weight 400, line-height 1.6
- Mono: Söhne Mono / IBM Plex Mono
- Scale (px): 14, 16, 18, 20, 24, 32, 40, 56, 72
- Body default: 16px / 1.6

**Color:**
- Neutrals: slate-50…slate-900
- Primary accent: indigo-600 (action), supported by slate-900 for text
- Sober gradient (hero ONLY, opt-in): linear from indigo-500 to indigo-700, never multi-stop
- Semantic: red-600, emerald-600, amber-500

**Radius:** 4px (sm), 8px (md), 12px (lg).

**Shadow:**
- sm: 0 1px 2px rgba(15,23,42,0.06)
- md: 0 4px 12px rgba(15,23,42,0.08)
- lg: 0 16px 40px rgba(15,23,42,0.12)
- Always paired with a 1px slate-200 border.

**Spacing:** 4, 8, 12, 16, 24, 32, 48, 64, 96, 128. Section padding 96px desktop, 64px tablet, 48px mobile.

**Motion:**
- Duration: 150ms (hover), 250ms (layout), 350ms (page).
- Easing: cubic-bezier(0.4, 0, 0.2, 1).
- No entrance animations on load except a single 200ms fade-in for above-fold content.

**Don't pair with:** brutalist mono, neon, decorative serifs, glass.

---

## 3. Notion / Craft
**One-line:** Document-feel productivity. Warm neutrals, serif accents, generous reading column.

**Type:**
- Display: Tiempos Headline (or Lyon Display) — serif. Weight 400. Tracking -0.005em. Line-height 1.2.
- Body: Inter or system-ui sans, weight 400, line-height 1.6
- Mono: iA Writer Mono / JetBrains Mono
- Scale (px): 14, 16, 18, 21, 28, 36, 48, 60
- Body default: 16px / 1.6
- Reading column max 680px.

**Color:**
- Warm neutrals: stone-50, stone-100, stone-200… (warm stone, NOT cool slate)
- Accent: stone-900 for primary, with a single brand hue at 600 for links/highlights (default: amber-600)
- Subtle background tints: stone-100 for cards, stone-50 for page

**Radius:** 4px (sm), 6px (md), 10px (lg). Subtle.

**Shadow:** none on surfaces. 0 0 0 1px stone-200 for inset borders only. Hover shows 0 1px 0 stone-300.

**Spacing:** 4, 8, 12, 16, 24, 32, 48, 64. Generous line spacing.

**Motion:**
- Duration: 100ms (hover), 200ms (layout).
- Easing: ease-out.
- Hover states are subtle background fills, not transforms.

**Don't pair with:** neon, brutalist mono, sharp 0px radii, hard shadows.

---

## 4. Editorial / NYT / Are.na
**One-line:** Text-first publication. Serif headers, restrained chrome, baseline-grid discipline.

**Type:**
- Display: GT Sectra / Tiempos Headline / Source Serif. Weight 400 or 700. Line-height 1.05.
- Body: GT America / Inter / Source Sans. Weight 400. Line-height 1.55.
- Mono: GT America Mono
- Scale (px): 13, 15, 17, 21, 28, 40, 56, 80, 112
- Body default: 17px / 1.55
- Baseline grid: 8px. Every line of text aligns to it.

**Color:**
- True neutrals: zinc-50…zinc-950
- Single accent: red-700 (or user-provided brand) used sparingly
- Background: white / zinc-50. Dark mode: zinc-950.

**Radius:** 0px everywhere except images (4px optional).

**Shadow:** none.

**Spacing:** 8, 16, 24, 32, 48, 64, 96, 128, 192. Column gutters 32–48px.

**Motion:**
- Duration: 0ms for hover (text underline only), 200ms (image fade).
- Easing: linear.
- No transforms. No layout animation.

**Don't pair with:** glass, neon, large radii, drop shadows, decorative cards.

---

## 5. Arc / Raycast / Things 3
**One-line:** Apple-native polish on the web. Tinted glass, vivid accent on neutral, soft radii, spring motion.

**Type:**
- Display: SF Pro Display (system-ui fallback). Weight 600. Tracking -0.022em. Line-height 1.1.
- Body: SF Pro Text (system-ui). Weight 400. Line-height 1.45.
- Mono: SF Mono / Berkeley Mono
- Scale (px): 13, 15, 17, 20, 24, 32, 40, 56
- Body default: 15px / 1.45

**Color:**
- Neutrals: zinc-50…zinc-950 with hue-shifted highlights
- Accent: blue-500 (Apple system blue) by default, user can override to any vivid hue
- Tinted glass surfaces: rgba(white, 0.7) with backdrop-blur-xl (THIS is where backdrop-blur is allowed)
- Semantic: red-500, green-500, orange-500 (Apple system colors)

**Radius:** 8px (sm), 12px (md), 16px (lg), 24px (xl). Sheets/modals use 24px on top corners only.

**Shadow:**
- sm: 0 1px 2px rgba(0,0,0,0.05)
- md: 0 8px 24px rgba(0,0,0,0.08)
- Never on buttons. Buttons use tint, not shadow.

**Spacing:** 4, 8, 12, 16, 20, 24, 32, 40, 56, 80.

**Motion:**
- Duration: 180ms (hover), 280ms (layout), 400ms (sheet).
- Easing: cubic-bezier(0.32, 0.72, 0, 1) — Apple's signature spring-feel curve.
- Press: scale 0.97, 100ms.
- Sheets slide up with opacity 0→1 over 400ms.

**Don't pair with:** brutalist mono, hard shadows, square radii.

---

## 6. Apple Music / Apple Podcasts (iOS-style web)
**One-line:** Edge-to-edge artwork. Large titles. Blurred chrome. Card-based content.

**Type:**
- Display: SF Pro Display. Weight 700. Tracking -0.025em. Line-height 1.05.
- Body: SF Pro Text. Weight 400. Line-height 1.4.
- Scale (px): 13, 15, 17, 22, 28, 34, 44, 60
- Body default: 17px

**Color:**
- Album-art-driven dynamic accent (extract dominant color, fall back to red-500)
- Background: zinc-950 (dark default), zinc-50 (light)
- Translucent chrome: rgba(zinc-950, 0.72) + backdrop-blur-2xl

**Radius:** 6px (artwork sm), 12px (artwork md), 20px (cards), 28px (sheets).

**Shadow:** 0 12px 32px rgba(0,0,0,0.4) only on hover-lifted cards. None at rest.

**Spacing:** 4, 8, 16, 20, 24, 32, 48, 64.

**Motion:**
- Duration: 200ms (hover), 320ms (layout), 480ms (sheet).
- Easing: cubic-bezier(0.32, 0.72, 0, 1).
- Cards lift on hover with translateY(-4px) and shadow.
- Velocity-based scroll inertia (CSS scroll-snap optional).

**Don't pair with:** brutalist, editorial serif, no-radius.

---

## 7. Material You (Android Expressive — web translation)
**One-line:** Dynamic color from brand. Expressive shapes. Bold motion physics.

**Type:**
- Display: Roboto Flex (variable). Weight 400 display, 500 body. Line-height 1.15 display / 1.5 body.
- Body: Roboto Flex.
- Mono: Roboto Mono.
- Scale (px) — Material 3 type scale: 11, 12, 14, 16, 22, 28, 32, 36, 45, 57
- Body default: 14px / 1.43 (Material 3 body-medium)

**Color:**
- Generated from a brand seed color via M3 algorithm. User provides one hex; you derive the full role-based palette (primary, on-primary, primary-container, on-primary-container, secondary, tertiary, surface variants).
- 5 surface elevation tints (surface-1 through surface-5).

**Radius:** 4px (xs), 8px (sm), 12px (md), 16px (lg), 28px (xl), 9999 (full pill). Use varied shapes per component.

**Shadow:** Material 3 elevation tokens (e1–e5). e1 default for cards.

**Spacing:** 4, 8, 12, 16, 20, 24, 32, 40, 48, 56.

**Motion:**
- Duration: 100ms (small), 200ms (medium), 300ms (large), 500ms (extra large).
- Easing: cubic-bezier(0.2, 0, 0, 1) (emphasized). Spring physics for state changes.
- Generous, expressive — animations have personality, not sterile.

**Don't pair with:** Linear/Vercel mono, editorial serif, brutalist.

---

## 8. Brutalist / mono / hacker
**One-line:** High-contrast, monospace, raw. Deliberately loud.

**Type:**
- Display: Berkeley Mono / JetBrains Mono / IBM Plex Mono. Weight 700. Line-height 1.1.
- Body: Same family. Weight 400. Line-height 1.5.
- Scale (px): 12, 14, 16, 20, 28, 40, 56, 80, 112
- Body default: 14px

**Color:**
- Black + white only by default (zinc-950 + zinc-50). One accent at full saturation: chartreuse / hot pink / electric blue.
- No mid-grays. Borders are 1px solid current color.

**Radius:** 0 everywhere. No exceptions.

**Shadow:** 4px 4px 0 zinc-950 (offset hard shadow, not blur).

**Spacing:** 8, 16, 24, 32, 48, 64, 96, 128. Always multiples of 8.

**Motion:**
- Duration: 0ms (instant) for hover. 100ms inversions.
- Easing: linear.
- Hover = invert colors, not transform.

**Don't pair with:** anything soft. This is exclusive — pick brutalist or pick something else.

---

## Blending rules

- User picks 1 anchor → use it whole.
- User picks 2 anchors → designate one as **primary** (provides type, color, spacing, radius, shadow) and one as **accent** (may override only the typography display family OR only the motion personality OR only the accent hue — never all three).
- User picks 3 anchors → primary + type-anchor + motion-anchor. Color always from primary.
- **Forbidden blends:** Brutalist + anything. Editorial + Apple Music. Material You + Linear. If the user requests one of these, ask which they want to drop.
