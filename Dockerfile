FROM getgauge/taiko

ENV GAUGE_TELEMETRY_ENABLED=false

USER root
RUN chown -R node:node /tmp && chmod 755 /gauge
USER node

WORKDIR /gauge

RUN gauge telemetry off
RUN gauge install js
RUN gauge install html-report

RUN echo '{\
  "Language": "js",\
  "Plugins": [\
  "html-report"\
  ]\
  }'\
  >> /gauge/manifest.json

COPY package.json /gauge/package.json
COPY package-lock.json /gauge/package-lock.json

RUN npm ci

CMD gauge run specs
