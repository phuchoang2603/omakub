if ! command -v kubectl &>/dev/null; then
  echo "❗ kubectl not found. Installing..."
  cd /tmp || return 1
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  cd - || return 1
else
  echo "✅ kubectl is already installed."
fi

if ! command -v helm &>/dev/null; then
  echo "❗ helm not found. Installing..."
  cd /tmp || return 1
  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  chmod 700 get_helm.sh
  ./get_helm.sh
  cd - || return 1
else
  echo "✅ helm is already installed."
fi

if ! command -v kubectx &>/dev/null; then
  echo "❗ kubectx not found. Installing..."
  sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx || echo "Already cloned"
  sudo ln -sf /opt/kubectx/kubectx /usr/local/bin/kubectx
  sudo ln -sf /opt/kubectx/kubens /usr/local/bin/kubens
else
  echo "✅ kubectx is already installed."
fi

if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed google-cloud-cli-lite google-cloud-cli-gke-gcloud-auth-plugin
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
  echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
  sudo apt update && sudo apt install -y google-cloud-cli google-cloud-cli-gke-gcloud-auth-plugin
fi
