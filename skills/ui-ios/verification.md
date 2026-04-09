# Verification (iOS)

You MUST run the relevant audit and print the result table to the user before claiming any work done. No exceptions. If any check FAILS, fix and re-run before responding.

---

## Token Audit (after Phase 1)

Run after generating `Theme/Tokens.swift`, `Theme/ThemeModifier.swift`, color assets list, `.swiftlint.yml` patch, and `DESIGN_RULES.md`.

```
TOKEN AUDIT
───────────
[T1] Spacing values all on 4 or 8 grid?               PASS / FAIL  (offending: ...)
[T2] Color tokens have WCAG-AA contrast against
     their intended surface (text 4.5:1, UI 3:1)?     PASS / FAIL
[T3] Type scale has ≤ 7 sizes and uses Dynamic Type
     brackets (.body, .headline, .title2, ...)?       PASS / FAIL
[T4] Radius scale has ≤ 4 values?                     PASS / FAIL
[T5] Motion durations all from Theme.Motion, ≤ 0.5s?  PASS / FAIL
[T6] Font from anchor recipe — .system or anchor's
     custom font with .system fallback declared?      PASS / FAIL
[T7] No banned patterns present in tokens?            PASS / FAIL
[T8] Color assets enumerated with Any + Dark variants
     for every semantic role?                         PASS / FAIL
[T9] DESIGN_RULES.md written and CLAUDE.md patched?   PASS / FAIL
[T10] .swiftlint.yml custom rules added?              PASS / FAIL
[T11] `swiftlint` exits 0 on the project?             PASS / FAIL  (run it!)
```

How to run T11:
```bash
swiftlint --strict
```

If FAIL: list the violations, fix the tokens (or remove the offending magic number), re-print the audit. Do not show the user a partial PASS.

Then **stop and ask for approval** before Phase 2:

> "Phase 1 audit passed. Tokens are written to `<App>/Theme/Tokens.swift` with theme injection in `ThemeModifier.swift`. Design rules at `DESIGN_RULES.md`. Approve to proceed with UI generation?"

---

## UI Audit (after Phase 2)

Run after generating any View, screen, or feature.

```
UI AUDIT
────────
[U1] Every padding/frame/cornerRadius/Color value
     comes from Theme.* (no magic numbers)?           PASS / FAIL
[U2] Touch targets ≥ 44pt on every Button, row,
     and tap surface (verified frame minHeight)?      PASS / FAIL
[U3] Dynamic Type respected — .font(.body) /
     Theme.Font, never .system(size:) literals?       PASS / FAIL
[U4] Safe area respected — no .ignoresSafeArea
     unless documented with SAFE-AREA-IGNORE comment? PASS / FAIL
[U5] Empty + loading + error states present for
     every async surface (use ContentUnavailableView,
     ProgressView, error banner)?                     PASS / FAIL
[U6] No banned patterns (per active ban list)?        PASS / FAIL
[U7] Real copy — no lorem, no filler phrases,
     no generic CTAs, follows iOS conventions
     (Cancel leading, Done trailing, capitalized)?    PASS / FAIL
[U8] Component anatomy rules satisfied (button
     min-heights, list row internals, sheet vs
     fullScreenCover, NavigationStack toolbar)?       PASS / FAIL
[U9] Dark mode parity — every Color from an asset
     with Any+Dark or from Theme.Color?               PASS / FAIL
[U10] SF Symbols only for system icons —
      no Image("custom-icon") for system glyphs,
      no third-party icon library imports?            PASS / FAIL
[U11] VoiceOver labels on icon-only Buttons via
      .accessibilityLabel("...")?                     PASS / FAIL
[U12] Symbol rendering modes consistent in each
      surface (no mixing .hierarchical + .palette)?   PASS / FAIL
[U13] `swiftlint --strict` exits 0?                   PASS / FAIL
[U14] No buzzwords (clean/modern/professional/sleek/
      premium/beautiful/elegant) in code, comments,
      or copy?                                        PASS / FAIL
```

## How to run each check (the model performs these literally)

| Check | Command / action |
|---|---|
| U1 | Grep generated Swift for `\.padding\(\s*\d`, `\.frame\([^)]*\d`, `\.cornerRadius\(\s*\d`, `Color\(\s*hex:`, `Color\(\s*red:` |
| U2 | Read every `Button`, `NavigationLink`, `.onTapGesture`, list row; verify `.frame(minHeight: 44)` or `.contentShape` enclosing 44pt+ |
| U3 | Grep for `\.system\(size:\s*\d` outside `Theme/Tokens.swift`. All other font calls must be `Theme.Font.*` or `.font(.body)`/`.headline`/etc. |
| U4 | Grep for `\.ignoresSafeArea`. For each match, confirm a `// SAFE-AREA-IGNORE: <reason>` comment is on the same or previous line |
| U5 | For every `@State var isLoading`, `URLSession`, `async let`, etc., verify the View renders all three states |
| U6 | Grep for the active ban patterns (see ban-patterns.md detection regexes) |
| U7 | Grep for the banned copy strings (`Lorem ipsum`, `Lightning fast`, `Powered by AI`, `Get Started`, ...) |
| U8 | Re-read component-anatomy.md and walk through each component you generated |
| U9 | For every `Color("...")` reference, verify it appears in the asset catalog list with both Any/Dark variants. For every `Theme.Color.*`, verify the underlying asset has both. |
| U10 | Grep for `Image\("` (custom Image asset) and verify it is only used for brand artwork. Grep for any non-Apple icon library import. |
| U11 | For every `Button { ... } label: { Image(systemName: ...) }` or icon-only label, verify a `.accessibilityLabel("...")` modifier is attached |
| U12 | For each surface, list the rendering modes used and verify they are uniform |
| U13 | Run `swiftlint --strict` |
| U14 | Grep generated Swift for the buzzwords |

## Output format the model MUST print

Print the table verbatim. For each FAIL, on the next line, list `→ <file:line> <what went wrong>`. After fixing, re-run and re-print.

After all PASS:

> "UI audit passed. <N> files generated: <list>. swiftlint: 0 issues. Ready for review."

## When you cannot make a check PASS

If a check is impossible to pass (e.g., the user explicitly asked for a banned pattern, or you must `.ignoresSafeArea` for an immersive media player), document the exception inline with `WAIVED: <reason>` adjacent to the offending code and require the user to confirm. NEVER silently skip a check.
