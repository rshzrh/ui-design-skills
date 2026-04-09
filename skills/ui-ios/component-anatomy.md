# Component Anatomy (iOS / SwiftUI)

Exact rules for every SwiftUI View you generate. Numbers are non-negotiable. If a number doesn't fit your case, ask the user to extend the token set rather than improvising.

All sizes are in **points (pt)**. The base spacing unit is 4pt (4/8 grid). Every padding, frame, and corner radius is pulled from `Theme.Spacing` / `Theme.Radius` — never literal.

---

## Button (custom `ButtonStyle`)

| Size | Min Height | Padding-H | Font | Symbol | Spacing |
|---|---|---|---|---|---|
| sm | 32pt | `Theme.Spacing.sm` (8) | `Theme.Font.subheadline()` | `.imageScale(.small)` | `Theme.Spacing.xs` (4) |
| md | 36pt | `Theme.Spacing.md` (12) | `Theme.Font.callout()` | `.imageScale(.medium)` | `Theme.Spacing.xs` (4) |
| lg | 44pt | `Theme.Spacing.lg` (16) | `Theme.Font.body()` | `.imageScale(.medium)` | `Theme.Spacing.sm` (8) |

**Rules:**
- **Touch targets ≥ 44pt.** Default to `lg` on any tap surface. `sm` is reserved for inline contextual actions (e.g., row trailing pills) and even then must have a `.contentShape(Rectangle()).frame(minHeight: 44)` hit-target wrapper.
- All buttons go through a custom `ButtonStyle` defined under `Theme/Buttons/`. Never inline `.background(...).foregroundColor(...)` on a `Button` label.
- Variants (≤ 5 per project): `.primary` (filled), `.secondary` (tinted), `.tertiary` (plain), `.destructive` (red filled), `.link` (text-only). Document the chosen set in `DESIGN_RULES.md`.
- Press feedback (pick ONE per project): `.scaleEffect(configuration.isPressed ? 0.97 : 1.0)` OR `.opacity(configuration.isPressed ? 0.85 : 1.0)`. Document in `DESIGN_RULES.md`.
- Disabled: `.opacity(0.5)` and `.allowsHitTesting(false)`. No hover/press state.
- Icon-only buttons: must have `.accessibilityLabel("...")`. Min frame `44 × 44`.
- Use system role buttons in toolbars: `Button(role: .cancel)`, `Button(role: .destructive)`. Never style "Cancel" or "Done" custom — they belong in `.toolbar { ... }` and use platform styling.
- Forbidden: gradient buttons (unless anchor explicitly defines), shadow on buttons (use tint), all-caps unless brutalist.

---

## TextField

- Apply `.textFieldStyle(.roundedBorder)` for forms or a custom `TextFieldStyle` from `Theme/TextFields/` for branded surfaces.
- Min height: 44pt. Achieved via `.frame(minHeight: 44)` on the wrapping container.
- Padding-H: `Theme.Spacing.md` (12) for compact, `Theme.Spacing.lg` (16) for spacious.
- Font: `Theme.Font.body()`. NEVER smaller — keeps iOS from auto-zooming on focus.
- Border: 1pt `Theme.Color.border`. Radius: matches button radius.
- Focus: use `@FocusState` + `.focused($field, equals: .name)`. Visible focus ring via 2pt `Theme.Color.accent` border swap, not removed.
- Label: standalone `Text` ABOVE the field, `Theme.Font.subheadline()`, weight `.medium`, with `Theme.Spacing.xs` bottom padding. Never use placeholder-as-label.
- Error: red `Theme.Color.danger` border + `Text` helper below with `.accessibilityHint(...)` for VoiceOver.
- Helper text slot: `Theme.Font.caption()` `Theme.Color.textSecondary`.
- Forbidden: `.background(.ultraThinMaterial)` on TextFields, shadowed inputs, gradient borders, full-pill `Capsule()` shape unless anchor explicitly allows.

---

## List / Form rows

- Min row height: 44pt (HIG hard rule).
- Use `List` with `.listStyle(.insetGrouped)` for settings/forms; `.listStyle(.plain)` for content feeds.
- Row internals: `HStack(spacing: Theme.Spacing.md) { leading SF Symbol → primary text → Spacer → trailing value/chevron }`.
- Leading icons: `Image(systemName: ...)` only, sized via `.imageScale(.medium)` matched to text. Tint via `.foregroundStyle(Theme.Color.accent)` when meaningful, otherwise `Theme.Color.textSecondary`.
- `.listRowSeparator(.visible)` is the default — never hide separators across the board. Hide individually only on the last row of a section if SwiftUI doesn't already.
- `.listRowBackground(Theme.Color.surface)` if the background needs override, otherwise rely on system.
- Selection: `.tint(Theme.Color.accent)` on the list. Never invent a custom selected background that fights with system's hover state on iPad.
- Swipe actions: use `.swipeActions(edge: .trailing)` with role-based buttons. Destructive actions on trailing edge only.
- Forbidden: shadows on rows, gradient row backgrounds, custom dividers when system separator works, wrapping rows in additional `RoundedRectangle` cards.

---

## NavigationStack & toolbar

