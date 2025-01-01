
document.addEventListener("DOMContentLoaded", () => {
    let web3;

    // Connect wallet
    const connectWalletButton = document.getElementById("connectWallet");
    connectWalletButton.addEventListener("click", async () => {
        if (window.ethereum) {
            web3 = new Web3(window.ethereum);
            try {
                await window.ethereum.request({ method: "eth_requestAccounts" });
                alert("Wallet connected!");
            } catch (err) {
                alert("Connection failed: " + err.message);
            }
        } else {
            alert("Please install Metamask!");
        }
    });

    // Post tweet
    const postTweetButton = document.getElementById("postTweet");
    postTweetButton.addEventListener("click", async () => {
        const tweetInput = document.getElementById("tweetInput");
        const tweetContent = tweetInput.value.trim();
        if (!tweetContent) {
            alert("Tweet cannot be empty!");
            return;
        }

        // Placeholder: Call smart contract to post tweet
        console.log("Posting tweet:", tweetContent);

        // Update UI (placeholder)
        const tweetsList = document.getElementById("tweetsList");
        const newTweet = document.createElement("div");
        newTweet.className = "tweet";
        newTweet.innerHTML = `
            <p>${tweetContent}</p>
            <button class="likeButton">Like</button> <span class="likeCount">0</span>
        `;
        tweetsList.appendChild(newTweet);

        tweetInput.value = "";
    });

    // Handle like/unlike (placeholder)
    document.getElementById("tweetsList").addEventListener("click", (event) => {
        if (event.target.classList.contains("likeButton")) {
            const likeCount = event.target.nextElementSibling;
            const currentCount = parseInt(likeCount.textContent, 10);
            likeCount.textContent = currentCount + 1; // Increment like count
        }
    });
});
