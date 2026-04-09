# Copy & Voice (iOS)

Real copy is non-negotiable. The fastest tell of AI slop is "Lightning fast / Built for iOS" lorem-ipsum-with-buzzwords. iOS adds platform conventions on top of the universal rules.

## Hard bans (never write these)

See `ban-patterns.md` § 2 for the full list. Headline:

- "Lorem ipsum"
- "Lightning fast" / "Blazing fast"
- "Built for iOS" / "Built for the modern X"
- "Powered by AI"
- "Unleash the power of"
- "Get started in seconds"
- "The future of X"
- "Beautiful and intuitive"
- "Seamlessly integrate"
- "Effortlessly"
- "Reimagined" / "Redesigned"

Plus generic CTA labels: "Get Started", "Learn More", "Click Here", "Submit", "Continue" (without object), "Tap to begin".

## Required behavior when copy is needed

If the user has not given you the copy AND you don't have enough context to write it specifically:

```
STOP. Ask the user:
"I need real copy for [section]. Tell me:
 1. What does this product/feature actually do (one sentence, no marketing)?
 2. Who is it for (specific role)?
 3. What's the single most important thing the headline should say?"
```

Do NOT invent product positioning. Do NOT use placeholder copy and tell the user "replace later".

## iOS platform conventions (HIG-aligned)

- **Cancel always on the leading edge**, primary action on the trailing edge of a `.toolbar` or alert. Never reverse.
- **"Done", "Cancel", "Save", "Edit"** — capitalize them. They're proper nouns of the platform's button vocabulary.
- **Body copy is sentence case.** Headlines and section titles can be either sentence case (default) or Title Case for marketing surfaces — match the chosen anchor.
- **Section headers in `Form`** are sentence case (Apple's own Settings app convention): "Notifications", not "NOTIFICATIONS".
- **Tab labels are nouns**, max 1 word ideally: "Library", "Search", "Listen Now", "Browse". Never verbs ("Search now") or sentences.
- **Alert titles are complete questions** for confirmations: "Delete this draft?" — not "Delete draft" (a fragment).
- **Destructive button labels say what they do**: "Delete Draft" (Title Case in alerts/dialogs is Apple's convention), not "Yes" or "OK".
- **Permission prompts**: when prompting Apple's standard alerts (camera, location, notifications), the supporting `*UsageDescription` Info.plist string is a real sentence ending in a period. "Daylight uses your location to show sunrise and sunset times for where you are." Never "We need your location."

## Headline rules

- One claim, not three. Not "Fast, secure, and beautiful — the all-in-one X."
- Specific verbs over abstract nouns. "Imports 10,000 photos in under a minute" not "Optimized performance."
- Numbers when you have them. Not when you don't.
- Length: ≤ 8 words for `.largeTitle`, ≤ 60 chars for hero on landing/onboarding.
- Avoid colon constructions ("X: the Y for Z") unless the user's voice already uses them.

## Subhead rules

- One sentence. ≤ 22 words.
- Says WHAT and FOR WHO. Not why-it-matters or how-it-feels.
- Plain language. If a 14-year-old wouldn't understand a word, replace it.

## Button labels

- Verb-led, specific. "Start a 14-day trial" not "Get Started". "Open Library" not "Continue". "Add Note" not "Submit".
- ≤ 4 words.
- Sentence case for in-flow buttons (`.borderedProminent`); Title Case for alert/dialog primary buttons (Apple convention).
- Toolbar items: single word when possible — "Save", "Done", "Edit". Capitalize.

## Empty state copy

Use `ContentUnavailableView`. Format: `[What's missing] + [why you'd want one] + [exact next action]`.

Good:
- Title: "No projects yet"
- Description: "Projects group your work and let you share with teammates."
- Action: "Create your first project"

Bad:
- Title: "No data found"
- Description: "Get started by creating a project."
- Action: "Get Started"

## Error message copy

Format: `[What happened in plain language] + [what to do about it]`

Good: "We couldn't reach iCloud. Check your connection and try again — your draft is saved on this device."
Bad: "Error: Network request failed (500)"

If you don't know the cause, ask for it. Don't ship a generic "Something went wrong".

## Microcopy patterns

| Context | Forbidden | Allowed |
|---|---|---|
| Sign-up CTA | "Get Started" | "Create your free account" |
| Confirm delete | "Are you sure?" | "Delete `<name>` permanently? This can't be undone." |
| Loading | "Loading…" | "Indexing 1,247 photos (00:42 remaining)" |
| Success toast | "Success!" | "Saved to Drafts" |
| Empty inbox | "No items" | "Inbox is empty. New mentions will show up here." |
| Sign-in prompt | "Sign in to continue" | "Sign in to sync your library across devices" |
| Permission denied | "Access denied" | "Camera access is off. Turn it on in Settings to scan documents." |
| Pull-to-refresh hint | "Pull to refresh" | (do not show — the gesture is platform vocabulary; don't label it) |

## Voice

The voice comes from the chosen anchor:
- **Linear/Vercel**: terse, present-tense, technical. "Ships in 2 weeks." "Renders instantly."
- **Stripe**: confident, calm, declarative. "Build a global business with one integration."
- **Notion**: warm, conversational, second-person. "Everything you need, in one place you'll actually open."
- **Editorial**: long-form, considered, paragraph-shaped. Three sentences, not three bullets.
- **Apple Music / Apple-native**: aspirational, sensory, Title Case for emphasis. "Built for All Day. And Then Some."
- **Brutalist**: blunt, capslock optional, anti-marketing. "WE MADE A THING. IT WORKS."

## Final check

After writing any copy: read it aloud. If it sounds like a SwiftUI tutorial onboarding screen, rewrite it. If it has the words "seamless", "intuitive", or "powerful", rewrite it.
