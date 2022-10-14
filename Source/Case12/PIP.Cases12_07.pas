unit PIP.Cases12_07;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Linear.ArrayList,
  DeepStar.Utils,
  DeepStar.UString;

procedure Main;

implementation

const
  DataFileName = '../../Source/Case12/InFile_12_07.txt';
  OutFileName = 'student.dat';

type
  TStudent = record
    num: string[10];
    Name: string[10];
    score: array[0..2] of integer;
    avr: single;
  end;

  TList_TStudent = specialize TArrayList<TStudent>;

procedure Original_Case;
var
  f: file of TStudent;
  i, sum, j: integer;
  sl: TStringList;
  str: string;
  strs: TArr_str;
  stus: array of TStudent;
begin
  sl := TStringList.Create();
  try
    sl.LoadFromFile(CrossFixFileName(DataFileName));
    SetLength(stus, sl.Count);

    for i := 0 to sl.Count - 1 do
    begin
      str := sl[i];
      strs := str.Split([' ']);

      stus[i].num := strs[0];
      stus[i].Name := strs[1];
      stus[i].score[0] := strs[2].ToInteger;
      stus[i].score[1] := strs[3].ToInteger;
      stus[i].score[2] := strs[4].ToInteger;
      sum := 0;
      for j := 0 to High(stus[i].score) do
        sum += stus[i].score[j];
      stus[i].avr := sum / Length(stus[i].score);
    end;

    try
      AssignFile(f, OutFileName);
      Rewrite(f);

      for i := 0 to High(stus) do
      begin
        Write(f, stus[i]);
      end;
    finally
      CloseFile(f);
    end;
  finally
    sl.Free;
  end;
end;

procedure Wt();
var
  list: TList_TStudent;
  f: file of TStudent;
  i, sum, j: integer;
  sl: TStringList;
  str: string;
  strs: TArr_str;
  student: TStudent;
begin
  list := TList_TStudent.Create;
  try
    if FileExists(OutFileName) then
    begin
      try
        AssignFile(f, OutFileName);
        Reset(f);
        while not EOF(f) do
        begin
          Read(f, student);
          list.AddLast(student);
        end;
      finally
        CloseFile(f)
      end;
    end;

    sl := TStringList.Create();
    try
      sl.LoadFromFile(CrossFixFileName(DataFileName));

      for i := 0 to sl.Count - 1 do
      begin
        str := sl[i];
        strs := str.Split([' ']);

        student := Default(TStudent);
        student.num := strs[0];
        student.Name := strs[1];
        student.score[0] := strs[2].ToInteger;
        student.score[1] := strs[3].ToInteger;
        student.score[2] := strs[4].ToInteger;
        sum := 0;
        for j := 0 to High(student.score) do
          sum += student.score[j];
        student.avr := sum / Length(student.score);

        list.AddLast(student);
      end;

      try
        AssignFile(f, OutFileName);
        Rewrite(f);

        for i := 0 to list.Count - 1 do
        begin
          Write(f, list[i]);
        end;
      finally
        CloseFile(f);
      end;
    finally
      sl.Free;
    end;
  finally
    list.Free;
  end;
end;

procedure Rd();
var
  student: TStudent;
  f: file of TStudent;
  Count: integer;
begin
  Count := 0;

  if FileExists(OutFileName) then
  begin
    try
      AssignFile(f, OutFileName);
      Reset(f);

      while not EOF(f) do
      begin
        Read(f, student);
        Count += 1;
        WriteLnF('第%d条记录：', [Count]);
        WriteLnF('Student No. %s', [student.num]);
        WriteLnF('Student name: %s', [student.Name]);
        WriteLnF('Student score 1 %d', [student.score[0]]);
        WriteLnF('Student score 2 %d', [student.score[1]]);
        WriteLnF('Student score 3 %d', [student.score[2]]);
        WriteLnF('Student avr %.2f', [student.avr]);

        if not EOF(f) then
          DrawLineBlockEnd;
      end;
    finally
      CloseFile(f);
    end;
  end;
end;

procedure Main;
begin
  Wt;
  Rd;
end;

end.
