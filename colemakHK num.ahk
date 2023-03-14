Process, Priority, , High
#NoTrayIcon
SetCapsLockState AlwaysOff
#NoEnv
SetBatchLines -1
ListLines Off

KeyHistory 1

altPressed = 0
mode3 = 0
qMode = 0

/*  
getLocale(){ 
	WinGet, WinID,, A
	ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0)
	InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt")
	If(!InputLocaleID){
		WinActivate, ahk_class WorkerW
		WinGet, WinID2,, ahk_class WorkerW
		ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID2, "UInt", 0)
		WinActivate, ahk_id %WinID%
		InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt")
	}
	;MsgBox, %InputLocaleID%
Return InputLocaleID
}

F11::
state := GetKeyState("CapsLock")
MsgBox, %state%
return
*/

^SC02D::
	SendInput ^x
return

^SC02C:: ;я xя x
	SendInput ^z
Return

^SC02E:: ;d с
	SendInput ^c
Return

^SC01F::^s

^SC021:: ; t
	SendInput ^f
return

^+SC014::^+t

#UseHook

<^>!CapsLock::
altPressed := 1
Loop{
	if(!GetKeyState("CapsLock", "p")){
		altPressed := 0
		Break
	}

	Sleep, 100
}

CapsLock & SC01E::
qMode := 1
Loop{
	if(!GetKeyState("A", "p")){
		qMode := 0
		Break
	}

	Sleep, 100

}
return

<^>!1::F1
<^>!2::F2
<^>!3::F3
<^>!4::F4
<^>!5::F5
<^>!6::F6

CapsLock & 7::F7
CapsLock & 8::F8
CapsLock & 9::F9
CapsLock & 0::F10
CapsLock & VKBD::F11
CapsLock & VKBB::F12

<^>!SC024::LCtrl
<^>!SC025::LShift
<^>!SC026::LAlt
<^>!SC027::Esc


!Tab::!Tab
return

CapsLock & SC020::LShift ; в s


CapsLock & SC021::LCtrl ; а t



CapsLock & SC012:: ; ф a

/*
	Send {LAlt Down}  ; Зажимаем LAlt
	KeyWait SC01E       ; Ждём отжатия клавиши
	Send {LAlt Up}    ; Отжимаем LAlt

*/
	if (qMode){
		SendInput {@}
	} 
	else {
		SendInput {$}
	}

Return
CapsLock & SC010::Tab ; й q
CapsLock & SC011::Esc ; ц w

CapsLock & SC02C::^z
CapsLock & SC02D::^x
CapsLock & SC02E::^c
CapsLock & SC02F::
	if (GetKeyState("Shift")){
		SendInput #v
	} 
	else {
		SendInput ^v
	}
return

CapsLock & SC014::^+t

; --------------------

CapsLock & SC01F:: ;ы r
	if(altPressed){
		mode3 := 1
		Loop{
			if(!GetKeyState("vk52", "p") && !GetKeyState("vk53", "p")){
				mode3 := 0
				Break
			}
			Sleep, 100
		}
	} 
	else if (GetKeyState("Alt")){
		SendInput #s
	} 
	else {
		SendInput ^s
	}
return

CapsLock & SC016:: ;г l
	if (mode3 = 1){
		SendInput {F7}
	}
	else if(altPressed){
		SendInput 7
	}
	else if (qMode){
		SendInput {#}
	} 
	else {
		SendInput {PgUp}
	}
return

CapsLock & SC017:: ;ш u
	if (mode3 = 1){
		SendInput {F8}
	}
	else if(altPressed){
		SendInput 8
	}
	else if (qMode){
		SendInput {`%}
	}
	else if (GetKeyState("Ctrl")){
		SendInput ^{Up}
	}
	else if (GetKeyState("Shift")){
		SendInput +{Up}
	}
	else {
		SendInput {Up}
	}
return

CapsLock & SC018:: ;щ y
	if (mode3 = 1){
		SendInput {F9}
	}
	else if(altPressed){
		SendInput 9
	}
	else if(qMode){
		SendInput {-}
	}
	else {
		Send {+}
	}
return

CapsLock & SC019:: ;щ y
	if (mode3 = 1){
		SendInput {F11}
	}
	else if (qMode){
		SendInput {vkC0} ;`
	}
	else if (GetKeyState("Ctrl")){
		SendInput ^{Delete}
	}
	else if (GetKeyState("Shift")){
	SendInput +{Delete}
	}
	else {
		SendInput {Delete}
	}
return

CapsLock & SC032:: ;г l
	if (mode3 = 1){
		SendInput {Blind}{F4}
	}
	else if(altPressed){
		SendInput 4
	}
	else if (qMode){
		SendInput {}}
	}
	else {
		SendInput {{}
	}
return

CapsLock & SC033:: ;б ,
	if (mode3 = 1){
		SendInput {Blind}{F5}
	}
	else if(altPressed){
		SendInput 5
	}
	else if (qMode){
		SendInput {]}
	}
	else {
		SendInput {[}
	}
return

CapsLock & SC034:: ;ю .
	if (mode3 = 1){
		SendInput {Blind}{F6}
	}
	else if(altPressed){
		SendInput 6
	}
	else if (qMode){
		SendInput {|}
	}
	else {
		SendInput {&}
	}
return

CapsLock & SC035:: ;г l
	if (qMode){
		SendInput {^}
	} 
	else {
		SendInput {\}
	}
return

CapsLock & SC031:: ;г l
	if (mode3 = 1){
		SendInput {Blind}{F10}
	}
	else if(altPressed){
		SendInput 0
	}
	else if (qMode){
		SendInput {)}
	}
	else {
		SendInput {(}
	}
return

CapsLock & SC023:: ;р m
	if (qMode){
		SendInput {_}
	} 
	else {
		SendInput {PgDn}
	}	
return

CapsLock & SC024:: ;о n 
	if (mode3){
		SendInput {Blind}{F1}
	}
	else if(altPressed){
		SendInput 1
	} 
	else if (qMode){
		SendInput {=}
	}
	else if (GetKeyState("Alt")){
		SendInput !{Left}
	}
	else if (GetKeyState("Ctrl")){
		SendInput ^{Left}
	}
	else if (GetKeyState("Shift")){
		SendInput +{Left}
	}
	else {
		SendInput {Left}
	}
return

CapsLock & SC025:: ;л e
	if (mode3 = 1){
		SendInput {Blind}{F2}
	}
	else if(altPressed){
		SendInput 2
	} 
	else if (qMode){
		SendInput {*}
	}
	else if (GetKeyState("Ctrl")){
		SendInput ^{Down}
	}
	else if (GetKeyState("Shift")){
		SendInput +{Down}
	}
	else {
		SendInput {Down}
	}
return

CapsLock & SC026:: ;д i
	if (mode3 = 1){
		SendInput {Blind}{F3}
	}
	else if(altPressed){
		SendInput 3
	}
	else if (qMode){
		SendInput {!}
	}
	else if (GetKeyState("Alt")){
		SendInput !{Right}
	}
	else if (GetKeyState("Ctrl")){
		SendInput ^{Right}
	}
	else if (GetKeyState("Shift")){
		SendInput +{Right}
	}
	else {
		SendInput {Right}
	}
return

CapsLock & SC027:: ;ж o
	if (mode3 = 1){
		SendInput {Blind}{F12}
	}
	else if (qMode){
		SendInput {?}
	}
	else if (GetKeyState("Ctrl")){
		SendInput ^{Backspace}
	}
	else if (GetKeyState("Shift")){
		SendInput +{Backspace}
	}
	else if(altPressed){
		SendInput {Backspace}
	}
	else {
		SendInput {Backspace}
	}
return

CapsLock & SC028:: ;э '
	if (qMode){
		SendInput {~}
	}
	else {
		SendInput {Blind}{Insert}
	}
return