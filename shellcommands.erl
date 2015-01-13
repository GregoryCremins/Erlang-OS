-module(shellcommands).
-export([handleCom/1]).
handleCom(["load"| Tail]) -> 
	io:fwrite("Please input data separated by spaces. \n"),
	X = io:get_line("> "),
	DATA = string:token(X, " "),
	eos:main();
handleCom(["exit"]) ->
		io:fwrite("Exiting. \n");
		%send message to memory thread: shutdown
handleCom(["dateTime"]) ->
		io:fwrite("The date and time are: \n"),
		{Date={Year,Month,Day},Time={Hour,Minutes,Seconds}} = erlang:localtime(),
		io:fwrite(integer_to_list(Month)),
		io:fwrite("/"),
		io:fwrite(integer_to_list(Day)),
		io:fwrite("/"),
		io:fwrite(integer_to_list(Year)),
		io:fwrite("\n"),
		io:fwrite(integer_to_list(Hour)),
		io:fwrite(":"),
		io:fwrite(integer_to_list(Minutes)),
		io:fwrite(":"),
		io:fwrite(integer_to_list(Seconds)),
		io:fwrite("\n"),
		eos:main();
handleCom(["ver"]) ->
		io:fwrite("The version number is 1.0 \n"),
		eos:main();
handleCom("help") ->
		io:fwrite("Sorry help has been deactivated. \(heh.\) \n"),
		eos:main();
handleCom(["cls"]) ->
		%clear the screen
		eos:main();
handleCom(["man"]) ->
		%display the manual for the topic
		eos:main();
handleCom(["trace"]) ->
		io:fwrite("You think there is stack tracing in erlang!? HAH!\n"),
		eos:main();
handleCom(["rot13"]) ->
		%do rot thing
		eos:main();
handleCom(["status"]) ->
		%handle the status, print it
		eos:main();
handleCom(["whereami"]) ->
		io:fwrite("The wonderful world of erlang!\n"),
		eos:main();
handleCom([_]) ->
	io:fwrite("STUFF");
handleCom(_) ->
	io:fwrite("Invalid command.\n").
	%TRUE = ([help] == test);
	%eos:main().
load([H|T], process) ->
	