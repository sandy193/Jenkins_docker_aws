STEP 1
Check if Git is installed by running: 
git --version

STEP 2
Clone Your Repository:
1. Go to your GitHub repository in the browser.
2. Copy the repository URL (HTTPS or SSH).
3. Clone the repository to your local machine: git clone <your-repository-url>
4. Navigate into the project directory:cd <your-project-directory>

STEP 3
Create a Jenkinsfile:
1. Open a text editor:
Use any code editor like Visual Studio Code, Sublime Text, or even vim or nano in the terminal.

2. Create the Jenkinsfile:
Create a new file named Jenkinsfile (no file extension) in the root directory of your project.

3. Write the Pipeline Code

STEP 4
Save and Push the Jenkinsfile

1. Save the Jenkinsfile in your project directory.
2. Open your terminal in the project directory.
3. Check the status of your repository:
   git status
4. Add the file to the staging area:
   git add Jenkinsfile
5. Commit the changes:
   git commit -m "Add Jenkinsfile for CI/CD pipeline"
6. Push the changes to GitHub:
   git push origin main

   "VERIFY in GitHub."