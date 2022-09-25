unit PIP.Cases07_02;

{$mode objfpc}{$H+}{$J+}
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
  n, k, x, y, cc, pc, g: integer;
begin
  WriteLn('More Mountain Game');
  WriteLn('Game Begin');
  pc := 0;
  cc := 0;
  g := 1;

  while true do
  begin
    WriteLnF('No. %d game ', [g]);
    g += 1;
    WriteLn('-----------------');
    Write('How many mountains are there?');
    ReadLn(n);

    if not n = 0 then
      Break;

    Write('How many muontains ar allowed to each time?');
    repeat
      ReadLn(k);
      if (k > n) or (k < 1) then
        WriteLn('Repeat again!');
    until (k <= n) or (k >= 1);

    repeat
      Write('How many mountains do you wish move away?');
      ReadLn(x);

      if (x < 1) or (x > k) or (x > n) then
      begin
        WriteLn('IIIagal, again please!');
        Continue;
      end;

      n -= x;
      WriteLnF('There are %d mountains left now.', [n]);

      if n = 0 then
      begin
        WriteLn('.........I win. You are failure...........');
        cc += 1;
      end
      else
      begin
        y := (n - 1) mod (k + 1);

        if y = 0 then
          y := 1;

        n -= y;

        WriteLnF('Computer move %d mountains away.', [y]);

        if n <> 0 then
          WriteLnF('There are %d mountains left now.', [n])
        else
        begin
          WriteLn('..........I am failure. You win............');
          pc += 1;
        end;
      end;
    until n = 0;
  end;

  WriteLnF('Games in total have been played %d.', [cc + pc]);
  WriteLnF('You score is win %d, lose %d.', [pc, cc]);
  WriteLnF('My score is win %d, lose %d.', [cc, pc]);
end;

end.
