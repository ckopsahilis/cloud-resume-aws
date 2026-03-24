# Frontend - Cloud Resume Challenge

This directory contains the user interface components of the Cloud Resume project. The design follows a strict "Senior Frontend Engineer" dark-theme dashboard aesthetic.

## Architecture
- **Structure**: Vanilla HTML5 grid and flexbox layouts. Avoids heavy frameworks like React purely to ensure lean static hosting in S3.
- **Styling**: Vanilla CSS3 using detailed CSS Variables for dark mode and specific class isolation for formatting text explicitly (no badge SVGs, no emojis). 
- **Interactivity**: ES6 Vanilla JavaScript utilizing the native `fetch` API.

## Files
1. `index.html`: The markup foundation containing strict text definitions, structured professional timelines (Education & Hackathons), and Project grids.
2. `style.css`: Features variables like `--bg-dark`, `--accent-cyan`, standard dark borders, and responsive `@media` query stacking.
3. `script.js`: Reaches out asynchronously to the deployed Amazon API Gateway endpoint to ping the Lambda logic and visually display the database incrementation live on the screen. 

## Testing locally
You can load these files locally in any browser during development. However, ensure the `apiUrl` assigned in `script.js` directly correctly points towards your real AWS infrastructure.