FROM image-registry.openshift-image-registry.svc:5000/integration-patform-dev/wso2am:4.2.0.0
# Replacing web xml file in oauth2 web app
ARG APIM_HOME=/home/wso2carbon/wso2am-4.2.0

COPY lib/  ${APIM_HOME}/repository/components/lib
COPY dropins/  ${APIM_HOME}/repository/components/dropins
COPY security/ ${APIM_HOME}/repository/resources/security
COPY cipher-config/ ${APIM_HOME}/repository/conf/security/
COPY bin/ ${APIM_HOME}/bin
COPY password-tmp ${APIM_HOME}
# COPY webapps/admin/site/public/conf/ ${APIM_HOME}/repository/deployment/server/webapps/admin/site/public/conf/
# COPY webapps/devportal/site/public/theme/ ${APIM_HOME}/repository/deployment/server/webapps/devportal/site/public/theme/
# COPY webapps/publisher/site/public/conf/ ${APIM_HOME}/repository/deployment/server/webapps/publisher/site/public/conf/

USER root
RUN chown wso2carbon:wso2 -R ${APIM_HOME}/bin/api-manager.sh
RUN chown wso2carbon:wso2 -R ${APIM_HOME}/repository/conf/security/secret-conf.properties
RUN chown wso2carbon:wso2 -R ${APIM_HOME}/password-tmp
# RUN chown wso2carbon:wso2 -R ${APIM_HOME}/repository/deployment/server/webapps/admin/site/public/conf/settings.json
# RUN chown wso2carbon:wso2 -R ${APIM_HOME}/repository/deployment/server/webapps/devportal/site/public/theme/settings.json
# RUN chown wso2carbon:wso2 -R ${APIM_HOME}/repository/deployment/server/webapps/publisher/site/public/conf/settings.json
