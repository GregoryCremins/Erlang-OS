-module(memory).
-export([running/0, memCommandLoop/1]).
running() ->
	io:fwrite("Memory started"),
	MEM = dict:new(),
	memCommandLoop(MEM),
	io:fwrite("Memory has ended, thank you for your business").
memCommandLoop(dict) when is_tuple(dict) andalso element(1, dict) =:= dict ->
	receive
		load ->
			STRIPPED = string:strip(msg, both, $\s),
			NEWMEM = memory:load(STRIPPED,dic),
			memory:memCommandLoop(NEWMEM);
		show ->
			memory:show(dic),
			memory:memCommandLoop(dic);
		shutdown ->
			io:fwrite("Memory shutting down")
	end,
	io:fwrite("thingy");
memCommandLoop(_) ->
	io:fwrite("POOP").

	
load(msg, dic) ->
	X = string:length(msg) rem 2,
	if
		X == 0 ->
			HEX = string:substring(msg, 0, index),
			dict:append(memory, HEX, dic);
			
		true ->
			io:fwrite("Error in load")
	end.
	
show(dic) ->
	MEMORY = dict:fetch(memory, dic),
	io:fwrite(MEMORY + "").
	
	
			
			