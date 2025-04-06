# k8s-ghcr-private-deployment
“This project demonstrates how to deploy private container images from GitHub Container Registry into a Kubernetes cluster using imagePullSecrets and RBAC best practices.”

🎯 Goal:
🔹 Build & push your own image to ghcr.io
🔹 Pull & deploy it in Kubernetes securely using a Secret

🧱 Prerequisites:
🔹 A GitHub account
🔹 Docker installed (docker --version)
🔹 GitHub PAT with read:packages, write:packages, and (optional) repo
🔹 GitHub CLI (gh) or logged-in Docker to GitHub registry

✅ Step-by-Step: Push Image to ghcr.io
🔹 Step 1: Login to GitHub Container Registry
echo ghp_YourTokenHere | docker login ghcr.io -u your-github-username --password-stdin

✅ Output should say: Login Succeeded

🔹 Step 2: Create a Simple Dockerfile
Create a folder and a basic image:
mkdir my-k8s-app && cd my-k8s-app

🔹 Create a file Dockerfile:
FROM nginx:alpine
RUN echo "Hello from Rajesh's Private Image on GHCR!" > /usr/share/nginx/html/index.html

🔹 Build the image:
docker build -t ghcr.io/<your-username>/my-k8s-app:latest .
Example:
docker build -t ghcr.io/rajesh-dev/my-k8s-app:latest .

🔹 Step 3: Push the Image to GitHub Container Registry
docker push ghcr.io/rajesh-dev/my-k8s-app:latest
✅ This uploads your image to https://github.com/rajesh-dev/packages

🔹 Step 4: (Optional) Make Image Public
By default, GHCR images are private.
To make it public, go to: 👉 GitHub → Profile → Packages → Click your image → ⚙️ Settings → Change to Public


🚀 Step-by-Step: Deploy It in Kubernetes
🔹 Step 5: Create a Namespace
kubectl create namespace dev

🔹 Step 6: Create the imagePullSecret file (k8s/secret-create.sh)

🔹 Step 7: Deploy the Pod Using Your Image
Create deployment.yaml:

Apply it:
kubectl apply -f deployment.yaml

🔹 Step 8: Expose with a Service (Optional)
kubectl expose deployment private-nginx --type=NodePort --port=80 -n dev

Check the NodePort:
kubectl get svc -n dev

Access the app:
curl http://<node-ip>:<node-port>

✅ Done! You:
Built and pushed your own container image to ghcr.io
Created a secure imagePullSecret
Deployed it in Kubernetes using the secret
(Optional) Made it accessible via NodePort









