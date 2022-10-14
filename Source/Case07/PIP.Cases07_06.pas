unit PIP.Cases07_06;

{$mode objfpc}{$J-}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

procedure Main;
var
  computer, people, spare: integer;
begin
  spare := 21;

  WriteLn('--------------------------------------------------');
  WriteLn('---------- 你不能战胜我， 不信试试 -----------------');
  WriteLn('--------------------------------------------------');
  WriteLn('Game begin:   ');
  WriteLn;

  while true do
  begin
    WriteLnF('---------- 日前还有火柴 %d 根 ----------', [spare]);
    Write('People:');
    ReadLn(people);

    if (people < 1) or (people > 4) or (people > spare) then
    begin
      WriteLn('你违规了，你取的火柴数有问题！');
      Continue;
    end;

    spare := spare - people;

    if spare = 0 then
    begin
      WriteLn(LineEnding + 'Computer win! Game Over!');
      Break;
    end;

    computer := 5 - people;
    spare := spare - computer;
    WriteLnF('Computer:%d ', [computer]);

    if spare = 0 then
    begin
      WriteLn(LineEnding + 'People Win! Game Over!');
      Break;
    end;
  end;
end;

end.
