// config.js
const config = {
  openai: {
    apiKey: process.env.OPENAI_API_KEY || '', // Retrieve API key from GitHub secret
  },
};

module.exports = config;

// app.js
const express = require('express');
const config = require('./config');
const fetch = require('node-fetch');
const app = express();
const PORT = process.env.PORT || 3000;

const RATE_LIMIT = 5;
const RATE_LIMIT_WINDOW = 60 * 1000;
const rateLimitMap = new Map();

const rateLimitMiddleware = (req, res, next) => {
  // ... (your rate limiting middleware logic)
};

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(rateLimitMiddleware);

// ... (your other routes and functions)

const apiKey = config.openai.apiKey;

// ... (continue with your code)

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
