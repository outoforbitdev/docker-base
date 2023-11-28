install:
    yarn install
    yarn husky install
    brew install yamllint

rebuild-staging:
    git fetch
    git checkout staging
    git checkout main
    git push origin --delete staging
    git branch -d staging
    git pull
    git fetch && git checkout -b staging origin/main
    git push origin staging

lint:
    # lint Dockerfile
    docker run --rm -i -v ./.linters/config/hadolint.yaml:/.hadolint.yaml hadolint/hadolint:v2.12.0-debian < ASPNET_6/Dockerfile
    docker run --rm -i -v ./.linters/config/hadolint.yaml:/.hadolint.yaml hadolint/hadolint:v2.12.0-debian < DOTNET_SDK_6/Dockerfile
    docker run --rm -i -v ./.linters/config/hadolint.yaml:/.hadolint.yaml hadolint/hadolint:v2.12.0-debian < NODE/Dockerfile
    # lint markdown
    npx markdownlint-cli2 --fix "**/*.md"
    # prettier all files
    yarn prettier . --write --config ./.linters/config/.prettierrc --ignore-path ./.linters/config/.prettierignore
    # lint yaml. This goes after prettier because it doesn't actually fix anything.
    yamllint -c ./.linters/config/.yamllint.yml .
