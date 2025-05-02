# Autofreq is a tool that automatically adjusts the CPU frequency based on the current workload.
paru -S --noconfirm --needed auto-cpufreq
sudo systemctl mask power-profiles-daemon.service
sudo systemctl enable --now auto-cpufreq
sudo systemctl start auto-cpufreq.service

