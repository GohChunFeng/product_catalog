# The Assignment

The task is to develop a Product Catalog app based on the requirements below. Please complete it in the stack you indicated in your application (Flutter / Kotlin / Swift / React Native / Kotlin Multiplatform).

## Assignment Instructions

Build a small product catalog app using the free DummyJSON API (no key required):

- List: `GET https://dummyjson.com/products?limit=20&skip=0` (supports pagination via `skip`)
- Detail: `GET https://dummyjson.com/products/{id}`
- Search: `GET https://dummyjson.com/products/search?q=phone`

## Required features

1. Product list screen — title, thumbnail, and price per product
2. Pagination — load more items as the user scrolls (use the `skip` parameter)
3. Product detail screen — tap a product to see its full description, price, rating, and images
4. States — implement and visually distinguish: loading, error (with a **retry** button), empty, and success
5. Basic search — a search box filtering products (debounced; via the search endpoint or client-side — state which you chose and why)
6. Code organization — separate your code into at least 2 layers (e.g., data / UI, or domain / data / presentation)

## Bonus (not required, nice to have)

- Pull-to-refresh
- Image loading placeholder / error handling
- A unit test for your data or business logic
- Any small UI/UX detail you're proud of — mention it in your walkthrough video

## Expectations

- Time-box yourself to approximately 2–3 hours of work. It is completely fine to leave TODOs — list them in the README instead of polishing forever.
- Commit your work progressively as you go — we review commit history.
- Include a `README.md`: how to run the app, which stack you used, your architecture decisions, and anything you didn't finish.

## A Note on AI Usage

In today's environment, we understand that AI tools (such as ChatGPT or GitHub Copilot) are part of a modern developer's workflow. However, for the purpose of this assessment:

- **Minimal Usage:** AI should be used for guidance or research only.
- **Original Work:** The core logic, project structure, and architectural choices must be your own. We are hiring for your expertise and problem-solving skills, so we want to see your unique approach to the project.
- **Accountability:** You must be able to explain every line of code in your walkthrough video. Note in the README where you used AI assistance. Submitting code you cannot explain ends the process.

## Submission Instructions

Once you have completed the assignment within **7 days** of this email, please reply to this email (mobile-hiring@neurogine.com) with the following:

1. The GitHub link to your **public** repository containing the project, including:
   - **Publicly accessible** — please make sure the repository is set to Public (not Private), otherwise our reviewers cannot open it; keep it available until the recruitment process concludes
   - Your progressive commit history (a single squashed commit is a red flag)
   - The `README.md` as described above
2. A **short screen recording (max 5 minutes)** walking through the running app, your file structure, and one architectural decision you made. Narrate in your own words — this replaces a live code review.
3. An updated copy of your Resume/CV for our final review.

A smaller, working, well-organized app beats a big broken one — we evaluate how you handle the unglamorous parts (errors, loading states, edge cases) just as much as the features themselves.