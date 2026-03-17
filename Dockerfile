FROM ghcr.io/openclaw/openclaw:latest

USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential curl git python3 python3-pip jq ca-certificates \
    openssh-client unzip wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# GitHub CLI
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list && \
    apt-get update && apt-get install -y gh && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Bun runtime
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:${PATH}"

# Global npm packages
RUN npm install -g vercel typescript tsx

# qmd — vector search memory backend (optional, falls back to Voyage)
RUN bun install -g https://github.com/tobi/qmd || echo "qmd install optional — falls back to Voyage"

USER node

# Foundry for node user (forge, cast, anvil, chisel)
RUN curl -L https://foundry.paradigm.xyz | bash && \
    /home/node/.foundry/bin/foundryup
ENV PATH="/home/node/.foundry/bin:${PATH}"

# Bun for node user
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/home/node/.bun/bin:${PATH}"

# Playwright browsers
ENV PLAYWRIGHT_BROWSERS_PATH=/home/node/.cache/ms-playwright
RUN npx -y playwright@latest install chromium

# Git config for commits on behalf of Claw
RUN git config --global user.name "Claw" && \
    git config --global user.email "claw@hackathon"
