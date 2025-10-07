# Mission: Help Anya Earn a Stella Star

![alt text](<anya_stella_star.gif>)

## 1. Mission Briefing
Welcome, agent. Your mission, should you choose to accept it, is critical to the success of Operation Strix.

Anya Forger's academic performance at Eden Academy is... inconsistent. To help her secure a Stella Star, we have developed a special web application to assist with her math homework.

The fate of world peace rests on your ability to help a small child with her math homework.

(OOC):
Your REAL objective is to find the vulnerability in this application, exploit it to retrieve a hidden flag, and then automate the process.

## 2. Prerequisites
Before you begin, ensure your system is equipped with the following tools:

Docker: To build and manage the application container.

A local Kubernetes cluster: We recommend `kind` or `minikube`.

A scripting language of your choice (e.g., Python, Bash, Go) for the final task.

## 3. Your Objectives
Your mission is divided into four distinct phases. Complete them in order.

### Phase 1: Build the Application
The application is containerized. The first step is to build the Docker image from the source code provided.

```
# Navigate to the project root and run:
docker build -t anya-math:latest .
```

### Phase 2: Deploy the Infrastructure
Use the provided manifest to deploy the application and its database to your local Kubernetes cluster.

The manifest is located at `kubernetes/deployment.yaml`.

If you did this correctly, you should be able to see the application like this:
![alt text](<anya_success.png>)

> [!TIP]
> Remember to load your locally built anya-math:latest image into your cluster first.

### Phase 3: Exploit the Vulnerability
The application is flawed. Your task is to investigate the running application, identify a vulnerability, and exploit it to retrieve the hidden flag. The flag is stored as a Kubernetes secret. The flag has the format like `ascenda{this_is_a_flag}`.

> [!NOTE]
> You have to exploit the web application, to retrieve the flag. Directly entering the container does not count!

### Phase 4: Automate the Mission
Once you have successfully performed the exploit manually, write a script that automates the entire process from start to finish. This will ensure Anya can get her homework done instantly in the future.

## 4. Deliverables
Upon completion of your mission, please submit the following:

The Flag: The value you retrieved from the application.

Your Exploit Script: The automated script from Phase 4.

A Brief Write-Up: A short report that includes:

A clear explanation of the vulnerability you discovered.

A step-by-step description of how your exploit works.

Clear instructions on how to run your script.

Good luck, agent. The success of this operation depends on you.

## 5. Disclaimer
Yes I did engage the help of an AI for this.