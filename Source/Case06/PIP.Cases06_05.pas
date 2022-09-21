﻿unit PIP.Cases06_05;

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
  i, j, t, e, x, y: integer;
  a: TArr2D_int;
  m: TArr_str;
begin
  m := ['', '美国', '英国', '法国', '德国', '意大利', '俄罗斯'];
  SetLength(a, 7, 7);

  for i := 0 to 6 do
    for j := 0 to 6 do
      a[i, j] := j;

  for i := 1 to 6 do
    a[0, i]:=1;
    
  a[1,1]=a[2,1]=a[3,1]=a[5,1]:=0;
  a[1,3]=a[2,3]=a[3,3]:=0;
  a[1,4]=a[2,4]=a[3,4]=a[5,4]=a[6,4]:=0;
  a[3,5]:=0;
  a[1,6]=a[3,6]=a[5,6]:=0;
  
  while a[0,1]+a[0,2]+a[0,3]+a[0,4]+a[0,5]+a[0,6]>0 do
  begin
    for i:=1 to 6 do
    begin
      if a[0,i]<>0 then
      begin
        e:=0;
        for j:=1 to 6 do
        begin
          if a[j,i] then
          begin
            x:= j;
            y:=i;
            e+=1;
          end;
          
          if e = 1 then
          begin
            for t:=1 to 6 do
              if t<>i then a[x,t]:=0;
              
            a[0,y]:=0;
          end;
        end;
      end;
    end;  
  end;
  
  WriteLn('矩阵最终状态为：');
end;

end.
