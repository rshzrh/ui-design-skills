# Icons & Imagery (Web)

## Icon library (pick one per project)

| Anchor | Icon set | Style |
|---|---|---|
| Linear / Vercel / Geist | `lucide-react` | line, 1.5px stroke, 16/20/24px |
| Stripe / Plaid | `phosphor-icons` (regular) | line, balanced, 20/24px |
| Notion / Craft | `lucide-react` | line, 1.5px, 16/20px |
| Editorial / NYT | `lucide-react` minimal use, prefer text | 16px max |
| Arc / Raycast / Things 3 | `phosphor-icons` (duotone) OR Lucide | softer fills |
| Apple Music / Podcasts | SF Symbols web fallback OR `phosphor-icons` (fill) | filled, vivid |
| Material You | `lucide-react` (closest to Material Symbols) | line/filled per state |
| Brutalist | mono ASCII glyphs OR Lucide at 1px stroke | rigid |

NEVER mix two icon libraries. NEVER mix line and filled icons in the same surface unless using a state convention (filled = active).

## Icon sizing (always tied to nearby text)

- Inline with body text: same px as the text.
- Inside a button: 14px (sm), 16px (md), 18px (lg).
- Standalone (icon button): 16/20/24px depending on button size.
- Empty state hero icon: 40px (default) or 48px (large).
- Section heading icon: 20px max.

## Icon color

- Always inherits from `currentColor`. NEVER hardcode.
- Default: `text-muted-foreground`.
- Active/hover: `text-foreground`.
- Destructive: `text-destructive`.
- Brand emphasis: anchor accent at 600-shade.

## Forbidden icon usage

- Emoji as bullets in serious B2B/productivity UI (✨🚀⚡🔥💫).
- Multiple icon styles in one project (line + filled + duotone mixed).
- Icons larger than the heading they accompany.
- Icons without a `aria-label` when they're the only label on a button.
- Decorative icons floating in backgrounds.

## Imagery

### Photography

- Default: NONE. Use real screenshots of the product, not stock people.
- If real photos required: use one consistent treatment (e.g., desaturated, monochrome, or untouched). Never mix.
- Forbidden: stock-photo-of-people-pointing-at-laptops, generic gradients labeled "abstract tech", AI-generated stock photos with telltale fingers.

### Illustration

- If the project needs illustration: use a single style throughout (line, geometric, painterly — pick one).
- Forbidden: the "Notion-style isometric people" stock illustration set. Forbidden: "rocket launching" empty states.
- Default to NO illustration; let typography and structure carry the page.

### Logos

- The user must provide their logo. If they don't, use a wordmark in the chosen display font, NOT a generic placeholder bird/star/circle.
- Logo soup ("Trusted by") only if user provides real customer logos. Otherwise omit the section entirely.

### Screenshots & product visuals

- Real screenshots ALWAYS preferred over mockups.
- Frame: subtle border (1px anchor neutral-200) + small radius. NEVER add fake browser chrome unless the screenshot needs context.
- Annotations: use anchor accent color, never red-on-screenshot.

## Decorative graphics

By default: NONE. Whitespace and typography are the design.

If the chosen anchor explicitly uses decoration (Brutalist hard shadows, Material You expressive shapes), follow the anchor recipe. Never improvise.
