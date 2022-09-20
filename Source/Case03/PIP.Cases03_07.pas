unit PIP.Cases03_07;

{$mode objfpc}{$H+}
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
  i,x,y , last:integer;
begin
  last :=1;
  WriteLn('Input x and y:');
  WriteLn('13 13');
  x:=13;
  y:=13;
  
  for i:= 1 to y do
    last:= last*x mod 1000;
    
  WriteLnF('The last three digits is: %d.', [last]);
end;

end.

