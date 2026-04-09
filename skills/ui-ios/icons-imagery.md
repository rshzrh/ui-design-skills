# Icons & Imagery (iOS)

## SF Symbols only — no exceptions

System iconography on iOS comes from SF Symbols. **You may not import Lucide, Phosphor, FontAwesome, Material Icons, or any custom SVG sprite system for system icons.** Custom `Image("brand-mark")` is allowed only for brand artwork (logo, mascot).

```swift
// Allowed
Image(systemName: "square.and.arrow.up")
Label("Share", systemImage: "square.and.arrow.up")

// Banned in source
Image("ic_share")              // raster system icon
Image("share-icon")            // bundled SVG system icon
// any third-party icon library import
```

If you are unsure whether a glyph exists in SF Symbols, **STOP and ask the user** rather than inventing a name. SF Symbols 5+ ships with thousands of symbols — check the SF Symbols app. Common pitfalls:

- "checkmark.circle.fill" exists; "check.circle.filled" does not.
- "xmark" exists; "close" does not.
- "trash" exists; "delete" does not.

## Sizing

Tie symbol size to nearby text via `.imageScale(...)`, NEVER hardcode `.frame(width: 24, height: 24)`.

| Context | Modifier |
|---|---|
| Inline with body text | `.imageScale(.medium)` (default) |
| Smaller, secondary | `.imageScale(.small)` |
| Larger, emphasis | `.imageScale(.large)` |
| Empty state hero | `.font(.system(size: 48))` via `Theme.Font` only |
| Tab bar | system handles |
| Toolbar | system handles |

For numerical control, use `.font(.body)` / `.font(.title2)` etc. on the `Image` to tie its size to a Dynamic Type bracket — symbol scales with the user's preferred text size automatically.

## Weight matching

Match symbol weight to the text it sits with:

```swift
HStack {
    Image(systemName: "bolt.fill")
        .symbolRenderingMode(.hierarchical)
        .font(.body.weight(.semibold))   // matches the Text below
    Text("Charging").font(.body.weight(.semibold))
}
```

Forbidden: bold-weight symbols next to regular-weight body text.

## `.symbolRenderingMode`

Pick one rendering mode per surface and stick with it:

| Mode | When |
|---|---|
| `.monochrome` | Default. Tints with `.foregroundStyle(...)`. Most consistent. |
| `.hierarchical` | When you want subtle depth via layered opacity from a single accent. |
| `.palette` | When the symbol has 2–3 distinct meaningful colors (e.g., status badges). Pass an array of `Color`. |
| `.multicolor` | Apple-blessed multi-color rendering. Use sparingly — only on emoji-like symbols (folders, hearts, weather). |

NEVER mix `.hierarchical` and `.palette` icons in the same row/section.

## `.symbolEffect` (iOS 17+)

User-triggered animations only. See `motion.md` for the rules. Examples:

```swift
// Allowed: triggered by a real event
Image(systemName: "heart.fill")
    .symbolEffect(.bounce, value: tapCount)

// Forbidden: idle decoration
Image(systemName: "sparkles")
    .symbolEffect(.pulse, options: .repeating)
```

## Color

- Always inherits from the foreground via `.foregroundStyle(...)` — never via custom `Color` literals.
- Default: `Theme.Color.textSecondary`.
- Active / selected: `Theme.Color.accent`.
- Destructive: `Theme.Color.danger`.
- For status badges, use `.symbolRenderingMode(.palette)` with two `Theme.Color.*` references.

## Forbidden icon usage

- Emoji as bullets in serious productivity / utility apps (✨🚀⚡🔥💫). Decorative emoji must be a deliberate brand voice choice.
- Mixing two icon libraries in one project (only SF Symbols are allowed anyway).
- Mixing `.palette` and `.hierarchical` rendering modes in the same surface.
- Symbols larger than the headline they accompany.
- Symbols without `.accessibilityLabel` when they're the only label on a Button.
- Decorative SF Symbols floating in backgrounds.
- Custom-drawn icons via `Path` / `Shape` when SF Symbols has the glyph.

## Imagery

### Photography

- Default: NONE. Use real screenshots of the product, not stock people.
- If real photos are required: declare a single treatment in `DESIGN_RULES.md` (untouched / desaturated / monochrome) and stick to it.
- Forbidden: stock-photo-of-people-pointing-at-iPads, "diverse team smiling at phone", AI-generated stock images with telltale artifacts.

### Illustration

- If the project needs illustration: use a single style throughout (line, geometric, painterly — pick one).
- Forbidden: the "Notion-style isometric people" stock illustration set. The "rocket launching" empty state. The "person under an umbrella with bills around them" finance illustration.
- Default to NO illustration; let typography and structure carry the screen.

### Logos and brand artwork

- The user must provide their logo (PDF / SVG / PNG). If they don't, use a wordmark in the chosen `Theme.Font.display(...)`, NOT a generic placeholder bird/star/circle.
- App icon: defer to user. If asked to design one, ask for brand color and concept; do NOT pick generic gradient + glyph.

### Screenshots & product visuals

- Real screenshots ALWAYS preferred over mockups.
- Frame: subtle 1pt border in `Theme.Color.border` + `Theme.Radius.md` corner radius. NEVER add fake browser chrome or fake iPhone bezels around an in-app screenshot.
- Annotations: use `Theme.Color.accent`, never red-on-screenshot.

### App Store / marketing screenshots

- Out of scope for this skill. Use real device frames from Apple's `Apple Design Resources`.

## Decorative graphics

By default: NONE. Whitespace and typography are the design.

If the chosen anchor explicitly uses decoration (Brutalist offset shadows, Material You expressive shapes), follow the anchor recipe. Never improvise.
