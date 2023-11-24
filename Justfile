install:
    yarn install
    yarn husky install
    brew install yamllint

rebuild-staging:
    git fetch
    git push origin --delete staging
    git branch -d staging
    git checkout main
    git pull
    git fetch && git checkout -b staging origin/main
    git push origin staging

lint:
    # lint Dockerfile
    docker run --rm -i hadolint/hadolint:fcbd01791c9251d83f2486e61ecaf41ee700a766-debian-arm64 < Dockerfile
    # lint markdown
    npx markdownlint-cli2 --fix "**/*.md"
    # prettier all files
    yarn prettier . --write --config ./.linters/config/.prettierrc --ignore-path ./.linters/config/.prettierignore
    # lint yaml. This goes after prettier because it doesn't actually fix anything.
    yamllint -c ./.linters/config/.yamllint.yml .
