:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_cors)).

:- set_setting_default(http:cors, [*]).

% Маршруты
:- http_handler('/bot/decision', handle_decision, [method(post)]).
:- http_handler('/health', handle_health, [method(get)]).

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

handle_health(_Request) :-
    format('Content-type: text/plain~n~n'),
    format('OK').

handle_decision(Request) :-
    cors_enable(Request, [methods([post])]),
    http_read_json_dict(Request, GameState),
    find_best_move(GameState, Decision),
    reply_json_dict(Decision).

% Логика бота для Монополии
find_best_move(GameState, Decision) :-
    player_money(GameState, Money),
    available_properties(GameState, Properties),
    determine_strategy(GameState, Strategy),
    make_decision(Strategy, Money, Properties, Decision).

determine_strategy(GameState, aggressive) :-
    player_money(GameState, Money),
    Money > 1000.

determine_strategy(_GameState, conservative).

make_decision(aggressive, Money, Properties, buy(Property)) :-
    Property =.. [property, Price, _],
    Price < Money * 0.7,
    member(Property, Properties).

make_decision(conservative, _Money, _Properties, pass).