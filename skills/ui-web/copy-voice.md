# Copy & Voice (Web)

Real copy is non-negotiable. The fastest tell of AI slop is "Lightning fast / Built for the modern web" lorem-ipsum-with-buzzwords. This file is the rule set.

## Hard bans (never write these)

See `ban-patterns.md` § 2 for the full list. Headline:

- "Lorem ipsum"
- "Lightning fast" / "Blazing fast"
- "Built for the modern X"
- "Powered by AI"
- "Unleash the power of"
- "Get started in seconds"
- "The future of X"
- "Beautiful and intuitive"
- "Seamlessly integrate"
- "Effortlessly"
- "Reimagined" / "Redesigned"

Plus generic CTA labels: "Get Started", "Learn More", "Click Here", "Submit".

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

## Headline rules

- One claim, not three. Not "Fast, secure, and beautiful — the all-in-one X."
- Specific verbs over abstract nouns. "Renders 1M rows in 80ms" not "Optimized performance."
- Numbers when you have them. Not when you don't.
- Length: ≤ 8 words (display), ≤ 60 chars (hero on landing).
- Avoid colon constructions ("X: the Y for Z") unless the user's voice already uses them.

## Subhead rules

- One sentence. ≤ 22 words.
- Says WHAT and FOR WHO. Not why-it-matters or how-it-feels.
- Plain language. If a 14-year-old wouldn't understand a word, replace it.

## Button labels

- Verb-led, specific to the action. "Start a 14-day trial" not "Get Started". "Read the docs" not "Learn More". "Add a column" not "Submit".
- ≤ 4 words.
- Sentence case (default) unless brutalist anchor (uppercase) or editorial anchor (small-caps optional).

## Empty state copy

Format: `[What's missing] + [why you'd want one] + [exact next action]`

✅ "No projects yet. Projects group your work and let you share with teammates. Create your first project to start."
❌ "No data found. Get started by creating a project."

## Error message copy

Format: `[What happened in plain language] + [what to do about it]`

✅ "We couldn't reach the server. Check your connection and try again — your draft is saved locally."
❌ "Error: Network request failed (500)"

If you don't know the cause, ask for it. Don't ship a generic "Something went wrong".

## Microcopy patterns

| Context | Forbidden | Allowed |
|---|---|---|
| Sign-up CTA | "Get Started" | "Create your free account" |
| Confirm delete | "Are you sure?" | "Delete `<item name>` permanently? This can't be undone." |
| Loading | "Loading..." | "Indexing 1,247 documents (00:42 remaining)" |
| Success toast | "Success!" | "Saved to *Drafts*" |
| 404 page | "Page not found" | "We couldn't find that page. It may have been moved or deleted." + a link back |
| Login prompt | "Sign in to continue" | "Sign in to save your changes" |

## Voice

The voice comes from the chosen anchor:
- **Linear/Vercel**: terse, present-tense, technical. "Ships in 2 weeks." "Renders instantly."
- **Stripe**: confident, calm, declarative. "Build a global business with one integration."
- **Notion**: warm, conversational, second-person. "Everything you need, in one place you'll actually open."
- **Editorial**: long-form, considered, paragraph-shaped. Three sentences, not three bullets.
- **Apple**: aspirational, sensory, capitalized for emphasis. "Built for All Day. And Then Some."
- **Brutalist**: blunt, capslock optional, anti-marketing. "WE MADE A THING. IT WORKS."

## Final check

After writing any copy: read it aloud. If it sounds like a Tailwind tutorial landing page, rewrite it.
