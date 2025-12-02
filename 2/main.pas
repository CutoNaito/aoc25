program day2;
uses crt, SysUtils, math;

function StrToInt2(str: string): int64;
var
    result: int64;
    i, temp, len: integer;
begin
    str := Trim(str);
    result := 0;

    len := Length(str);
    i := len - 1;
    while i >= 0 do
    begin
        temp := StrToInt(Copy(str, i+1, 1));
        result := result + temp * Round(Power(10, len - 1 - i));
        i := i - 1;
    end;

    StrToInt2 := result;
end;

function find_invalid(first: int64; last: int64): int64;
var
	result: int64;
	left: string;
	right: string;	
begin
    result := 0;

	while first<=last do
	begin
        if IntToStr(first).Length mod 2 = 1 then
        begin
            first := first + 1;
            Continue;
        end;

		left := LeftStr(IntToStr(first), Round(IntToStr(first).Length / 2));
		right := RightStr(IntToStr(first), Round(IntToStr(first).Length / 2));

		if CompareStr(left, right) = 0 then
        begin
            result := result + first;
        end;

		first := first + 1;
	end;

    find_invalid := result;
end;

function part1(): int64;
var
	filename, first, last, tmp: string;
    data: widestring;
	myfile: text;
    i, len: int64;
    result: int64;
begin
	filename := './test';
	assign(myfile, filename);
	reset(myfile);
	readln(myfile, data);

    first := '';
    last := '';

    tmp := '';
    result := 0;
    len := Length(data);

    for i := 0 to len do
    begin
        if CompareStr(Copy(data, i+1, 1), '-') = 0 then
        begin
            first := tmp;
            tmp := '';
            Continue;
        end;

        if CompareStr(Copy(data, i+1, 1), '\r') = 0 then
            Continue;

        if CompareStr(Copy(data, i+1, 1), ',') = 0 then
        begin
            last := tmp;
            tmp := '';
            result := result + find_invalid(StrToInt2(first), StrToInt2(last));
            Continue;
        end;

        tmp := tmp + Copy(data, i+1, 1);
    end;
    
    last := tmp;
    result := result + find_invalid(StrToInt2(first), StrToInt2(last));

	part1 := result;
end;

begin
    writeln(part1());
end.
