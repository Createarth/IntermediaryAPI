#!/bin/bash

# API endpoint
API_URL="localhost:8000/v1/completions"

# Prompt input for website URL
read -p "Enter the website URL to pull information from: " WEBSITE_URL

# Check if the website URL is provided
if [ -z "$WEBSITE_URL" ]; then
    echo "Error: Please provide a website URL."
    exit 1
fi

# Prompt input for project name
read -p "Enter the name for the project: " PROJECT_NAME

# Check if the project name is provided
if [ -z "$PROJECT_NAME" ]; then
    echo "Error: Please provide a project name."
    exit 1
fi

# API request with the website URL as the prompt
RESPONSE=$(curl -s -X POST \
     --url "$API_URL" \
     --header "Content-Type: application/json" \
     --header "Accept: application/json" \
     --data "{
        \"prompt\": \"$WEBSITE_URL\"
     }")

# Check if the API request was successful
if [ $? -eq 0 ]; then
    # Display the response
    echo -e "\nAPI Response:"
    echo "$RESPONSE" | jq   # Assuming you have 'jq' installed for pretty-printing JSON
    
    # Create a project directory based on the project name
    PROJECT_DIRECTORY="$HOME/$PROJECT_NAME"
    mkdir -p "$PROJECT_DIRECTORY"
    
    # Navigate to the project directory
    cd "$PROJECT_DIRECTORY" || exit
    
    # Function to create project structure
    create_project_structure() {
        echo "Creating project structure..."
        mkdir -p Code/html Code/python Code/json Code/markdown \
                 Styles/styles Styles/images Styles/videos Styles/icons Styles/backgrounds \
                 Documents/about Documents/services Documents/contact Documents/resources "Artificial Intelligence"
    }
    
    # Function to create README files
    create_readme_files() {
        echo "Creating README files..."
        echo "This is the project's main README file." > README_MASTER.txt
        echo "This is the README file for the project." > "project master/README_PROJECT.txt"
    }
    
    # Function to create AI-related files
    create_ai_files() {
        echo "Creating AI related files..."
        ai_folder="Artificial Intelligence"
        echo "AI for Business" > "$ai_folder/AI_for_Biz.txt"
        echo "AI for Artists" > "$ai_folder/AI_for_Artists.txt"
        echo "AI for Entrepreneurs" > "$ai_folder/AI_for_Entre.txt"
        echo "AI for Music" > "$ai_folder/AI_for_Music.txt"
        echo "AI Chat Functionality" > "$ai_folder/AI_Chat_Function.txt"
        echo "AI Insights" > "$ai_folder/AI_Insights.txt"
        echo "AI Data Handling" > "$ai_folder/AI_Data_Handling.txt"
        echo "AI Assistants" > "$ai_folder/AI_Assistants.txt"
        echo "AI Cybersecurity" > "$ai_folder/AI_cybersecurity.txt"
        echo "AI Consumer Protection" > "$ai_folder/AI_consumer_protection.txt"
    }
    
    # Run project creation functions
    create_project_structure
    create_readme_files
    create_ai_files
    
    echo -e "\nProject created successfully in: $PROJECT_DIRECTORY"
    
else
    echo "Error: Failed to make API request."
    exit 1
fi
