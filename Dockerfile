FROM ghcr.io/openclaw/openclaw:latest

USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential curl git python3 jq ca-certificates && \
    apt-get clean

USER node
ENV PLAYWRIGHT_BROWSERS_PATH=/home/node/.cache/ms-playwright
RUN npx -y playwright@latest install chromium

USER root
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["node", "dist/index.js"]
