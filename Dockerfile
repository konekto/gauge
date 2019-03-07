FROM getgauge/taiko

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

CMD gauge run specs
