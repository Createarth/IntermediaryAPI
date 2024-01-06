#!/bin/bash

# Define the project directory
project_directory="$HOME/my_project"

# Create the project directory if it doesn't exist
mkdir -p "$project_directory"

# Navigate to the project directory
cd "$project_directory" || exit

# Function to create project structure
create_project_structure() {
    echo "Creating project structure..."
    mkdir -p Code/html Code/python Code/json Code/markdown \
             Styles/styles Styles/images Styles/videos Styles/icons Styles/backgrounds \
             Documents/about Documents/services Documents/contact Documents/resources \
             "Artificial Intelligence"
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

# Main execution
create_project_structure
create_readme_files
create_ai_files

# Make the project creation script executable
chmod +x create_project.sh

# Run the project creation script
./create_project.sh
