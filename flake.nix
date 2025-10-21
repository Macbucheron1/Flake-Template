{
  description = "Mes templates de flake";

  outputs = { self }: {
    templates = {

      c-dev = {
        description = "Environnment de développement C prêt à l'emploi";
        path = ./templates/c-dev;
        welcomeText = ''Exécute `nix develop` pour entrer dans l'env.'';
      };

      python-dev = {
        description = "Environnment de développement Python pret à l'emploi";
        path = ./templates/python-dev;
        welcomeText = ''Exécute `nix develop` pour entrer dans l'env.'';
      };

    };
  };
}
