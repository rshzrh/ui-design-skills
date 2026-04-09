# Motion (iOS / SwiftUI)

Motion has personality. Pick the personality from the chosen anchor; do not mix. SwiftUI gives you implicit animations (`.animation(_, value:)`), explicit animations (`withAnimation { ... }`), and transitions (`.transition(...)`) — each has the right place.

## Duration tokens

Defined in `Theme.Motion` (see `templates/Tokens.swift.tmpl`):

| Token | Value (s) | Use |
|---|---|---|
| `Theme.Motion.instant` | 0.0 | Color/opacity flips that should feel binary |
| `Theme.Motion.fast` | 0.06 | Press feedback, tint flips |
| `Theme.Motion.base` | 0.20 | Most layout changes, popovers, list updates |
| `Theme.Motion.slow` | 0.32 | Sheet open, large layout shifts |
| `Theme.Motion.sheet` | 0.40 | Modal presentation polish (when overriding system) |

Anchor mappings: Linear uses `fast`/`base` only. Stripe uses `base`/`slow`. Apple-native (Arc, Apple Music) uses `base`/`slow`/`sheet` with springs. Material You uses `slow`/`sheet`. Brutalist uses `instant` only.

## Easing tokens

Defined in `Theme.Motion`:

| Token | Curve | Use |
|---|---|---|
| `Theme.Motion.easeOut` | `.easeOut(duration: ...)` | Default outgoing — most transitions |
| `Theme.Motion.easeInOut` | `.easeInOut(duration: ...)` | Symmetric layout shifts |
| `Theme.Motion.spring` | `.interactiveSpring(response: 0.32, dampingFraction: 0.72, blendDuration: 0)` | Apple-native anchors only |
| `Theme.Motion.smooth` | `.smooth` (iOS 17+) | A friendly default for content animations |
| `Theme.Motion.linear` | `.linear(duration: ...)` | Brutalist + indeterminate progress |

NEVER write `.animation(.easeOut(duration: 0.2), value: ...)` inline. Always reference a token: `.animation(Theme.Motion.spring, value: state)`.

## When to use which API

| API | When |
|---|---|
| `.animation(_, value:)` | The default. Drives state-change animations on a specific value. Lexically scoped to one View subtree so it doesn't accidentally animate siblings. |
| `withAnimation { ... }` | When the state mutation crosses View boundaries (e.g., toggling an environment value, dismissing from a child). Use the same `Theme.Motion.*` token. |
| `.transition(...)` | For insertion/removal of Views in conditional branches. Pair with `.animation` on the parent stack. |
| `matchedGeometryEffect(id:in:)` | Hero transitions ONLY when there is a real spatial relationship between two states (artwork → detail screen, list cell → expanded card). Never as decoration. |

## When motion is allowed

- Press feedback (always — via the chosen press-feedback ButtonStyle)
- State-change layout transitions (`.animation(Theme.Motion.spring, value: items)`)
- Sheet / popover / alert open/close (system handles — don't override unless anchor demands)
- List row insert/remove
- Skeleton → real content swap (single fade via `.transition(.opacity)`)
- `matchedGeometryEffect` between paired Views

## When motion is forbidden by default

- Entrance animations on screen appear via `.onAppear { withAnimation { showHero = true } }` — no `.transition` cascades on screen load
- Parallax scroll math via `GeometryReader` on every cell
- `.symbolEffect(.bounce, options: .repeating)` as decoration
- `.symbolEffect(.pulse)` on idle UI without a triggering event
- Auto-playing `TabView(.page)` carousels
- `.scaleEffect` on hover-equivalent (no hover on iPhone — there is no hover)
- Animated `LinearGradient` `phase` shimmer as background
- Particle/confetti effects unless the user explicitly requested a celebratory moment

## Reduced motion

Honor `@Environment(\.accessibilityReduceMotion)`. Wrap any non-essential animation:

```swift
@Environment(\.accessibilityReduceMotion) private var reduceMotion

.animation(reduceMotion ? nil : Theme.Motion.spring, value: state)
```

Provide a static alternative for any `matchedGeometryEffect` (cross-fade instead of a continuous morph).

## Press feedback (pick one per project, document in DESIGN_RULES.md)

- **Scale**: `.scaleEffect(configuration.isPressed ? 0.97 : 1.0)` with `.animation(Theme.Motion.easeOut(Theme.Motion.fast), value: configuration.isPressed)`
- **Opacity**: `.opacity(configuration.isPressed ? 0.85 : 1.0)` with the same animation token

Never both. Never neither. Implement once in a custom `ButtonStyle` under `Theme/Buttons/` and reuse.

## Symbol effects (iOS 17+)

`.symbolEffect(...)` is allowed on **user-triggered** events only:

- `.symbolEffect(.bounce, value: tappedAt)` on a like button after the user taps
- `.symbolEffect(.pulse, value: isProcessing)` on a status indicator while a real operation runs
- `.symbolEffect(.variableColor)` for live processing indicators

Forbidden: `.symbolEffect(.bounce, options: .repeating)` on idle UI, `.symbolEffect(.pulse)` on every icon for "polish".
