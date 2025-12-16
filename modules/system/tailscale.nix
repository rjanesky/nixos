{ pkgs, ... }:

{
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };

    systemd.services.tailscale-serve-ollama = {
      description = "Expose Ollama via Tailscale Serve (tailnet-only)";
      after = [ "network-online.target" "tailscaled.service" "ollama.service" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = "${pkgs.tailscale}/bin/tailscale serve --bg --https=443 http://127.0.0.1:11434";
      };
  };
}