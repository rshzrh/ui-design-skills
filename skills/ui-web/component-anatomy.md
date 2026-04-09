# Component Anatomy (Web)

Exact rules for every component you generate. Numbers are non-negotiable. If a number doesn't fit your case, ask the user to extend the token set rather than improvising.

All sizes assume the project's base spacing unit is 4px. Adjust if the chosen anchor uses 8px-only.

---

## Button

| Size | Height | Padding-X | Font | Icon | Gap |
|---|---|---|---|---|---|
| sm | 32px | 12px | 13px / 1 | 14px | 6px |
| md | 36px | 16px | 14px / 1 | 16px | 8px |
| lg | 44px | 20px | 16px / 1 | 18px | 8px |

**Rules:**
- Touch targets ≥ 44px (use `lg` on mobile or any `:tap` surface).
- Focus: 2px outline, 2px offset, in accent color. NEVER `focus:outline-none` without a replacement.
- Press: pick ONE per project — `scale 0.98 (60ms)` OR `bg-darken 4%`. Document the choice in `DESIGN_RULES.md`.
- Disabled: `opacity-50 cursor-not-allowed`. No hover state.
- Icon-only buttons must have `aria-label` AND a tooltip.
- Variants: solid (primary), outline (secondary), ghost (tertiary), link (quaternary), destructive. NEVER more than 5 variants.
- Forbidden: gradient buttons, shadow + border on the same button, label + 2 icons, all-caps unless anchor explicitly uses it.

---

## Input (text/email/number/search)

- Height: 36px (md), 44px (lg). Match the button md/lg you use.
- Padding-X: 12px (md), 16px (lg).
- Font: 14px (md) or 16px (lg, especially mobile to prevent iOS zoom).
- Border: 1px from token (`border-input` or anchor neutral-300).
- Radius: matches button radius.
- Focus: 2px ring at 2px offset (NOT replacing the border, layered on top).
- Label: above the input (never floating placeholder-as-label). 13px / 500 weight, mb-2.
- Error: red-600 border + red-600 helper text below, role="alert".
- Helper text slot below input, 12px text-muted-foreground.
- Forbidden: glass inputs, shadowed inputs, gradient borders, pill inputs (`rounded-full`) unless anchor explicitly allows.

---

## Card

- Background: `bg-card` (or anchor surface-1).
- Border: 1px (Linear/Editorial) OR shadow (Stripe/Apple Music). NEVER both.
- Radius: from anchor; consistent across all cards in the project.
- Padding: 16px (compact), 20px (default), 24px (spacious). Pick one per surface, don't mix.
- Hover: only if interactive. Lift = `shadow-md` OR `border-foreground/10`. Pick one.
- Forbidden: cards inside cards more than 1 level deep. Mixing radii inside one card.

---

## List item

- Min-height: 44px (touch).
- Padding: 12px 16px.
- Hover: `bg-muted/50`.
- Selected: `bg-accent/10` + 2px left border in accent.
- Divider: `border-b border-border` between items, never on the last item.
- Forbidden: shadows on list items, gradient backgrounds.

---

## Nav (top bar)

- Height: 56px (compact) or 64px (default). Pick one per project.
- Sticky on scroll.
- Background: `bg-background/80 backdrop-blur-md` ONLY if anchor is Arc/AppleMusic/MaterialYou. Otherwise solid `bg-background` with `border-b border-border`.
- Logo left, primary nav center or left, account/CTA right.
- On mobile: collapse non-CTA links into a sheet.
- Forbidden: 3-column nav with center-floating logo, animated nav backgrounds, gradient nav.

---

## Modal / Dialog

- Use Radix Dialog (via shadcn).
- Width: max-w-md (small), max-w-lg (default), max-w-2xl (large). NEVER `max-w-full` unless full-screen sheet.
- Overlay: `bg-black/50` (light) / `bg-black/70` (dark). Backdrop-blur only on Apple-style anchors.
- Padding: 24px.
- Close button: top-right, 32px icon-button, aria-label="Close".
- Focus trap inside, Escape to dismiss, click overlay to dismiss (configurable).
- Forbidden: nested modals, modals over modals, modals taller than viewport without internal scroll.

---

## Toast (Sonner / shadcn)

- Position: top-right (default) or bottom-right. Never center.
- Width: 360–400px.
- Padding: 16px.
- Auto-dismiss: 5s for info/success, persist for error.
- Variants: default, success, error, warning, info, loading. Each has its own icon and color.
- Action button: max 1, ghost variant.

---

## Empty state

- Vertically centered, max-w-md, text-center.
- Composition: icon (40px, muted) → headline (18px / 600) → description (14px, muted, 1–2 lines) → primary action button.
- Forbidden: stock illustration of "person at desk", "rocket launching", or any generic empty-state vector. Use a single token-colored line icon.

---

## Form field

- Stack: label → input → helper/error.
- Spacing between fields: 16px (compact form) or 20px (spacious).
- Required indicator: red-600 asterisk, NOT "(required)" text.
- Field width: matches container, never `max-w-xs` arbitrary.
- Validation: inline on blur for individual fields, summary on submit failure.

---

## Table row

- Row height: 40px (compact), 48px (default), 56px (comfortable).
- Cell padding: 12px horizontal, 0 vertical (height controlled by row).
- Header: `text-xs uppercase tracking-wider text-muted-foreground` (Linear/Editorial style) OR `text-sm font-medium` (Stripe/Notion style).
- Zebra: optional, only if row count > 8. Use `bg-muted/30`.
- Hover: `bg-muted/50`.
- Forbidden: shadows on rows, gradient headers, borders on every cell (just border-b on rows).

---

## Loading state

- Skeleton (preferred for known shapes): use `animate-pulse` on muted backgrounds matching the eventual layout.
- Spinner (only for indeterminate operations): 16px (inline), 24px (button), 32px (page).
- Progress bar: when % is known.
- Forbidden: full-page spinner over skeleton-able content.

---

## Error state

- Inline (in-flow): red-600 border + red-50 background + icon + message + retry action.
- Toast (out-of-flow): for transient errors.
- Page-level: empty-state composition with red-themed icon, headline ("Something went wrong"), description (specific error), and a "Try again" button.
- Forbidden: silent failures, generic "Error occurred" without specifics, errors as console.log only.

---

## Density modes

If user picked **dense** in intake: subtract 1 step from spacing tokens, use sm component sizes by default.
If user picked **airy**: use lg component sizes, +1 step on section spacing.
If user picked **balanced**: use md sizes (default).
