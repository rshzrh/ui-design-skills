# Verification (Web)

You MUST run the relevant audit and print the result table to the user before claiming any work done. No exceptions. If any check FAILS, fix and re-run before responding.

---

## Token Audit (after Phase 1)

Run after generating `tailwind.config.ts`, `globals.css`, eslint patch, and `DESIGN_RULES.md`.

```
TOKEN AUDIT
───────────
[T1] Spacing values all on 4 or 8 grid?              PASS / FAIL  (offending: ...)
[T2] Color tokens have WCAG-AA contrast against
     their intended background (text 4.5:1, UI 3:1)? PASS / FAIL
[T3] Type scale has ≤ 7 sizes?                       PASS / FAIL
[T4] Radius scale has ≤ 4 values?                    PASS / FAIL
[T5] Motion durations all from token set, ≤ 500ms?   PASS / FAIL
[T6] Font family from anchor recipe (not generic
     Inter/Roboto unless anchor allows)?             PASS / FAIL
[T7] No banned patterns present in tokens?           PASS / FAIL
[T8] DESIGN_RULES.md written and CLAUDE.md patched?  PASS / FAIL
[T9] eslint.config.js patched + lint:design script?  PASS / FAIL
[T10] `pnpm lint:design` exits 0?                    PASS / FAIL  (run it!)
```

How to run T10:
```bash
pnpm lint:design   # or npm run / yarn run
```

If FAIL: list the violations, fix the tokens (or remove the offending arbitrary value), re-print the audit. Do not show the user a partial PASS.

Then **stop and ask for approval** before Phase 2:

> "Phase 1 audit passed. Tokens are written to `tailwind.config.ts` and `globals.css`. Design rules at `DESIGN_RULES.md`. Approve to proceed with UI generation?"

---

## UI Audit (after Phase 2)

Run after generating any component, screen, or page.

```
UI AUDIT
────────
[U1] Every spacing/size/color value comes from
     tokens (no arbitrary `[xxx]` values)?           PASS / FAIL
[U2] Touch targets ≥ 44px on tap surfaces?          PASS / FAIL
[U3] Focus rings present and visible on all
     interactive elements?                           PASS / FAIL
[U4] Empty + loading + error states present for
     every async surface?                            PASS / FAIL
[U5] No banned patterns (per active ban list)?      PASS / FAIL
[U6] Real copy — no lorem, no filler phrases,
     no generic CTAs?                                PASS / FAIL
[U7] Component anatomy rules satisfied (button
     heights, input padding, card nesting, etc.)?    PASS / FAIL
[U8] Dark mode parity (if dark mode enabled)?       PASS / FAIL
[U9] Icon library consistent — no mixing line/fill
     across one surface?                             PASS / FAIL
[U10] aria-labels on icon-only controls,
      proper heading hierarchy?                      PASS / FAIL
[U11] `pnpm lint:design` exits 0?                   PASS / FAIL
[U12] No buzzwords (clean/modern/sleek/premium/
      beautiful) in code, comments, or copy?         PASS / FAIL
```

## How to run each check (the model performs these literally)

| Check | Command / action |
|---|---|
| U1 | Grep generated files for `\[\d+(px\|rem\|vh\|vw\|%)\]` and `style=\{\{[^}]*color:` |
| U2 | Read every interactive element; verify min-height ≥ 44px on `:tap` surfaces |
| U3 | Search for `focus:outline-none` without a paired `focus:ring-` or `focus-visible:ring-` |
| U4 | For every `useQuery`/`useSWR`/`fetch`/`async` call, verify the rendered output has all three states |
| U5 | Grep for the active ban patterns (see ban-patterns.md detection regexes) |
| U6 | Grep for the banned copy strings (`Lorem ipsum`, `Lightning fast`, `Powered by AI`, ...) |
| U7 | Re-read component-anatomy.md and walk through each component you generated |
| U8 | For each color class, verify a `dark:` variant exists OR the color is dark-mode-safe |
| U9 | Verify only ONE icon import path appears in the file |
| U10 | Grep for `<button>` or `<IconButton>` with no children text and no `aria-label` |
| U11 | Run the lint script |
| U12 | Grep for the buzzwords in your output |

## Output format the model MUST print

Print the table verbatim. For each FAIL, on the next line, list `→ <file:line> <what went wrong>`. After fixing, re-run and re-print.

After all PASS:

> "✓ UI audit passed. <N> files generated: <list>. Lint: 0 issues. Ready for review."

(The ✓ symbol is allowed only in the final pass message — not in generated UI.)

## When you cannot make a check PASS

If a check is impossible to pass (e.g., the user explicitly asked for a banned pattern), document the exception inline with `WAIVED: <reason>` and require the user to confirm. NEVER silently skip a check.
