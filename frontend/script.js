// Placeholder API URL - you will replace this with your actual API Gateway endpoint
// after Terraform finishes applying.
const apiUrl = "https://29jobioay3.execute-api.eu-north-1.amazonaws.com/count";

async function getVisitorCount() {
    try {
        const response = await fetch(apiUrl, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
        });
        
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        
        const data = await response.json();
        document.getElementById('counter').innerText = data.views;
    } catch (error) {
        console.error("Could not fetch visitor count:", error);
        document.getElementById('counter').innerText = "Error loading count";
    }
}

// Call the function on page load
if (apiUrl !== "REPLACE_ME_WITH_API_ENDPOINT") {
    getVisitorCount();
} else {
    document.getElementById('counter').innerText = "API NOT CONFIGURED";
}

// Back to Top functionality
const backToTopBtn = document.getElementById("backToTop");

if (backToTopBtn) {
    window.addEventListener("scroll", () => {
        // Reduced threshold to 100px and added documentElement fallback for better browser support
        if (window.scrollY > 100 || document.documentElement.scrollTop > 100) {
            backToTopBtn.classList.add("show");
        } else {
            backToTopBtn.classList.remove("show");
        }
    });

    backToTopBtn.addEventListener("click", (e) => {
        e.preventDefault();
        window.scrollTo({
            top: 0,
            behavior: "smooth"
        });
    });
}