$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type sle_key from singlelineedit within w_main
end type
type st_3 from statictext within w_main
end type
type st_2 from statictext within w_main
end type
type st_1 from statictext within w_main
end type
type mle_output from multilineedit within w_main
end type
type mle_input from multilineedit within w_main
end type
type cb_decode from commandbutton within w_main
end type
type cb_encode from commandbutton within w_main
end type
end forward

global type w_main from window
integer width = 2318
integer height = 1328
boolean titlebar = true
string title = "PowerBuilder Base64 With Key"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_key sle_key
st_3 st_3
st_2 st_2
st_1 st_1
mle_output mle_output
mle_input mle_input
cb_decode cb_decode
cb_encode cb_encode
end type
global w_main w_main

type prototypes
Function Int b64_size(ULong size,ULong flag) Library "des64.dll" Alias For "b64_size;Ansi"
Function Int b64_des(Ref String In,Ref String out,String Key,ULong size,ULong flag)Library "des64.dll" Alias For "b64_des;Ansi"

end prototypes
forward prototypes
public function string wf_encode (string as_source, string as_key)
public function string wf_decode (string as_source, string as_key)
end prototypes

public function string wf_encode (string as_source, string as_key);//====================================================================
// Function: w_main.wf_encode()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value	string	as_source	
// 	value	string	as_key   	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/01/06
//--------------------------------------------------------------------
// Usage: w_main.wf_encode ( string as_source, string as_key )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_size
String ls_result

If IsNull(as_Source) Or Trim(as_Source) = '' Or &
	IsNull(as_Key)    Or Trim(as_Key) = '' Then
	Return ''
End If

Space(ll_size)
ll_size = b64_size(Len(as_Source),1)
ls_result = Space(ll_size)
b64_des(as_Source,ls_result,as_Key,Len(as_Source),1)

Return ls_result

end function

public function string wf_decode (string as_source, string as_key);//====================================================================
// Function: w_main.wf_decode()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value	string	as_source	
// 	value	string	as_key   	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/01/06
//--------------------------------------------------------------------
// Usage: w_main.wf_decode ( string as_source, string as_key )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long	 ll_size
String ls_result

If IsNull(as_Source) Or Trim(as_Source) = '' Or &
	IsNull(as_Key)    Or Trim(as_Key) = '' Then
	Return ''
End If

Space(ll_size)
ll_size = b64_size(Len(as_Source),0)
ls_result = Space(ll_size)
b64_des(as_Source,ls_result,as_Key,Len(as_Source),0)

Return ls_result

end function

on w_main.create
this.sle_key=create sle_key
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.mle_output=create mle_output
this.mle_input=create mle_input
this.cb_decode=create cb_decode
this.cb_encode=create cb_encode
this.Control[]={this.sle_key,&
this.st_3,&
this.st_2,&
this.st_1,&
this.mle_output,&
this.mle_input,&
this.cb_decode,&
this.cb_encode}
end on

on w_main.destroy
destroy(this.sle_key)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_output)
destroy(this.mle_input)
destroy(this.cb_decode)
destroy(this.cb_encode)
end on

type sle_key from singlelineedit within w_main
integer x = 366
integer y = 32
integer width = 951
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "SecretKey"
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_main
integer x = 64
integer y = 696
integer width = 343
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Output Text:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_main
integer x = 64
integer y = 180
integer width = 329
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Input Text:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_main
integer x = 50
integer y = 44
integer width = 315
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Secret Key:"
boolean focusrectangle = false
end type

type mle_output from multilineedit within w_main
integer x = 50
integer y = 784
integer width = 2167
integer height = 400
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type mle_input from multilineedit within w_main
integer x = 50
integer y = 260
integer width = 2167
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "https://programmingmethodsit.com/"
borderstyle borderstyle = stylelowered!
end type

type cb_decode from commandbutton within w_main
integer x = 1664
integer y = 32
integer width = 297
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Decode"
end type

event clicked;String  ls_input, ls_key,  ls_output

ls_key = sle_key.Text
ls_input = mle_input.Text

ls_output =  wf_decode(ls_input, ls_key)

mle_output.Text = ls_output


end event

type cb_encode from commandbutton within w_main
integer x = 1353
integer y = 32
integer width = 297
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Encode"
end type

event clicked;String  ls_input, ls_key,  ls_output

ls_key = sle_key.Text
ls_input = mle_input.Text

ls_output =  wf_encode(ls_input, ls_key)

mle_output.Text = ls_output


end event

