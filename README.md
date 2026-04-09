# ui-design-skills

Three **slop-free UI generation skills** for [Claude Code](https://claude.com/claude-code), covering web, iOS, and Android. Each skill replaces vague aesthetic instructions ("make it clean and modern") with **named anchor recipes, design tokens, and a self-audit checklist** the model must run before claiming done.

- [`ui-web`](skills/ui-web/SKILL.md) — React + Tailwind + shadcn/ui
- [`ui-ios`](skills/ui-ios/SKILL.md) — SwiftUI (iOS 17+, iPhone + iPad)
- [`ui-android`](skills/ui-android/SKILL.md) — Jetpack Compose + Material 3 Expressive (API 34+)

All three use a two-phase workflow: **tokens first (with approval gate), then UI**, both gated by a ban-list of AI-slop patterns (purple→blue gradients, Inter-everywhere, 3-icon-card grids, "Lightning fast / Powered by AI" copy, glassmorphism by default, etc.).

---

## Install

### Option 1 — Plugin marketplace (recommended)

From inside Claude Code:

```
/plugin marketplace add rshzrh/ui-design-skills
/plugin install ui-design-skills@ui-design-skills
```

Skills install under the `ui-design-skills:` namespace (`ui-design-skills:ui-web`, etc.) and update cleanly via `/plugin update`.

### Option 2 — Raw clone (symlink into `~/.claude/skills/`)

```bash
git clone https://github.com/rshzrh/ui-design-skills.git
cd ui-design-skills
./scripts/install.sh
```

The script symlinks each skill directory into `~/.claude/skills/`, backing up any existing non-symlink copies to `<name>.bak-<timestamp>`. Idempotent and safe to re-run. With symlinks, `git pull` immediately updates your local skills.

---

## The skills

### `ui-web` — React + Tailwind + shadcn/ui
Generate slop-free UI for React + Tailwind + shadcn/ui. Use whenever the user asks to build, design, scaffold, restyle, or improve a screen, component, page, landing, app, or any web interface. Two phases — tokens first (with approval gate), then UI — both gated by a self-audit checklist.

### `ui-ios` — SwiftUI
Generate slop-free SwiftUI UI for iOS 17+ (iPhone and iPad). Use whenever the user asks to build, design, scaffold, restyle, or improve a SwiftUI screen, View, sheet, NavigationStack, tab, or any iOS interface.

### `ui-android` — Jetpack Compose + Material 3 Expressive
Generate slop-free Android UI in Jetpack Compose + Material 3 Expressive (Android 14+ / API 34+). Use whenever the user asks to build, design, scaffold, restyle, or improve a screen, component, activity, fragment, or any Android interface in Compose.

Each skill directory contains:

```
SKILL.md              # entry point with workflow + frontmatter
anchors.md            # named aesthetic recipes (the only vocabulary allowed)
ban-patterns.md       # AI-slop patterns to detect and refuse
component-anatomy.md  # structural rules per component type
copy-voice.md         # banned buzzwords, tone guidance
icons-imagery.md      # icon + imagery policy
motion.md             # easing, duration, what to animate
verification.md       # self-audit checklist (gate before "done")
templates/            # drop-in config (tailwind, eslint, DESIGN_RULES, etc.)
```

---

## Contributing

This repo is the **source of truth**. If you installed via `scripts/install.sh`, your local `~/.claude/skills/ui-*` are symlinks into the repo, so edits take effect immediately — commit and push to publish.

```bash
# edit a skill
$EDITOR skills/ui-web/anchors.md

# it's already live locally (via symlink) — no reinstall needed
git add skills/ui-web/anchors.md
git commit -m "ui-web: add new anchor recipe"
git push
```

PRs welcome: new anchor recipes, additional ban patterns, tighter verification checklists.

---

## License

MIT — see [LICENSE](LICENSE).
