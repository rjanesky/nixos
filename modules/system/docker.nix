{ pkgs, ... }:

{
    virtualisation.docker.enable = true;
    virtualisation.oci-containers.backend = "docker";

    virtualisation.oci-containers.containers = {
      searxng = {
        image = "searxng/searxng:latest";
        ports = [ "127.0.0.1:8080:8080" ];

        environment = {
          SEARXNG_BASE_URL = "http://127.0.0.1:8080/";
          SEARXNG_SETTINGS_PATH = "/etc/searxng/settings.yml";
        };

        volumes = [
          "/etc/searxng/settings.yml:/etc/searxng/settings.yml:ro"
        ];
      };
          
    open-webui = {
      image = "ghcr.io/open-webui/open-webui:main";

      # With host networking, DO NOT publish ports.
      extraOptions = [ "--network=host" ];

      environment = {
        # Make WebUI listen on 3000 instead of its default 8080
        PORT = "3000";

        # Ollama is on the host, so localhost works with host networking
        OLLAMA_BASE_URL = "http://127.0.0.1:11434";

        ENABLE_RAG_WEB_SEARCH = "True";
        RAG_WEB_SEARCH_ENGINE = "searxng";
        SEARXNG_QUERY_URL = "http://127.0.0.1:8080/search?q=<query>&format=json";
      };
    };
  };
}