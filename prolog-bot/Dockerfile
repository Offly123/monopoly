FROM swipl:9.2.9

WORKDIR /app/prolog-bot

COPY . .

CMD ["swipl", "-g", "server(8081)", "-t", "halt", "--", "prolog_server.pl"]