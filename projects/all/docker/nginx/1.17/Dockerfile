FROM nginx:1.17

ARG USER_ID
ARG GROUP_ID

RUN usermod -u ${USER_ID} nginx && groupmod -g ${GROUP_ID} nginx

STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]


