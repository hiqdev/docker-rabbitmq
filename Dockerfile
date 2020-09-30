FROM rabbitmq:3.8-management

ENV DELAYED_MESSAGE_PLUGIN_FILENAME=rabbitmq_delayed_message_exchange-3.8.0.ez
ENV DELAYED_MESSAGE_PLUGIN_URL=https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v3.8.0/$DELAYED_MESSAGE_PLUGIN_FILENAME

RUN apt-get update && \
    apt-get install -y wget && \
    update-ca-certificates && \
    apt-get clean && \
    wget -O $RABBITMQ_HOME/plugins/$DELAYED_MESSAGE_PLUGIN_FILENAME $DELAYED_MESSAGE_PLUGIN_URL && \
    rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange

