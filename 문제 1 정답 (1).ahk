Gui, Font, S8 CDefault Bold, Verdana

Gui, Add, Text, x72 y29 w100 h30, 시작
Gui, Add, Edit, x72 y69 w110 h50 vA

Gui, Add, Text, x322 y29 w100 h40, 끝
Gui, Add, Edit, x322 y69 w110 h50 vB

Gui, Add, Button, x32 y189 w100 h30, 합
Gui, Add, Button, x272 y189 w100 h30, 나열

Gui, Add, Text, x72 y240 w300 h300 vResult

Gui, Show, w479 h379, Test
return

GuiClose:
ExitApp

GetSum(A, B){
	total := 0
	now := A
	count := B-A+1
	Loop, %count%
	{
		total += now
		now++
	}
	return total
}

GetSequence(A, B){
	result := ""
	now := A
	count := B-A+1
	Loop, %count%
	{
		result .= " " . now
		now++
	}
	return result
}

Button합:
Gui, Submit, NoHide
{

	;MsgBox %A% %B%

	if(!A || !B){
		MsgBox, 16, 입력 오류, 숫자만 입력 가능합니다.`n빈칸에 알맞은 숫자를 반드시 입력해야 합니다.
	}
	else if(A > B){
		MsgBox, 16, 입력 오류, 시작보다 끝이 큽니다.
	}
	else{
		total := GetSum(A, B)
		GuiControl,, Result, 합 : %total%
	}
}
return

Button나열:
Gui, Submit, NoHide
{
	;MsgBox %A% %B%

	if(!A || !B){
		MsgBox, 16, 입력 오류, 숫자만 입력 가능합니다.`n빈칸에 알맞은 숫자를 반드시 입력해야 합니다.
	}
	else if(A > B){
		MsgBox, 16, 입력 오류, 시작보다 끝이 큽니다.
	}
	else{
		result := GetSequence(A, B)
		GuiControl,, Result, 나열 : %result%
	}
}
return