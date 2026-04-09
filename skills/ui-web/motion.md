# Motion (Web)

Motion has personality. Pick the personality from the chosen anchor; do not mix.

## Duration tokens

| Token | Value | Use |
|---|---|---|
| `duration-instant` | 0ms | Color/opacity flips that should feel binary |
| `duration-fast` | 60ms | Hover, press feedback |
| `duration-base` | 120ms | Most layout changes, dropdown, popover |
| `duration-slow` | 200ms | Modal open, sheet expand |
| `duration-slower` | 300ms | Page transitions, large layout shifts |

Anchor mappings: Linear uses fast/base. Stripe uses base/slow. Apple/Arc uses slow/slower. Material You uses slow/slower with springs. Brutalist uses instant only.

## Easing tokens

| Token | Curve | Use |
|---|---|---|
| `ease-out` | cubic-bezier(0, 0, 0.2, 1) | Default outgoing |
| `ease-in-out` | cubic-bezier(0.4, 0, 0.2, 1) | Layout shifts |
| `ease-spring` | cubic-bezier(0.32, 0.72, 0, 1) | Apple-feel anchors only |
| `linear` | linear | Brutalist + progress bars |

NEVER use Tailwind's default `transition-all`. Specify the property: `transition-colors`, `transition-transform`, `transition-opacity`.

## When motion is allowed

- Hover/focus/press feedback (always)
- Layout transitions (always, with `motion-safe:` wrapper)
- Modal/sheet/popover open/close
- Toast enter/exit
- Skeleton → real content swap (single fade-in only)
- List item add/remove (FLIP technique)

## When motion is forbidden by default

- Page-load entrance animations on hero/headline/cards (unless anchor explicitly allows ONE element)
- Parallax scrolling
- Auto-playing carousels
- Animated gradient backgrounds
- Hover-scale on every link/card
- Floating decorative SVGs

## Reduced motion

Wrap every animation in `motion-safe:` Tailwind variant. Provide a static alternative for `prefers-reduced-motion`.

```tsx
<div className="motion-safe:transition-transform motion-safe:duration-base hover:scale-[1.02]">
```

## Press feedback (pick one per project, document in DESIGN_RULES.md)

- **Scale**: `active:scale-[0.98] transition-transform duration-fast`
- **Darken**: `active:bg-foreground/5 transition-colors duration-fast`

Never both. Never neither.
