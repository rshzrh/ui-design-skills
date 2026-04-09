# Ban Patterns (Web)

Eight patterns. Three are **default-on** (must be presented to the user pre-checked). Five are opt-in. The user picks at the start of Step 1.

When a pattern is active, you MUST verify your output against it during the audit and remove violations before claiming done.

---

## DEFAULT-ON

### 1. Generic gradient slop
**Forbidden tokens / patterns:**
- `bg-gradient-to-r from-purple-* to-pink-*`
- `bg-gradient-to-r from-purple-* to-blue-*`
- `bg-gradient-to-br from-indigo-* to-purple-*`
- `bg-gradient-to-tr from-violet-* via-* to-fuchsia-*`
- Any 3-stop gradient (`via-*`) unless the chosen anchor explicitly defines one
- Gradient text on hero headlines (`bg-clip-text text-transparent` over a multi-color gradient)
- Gradient borders (`border-image: linear-gradient`)

**Allowed:** single-anchor gradients listed in the anchor recipe (e.g., Stripe's sober indigo-500→indigo-700 hero gradient). Solid colors always allowed.

**Detection:** grep your output for `from-purple`, `to-pink`, `via-violet`, `via-fuchsia`, `bg-clip-text` paired with `bg-gradient`.

---

### 2. Lorem ipsum & filler copy
**Forbidden strings (case-insensitive):**
- "Lorem ipsum"
- "Lightning fast" / "Blazing fast"
- "Built for the modern X"
- "Powered by AI"
- "Unleash the power of"
- "Get started in seconds"
- "The future of X"
- "Beautiful and intuitive"
- "Seamlessly integrate"
- "Take your X to the next level"
- "Reimagined" / "Redesigned" (as standalone marketing words)
- "Effortlessly"
- Generic CTAs: "Get Started" alone (must be specific: "Start a free trial", "Read the docs", etc.)
- Emoji bullets (✨🚀⚡🔥💫) in serious B2B/productivity UI

**Required behavior:** when copy is needed and the user has not provided it, STOP and ask: "I need real copy for [section]. What does this product do, and what should the headline say specifically about it?" Do not invent.

**Detection:** grep your output for the exact strings above.

---

### 3. Arbitrary values
**Forbidden patterns:**
- `mt-[13px]`, `w-[372px]`, `h-[57vh]`, `gap-[11px]` — any `[xxx]` Tailwind arbitrary class
- Inline styles with hex colors not in tokens: `style={{ color: '#3a4f6b' }}`
- One-off `border-radius: 7px` in CSS files
- `rgb()` / `rgba()` literals in JSX/TSX (must come from CSS variables)

**Required behavior:** if you need a value that doesn't exist in tokens, STOP and ask the user to extend the token set. Do not improvise.

**Detection:** grep `\[[0-9]+(px|rem|vh|vw|%)\]` and `#[0-9a-fA-F]{3,8}` in JSX/TSX files.

---

## OPT-IN (ask the user)

### 4. Default font tells
**Forbidden as primary font (unless explicitly requested by the user):**
- `Inter` (as primary)
- `Roboto` (as primary)
- `Open Sans`
- `Poppins`
- `Lato`
- `Montserrat`

**Allowed:** `system-ui`, `-apple-system`, `SF Pro`, anchor-specific fonts (Söhne, Tiempos, GT Sectra, Berkeley Mono, Roboto Flex, Inter Display).

**Why:** Inter and Roboto are AI-tells. Default to platform fonts (`system-ui, -apple-system, ...`) or a deliberate editorial choice from the anchor recipe.

---

### 5. Glassmorphism overuse
**Forbidden:**
- `backdrop-blur-*` on regular cards or list items
- Frosted overlays as decoration
- Glass on input fields
- Glass on body backgrounds

**Allowed:** glass on iOS-style chrome (top nav, bottom sheet handles) only when the chosen anchor is Arc/Raycast/Things 3 or Apple Music. Used sparingly.

---

### 6. Card-in-card nesting
**Forbidden:**
- A card (border + padding) inside another card more than 1 level deep
- Shadow + border on the same element
- Mixing radii within a single component (e.g., outer rounded-lg with inner rounded-2xl children)

**Detection:** read your component tree — count nesting of `border rounded-* p-*` patterns.

---

### 7. Generic layout patterns
**Forbidden as the default landing/marketing patterns:**
- Hero = centered headline + subhead + 2 buttons + screenshot below
- 3-icon-card "Features" grid (icon + bold word + 2 lines)
- 3-quote testimonial row
- Pricing as 3 vertical cards with the middle one "popular"
- FAQ as the only social proof
- Logo soup band labeled "Trusted by"
- "How it works" 3-step horizontal arrow flow

**Allowed:** any of the above ONLY if you have a specific reason rooted in the user's content and an anchor that explicitly uses the pattern.

**Required behavior:** when generating a landing page, propose ≥2 layout alternatives that aren't on this list. Examples: editorial single-column long-read, asymmetric split with persistent side rail, dense table-as-hero, dialogue-style alternating sections, manifesto-style centered text only.

---

### 8. Decorative motion
**Forbidden:**
- Entrance animations (fade-in, slide-in) on every element on page load
- Parallax backgrounds
- Auto-playing carousels
- Hover scale on every card / button / link
- Animated gradient backgrounds
- Floating SVG decorations

**Allowed:** functional motion only (hover feedback, focus rings, layout transitions, modal open/close, list item add/remove). Entrance animations only on a single hero element if anchor allows.

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
...
```

If any FAIL: fix the violations, re-grep, re-print. Do not respond "done" until all PASS.
