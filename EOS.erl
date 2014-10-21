-module(eos).
-export([startOS/0, main/0]).
startOS() ->
  eos:main(),
  %spawn memory process
  MEM_PID = spawn(memory, running, []),
  MEM_PID ! startup.

main() -> 

X = io:get_line("> "),
LEN = string:len(X) - 1,
CI = string:substr(X, 1, LEN),
shellcommands:handleCom(CI).

