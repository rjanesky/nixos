{ pkgs, ... }:

{
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };

    systemd.services.tailscale-serve-openwebui = {
      description = "Expose Open WebUI over Tailscale Serve (tailnet-only)";
      after = [ "network-online.target" "tailscaled.service" "docker-open-webui.service" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;

        # Optional but helpful: clear any previous serve config before re-applying.
        ExecStartPre = "${pkgs.tailscale}/bin/tailscale serve reset";

        # Publish Open WebUI (running locally on :3000) via HTTPS on your tailnet.
        ExecStart = "${pkgs.tailscale}/bin/tailscale serve --bg --https=443 http://127.0.0.1:3000";
      };
    };
}