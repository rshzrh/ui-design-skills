# Ban Patterns (iOS / SwiftUI)

Eight patterns. Three are **default-on** (must be presented to the user pre-checked). Five are opt-in. The user picks at the start of Step 1.

When a pattern is active, you MUST verify your output against it during the audit and remove violations before claiming done.

---

## DEFAULT-ON

### 1. Generic gradient slop
**Forbidden tokens / patterns:**
- `LinearGradient(colors: [.purple, .pink], ...)` and any reordering
- `LinearGradient(colors: [.purple, .blue], ...)`
- `LinearGradient(colors: [.indigo, .purple], ...)`
- `LinearGradient(colors: [.violet, .pink, .fuchsia], ...)` (any 3-stop)
- `LinearGradient(gradient: Gradient(stops: [...]))` with named SwiftUI hues that include `.purple` + `.pink`/`.fuchsia`/`.indigo`
- Gradient `.foregroundStyle(LinearGradient(...))` over hero text using multi-color stops
- `MeshGradient` (iOS 18+) with no content reason and 4+ rainbow points
- `AngularGradient` used decoratively in headers / backgrounds

**Allowed:** single-anchor sober gradients listed in the chosen anchor recipe (e.g., Stripe's indigo→deep-indigo hero gradient defined as `Theme.Color.heroGradient`). Solid `Theme.Color.*` always allowed.

**Detection:** grep generated Swift for `LinearGradient`, `AngularGradient`, `MeshGradient` and check the color list against the active anchor.

---

### 2. Lorem ipsum & filler copy
**Forbidden strings (case-insensitive):**
- "Lorem ipsum"
- "Lightning fast" / "Blazing fast"
- "Built for iOS" / "Built for the modern X"
- "Powered by AI"
- "Unleash the power of"
- "Get started in seconds"
- "The future of X"
- "Beautiful and intuitive"
- "Seamlessly integrate"
- "Take your X to the next level"
- "Reimagined" / "Redesigned"
- "Effortlessly"
- Generic CTAs: "Get Started", "Learn More", "Submit", "Continue" (without object), "Tap here"
- Emoji bullets (✨🚀⚡🔥💫) in serious productivity / utility apps

**Required behavior:** when copy is needed and the user has not provided it, STOP and ask: "I need real copy for [section]. What does this product do, and what should the headline say specifically about it?" Do not invent.

**Detection:** grep generated Swift for the exact strings above (case-insensitive).

---

### 3. Arbitrary values (magic numbers)
**Forbidden patterns:**
- `.padding(13)`, `.padding(.horizontal, 17)`, `.padding(.top, 23)` — any numeric literal in a `.padding()` call
- `.frame(width: 372, height: 57)` — any numeric in `.frame()`
- `.cornerRadius(7)`, `.clipShape(RoundedRectangle(cornerRadius: 9))` — any non-token radius
- `.font(.system(size: 14))` outside `Theme.Font` enum
- `Color(red: 0.21, green: 0.34, blue: 0.55)` — color literals in code
- `Color(hex: "#3a4f6b")` — hex literals (any custom `Color(hex:)` extension call)
- `.offset(x: 11, y: 4)` magic offsets
- `.spacing(13)` in stacks

**Required behavior:** if you need a value that doesn't exist in `Theme.*`, STOP and ask the user to extend the token set. Do not improvise.

**Allowed:** values pulled through `Theme.Spacing.md`, `Theme.Radius.lg`, `Theme.Font.body()`, `Theme.Color.surface`, etc. The literal `0` and `1` are allowed for borders / dividers / `Spacer`.

**Detection:** grep `\.padding\(\s*\d`, `\.frame\([^)]*\d`, `\.cornerRadius\(\s*\d`, `Color\(\s*hex:`, `Color\(\s*red:`, `\.font\(\.system\(size:\s*\d`.

---

## OPT-IN (ask the user)

### 4. Default font tells
**Forbidden as primary font (unless explicitly requested by the user):**
- `"Inter"` declared via `.font(.custom("Inter", size:))`
- `"Roboto"` declared via `.font(.custom("Roboto", ...))`
- `"Open Sans"`, `"Poppins"`, `"Lato"`, `"Montserrat"`

**Allowed:** `.system(...)` (SF Pro on Apple platforms), `.system(.body, design: .serif)`, `.system(.body, design: .monospaced)`, anchor-specific custom fonts (Söhne, Tiempos, GT Sectra, Berkeley Mono, Roboto Flex, Lyon) — and only when the chosen anchor declares them, with a `.system(...)` fallback registered in `Theme.Font`.

**Why:** Inter and Roboto are AI-tells, and on iOS the right default is SF Pro via `.system()`. Custom fonts are a deliberate brand choice routed through `Theme.Font`, never inline.

---

### 5. Glassmorphism / Material overuse
**Forbidden:**
- `.background(.ultraThinMaterial)` on cards, list rows, content cells
- `.background(.regularMaterial)` on form fields
- `.ultraThinMaterial` as a body background
- Stacked materials (`.ultraThinMaterial` over `.thinMaterial`) for "frosted depth"
- Custom blur via `UIVisualEffectView` wrappers when SwiftUI Materials would do, then misused on content

**Allowed:** `.ultraThinMaterial` ONLY on chrome where iOS itself uses it natively — `.toolbarBackground(.ultraThinMaterial, for: .navigationBar)`, sheet handles, tab bar background, and overlay HUDs. Only when the chosen anchor is Arc/Raycast/Things 3 or Apple Music. Used sparingly.

**Detection:** grep `ultraThinMaterial`, `regularMaterial`, `thinMaterial`, `.background(.thick`, `UIVisualEffectView`. Verify each call site is chrome, not content.

---

### 6. Card-in-card nesting
**Forbidden:**
- A card View (`RoundedRectangle` background + padding) inside another card more than 1 level deep
- Shadow + border on the same View
- Mixing radii within a single component (outer `Theme.Radius.lg` with inner `Theme.Radius.sm` siblings)
- Wrapping `Form` rows in additional rounded containers

**Detection:** read your View tree — count nesting of `.background(RoundedRectangle...).padding(...)` patterns. SwiftUI's grouped `Form` and `List` already provide a card surface; never wrap their rows in another.

---

### 7. Generic SwiftUI-tutorial layouts
**Forbidden as the default screen patterns:**
- Hero = centered `VStack { Image; Text headline; Text subhead; Button }` with default spacing
- 3-card `LazyVGrid` features row with `Image(systemName:)` + bold word + 2 lines
- Onboarding carousel of 3 pages with paging dots and "Next" / "Get Started"
- 3-tier paywall with the middle "popular" tier
- Settings screen as a single ungrouped `List` with no `Section` hierarchy
- A `TabView` with exactly 4 default tabs labeled "Home / Search / Library / Profile"
- "Empty state with rocket SF Symbol + Get Started button"

**Allowed:** any of the above ONLY if rooted in the user's content with explicit anchor justification.

**Required behavior:** when generating a top-level screen, propose ≥2 layout alternatives that aren't on this list. Examples: dense `Form` with grouped sections, single-column reader with large title and inline metadata, asymmetric split with sticky leading rail (iPad), `List` with `.listStyle(.insetGrouped)` and row-leading SF Symbols, manifesto-style `ScrollView` with large display type.

---

### 8. Decorative motion
**Forbidden:**
- `.transition(...)` + `.onAppear { withAnimation { ... } }` entrance animations on every element on screen load
- Parallax backgrounds via `GeometryReader` math on every scroll
- Auto-playing `TabView(.page)` carousels
- `.scaleEffect` hover-equivalent on every card
- `.symbolEffect(.bounce, options: .repeating)` on icons as decoration
- Animated `LinearGradient` `phase` shimmer on backgrounds
- `matchedGeometryEffect` used purely for "wow" with no functional payoff

**Allowed:** functional motion only — press feedback, focus rings, layout transitions on data change, sheet open/close, list row insert/remove via `.animation(_, value:)`. Entrance animations only on a single hero element if anchor allows. `.symbolEffect` allowed on user-triggered events (favoriting, sending), never on appear.

---

## Audit step

After generating any code, grep your output against the active patterns. Print:

```
BAN AUDIT
─────────
[1] Generic gradient slop:    PASS / FAIL (matches: ...)
[2] Lorem ipsum / filler:     PASS / FAIL
[3] Arbitrary values:         PASS / FAIL
[4] Default font tells:       PASS / FAIL / SKIP
[5] Material overuse:         PASS / FAIL / SKIP
[6] Card-in-card nesting:     PASS / FAIL / SKIP
[7] Generic SwiftUI layouts:  PASS / FAIL / SKIP
[8] Decorative motion:        PASS / FAIL / SKIP
```

If any FAIL: fix the violations, re-grep, re-print. Do not respond "done" until all PASS.