- Use `NavigationStack` (NOT `NavigationView` — deprecated).
- `.navigationTitle("...")` with `.navigationBarTitleDisplayMode(.large)` for top-level screens; `.inline` for drilldowns and modal-presented detail screens.
- Toolbar items via `.toolbar { ToolbarItem(placement: .topBarLeading) { ... } }`. Cancel goes leading; primary action (Done / Save / Add) goes trailing. Capitalize "Done" and "Cancel" (Apple convention).
- Searchable: `.searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always))` for content surfaces.
- Toolbar background: rely on system. `.toolbarBackground(.ultraThinMaterial, for: .navigationBar)` only when the chosen anchor allows and only on screens with edge-to-edge content underneath.
- Preserve the swipe-back gesture. Never use a custom interactive transition that disables it.
- Forbidden: custom title bars built with `HStack` over `.toolbar(.hidden)`. Building your own back button. Stretchy parallax headers without a content reason.

---

## Sheet vs FullScreenCover vs ConfirmationDialog vs Alert

| Use | When |
|---|---|
| `.sheet(isPresented:)` | Default modal presentation. Tasks the user can dismiss without committing (compose, edit, picker). Prefer with `.presentationDetents([.medium, .large])` on iOS 17+. |
| `.fullScreenCover(isPresented:)` | Immersive flows that take over the screen — onboarding, media playback, camera capture, full-screen reader. NOT for short forms. |
| `.confirmationDialog(...)` | Choice among 2–5 options (typically including a destructive). Always include a `.cancel` role button. |
| `.alert(...)` | Critical interruptions and confirmation of destructive actions. ≤ 2 buttons. Title is a complete sentence ending with a question mark for confirmations. |

- Sheets get `.presentationDragIndicator(.visible)` when partial detents are used.
- Forbidden: nested sheets (sheet over sheet), `.fullScreenCover` for short tasks, custom-built modal overlays via `ZStack` when a real `.sheet` would work, alert as informational toast.

---

## TabView (tab bar)

- ≤ 5 tabs. If you have more sections, demote to a Sidebar (iPad) or `More` tab (iPhone).
- Each tab uses an SF Symbol pair: outline default, filled active. e.g. `Image(systemName: "house")` / `Image(systemName: "house.fill")`. Use `.tabItem { Label("Home", systemImage: "house") }`.
- Labels are required (HIG). Never icon-only tab bar.
- Tab bar background: system default. `.toolbarBackground(.ultraThinMaterial, for: .tabBar)` only with anchor permission.
- Forbidden: 6+ tabs without "More" overflow, animated tab indicators replacing the system one, custom-positioned tab bar, hiding labels.

---

## Empty state — `ContentUnavailableView` (iOS 17+)

```swift
ContentUnavailableView {
    Label("No projects yet", systemImage: "folder")
} description: {
    Text("Projects group your work and let you share with teammates.")
} actions: {
    Button("Create your first project") { ... }
        .buttonStyle(.borderedProminent)
}
```

- ALWAYS use `ContentUnavailableView` on iOS 17+. Never roll your own centered VStack empty state.
- Headline: real, specific. Description: explains the value of having one. Action: verb-led specific button.
- Search empty state: `ContentUnavailableView.search(text: query)`.
- Forbidden: stock illustrations, "rocket launching" SF Symbols, generic "No data" text.

---

## Loading state

- `ProgressView()` for indeterminate. Use `.controlSize(.regular)` inline, `.large` for full-screen.
- `ProgressView(value:total:)` when a real percentage is known.
- `Text` next to the spinner is required for any operation > 1s, with a specific message: "Indexing 1,247 documents…", not "Loading…".
- Use `.redacted(reason: .placeholder)` for skeleton content swaps when the layout shape is known.
- Forbidden: full-screen spinner over content that could be skeleton-redacted, custom rotating SF Symbols when `ProgressView` exists, "Please wait" copy.

---

## Error state

- Inline (in flow): row or banner with `Image(systemName: "exclamationmark.triangle")` + specific message + retry button. Background `Theme.Color.dangerSubtle`.
- Out-of-flow transient: present via the system mechanism for the surface (toast-equivalent: a brief auto-dismissed banner; alerts only when the user must acknowledge).
- Page-level: `ContentUnavailableView` with red icon, specific headline, specific description, "Try again" button.
- Forbidden: silent failures, generic "Something went wrong" without specifics, errors only printed to console.

---

## Form field (in `Form`)

- Wrap in `Section` with header `Text` (sentence case) and optional footer `Text` for help.
- `.formStyle(.grouped)` is the default on iOS.
- Field stack: `LabeledContent("Label") { TextField("", text: $value) }` is preferred for consistent layout.
- Spacing between sections: rely on system. NEVER add `.padding()` inside `Form` rows.
- Required indicator: red `Theme.Color.danger` asterisk on the label, NOT "(required)" text.
- Validation: validate on `.onSubmit` per field for inline errors; summary on form submission failure via `.alert`.

---

## Density modes

If user picked **dense**: use `sm` component sizes wherever HIG allows (touch targets still ≥ 44pt — `sm` may need `.contentShape` expansion).
If user picked **airy**: use `lg` component sizes by default and bump `Theme.Spacing` step on section padding.
If user picked **balanced**: `md` by default (the recipes above).

iOS does not bend on touch targets regardless of density.
