unit uPSI_DialogList;
{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis.
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ROPS are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok's conv utility

}
interface



uses
   SysUtils
  ,Classes
  ,uPSComponent
  ,uPSRuntime
  ,uPSCompiler
  ;

type
(*----------------------------------------------------------------------------*)
  TPSImport_DialogList = class(TPSPlugin)
  public
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;


{ compile-time registration functions }
procedure SIRegister_TDialogSave(CL: TPSPascalCompiler);
procedure SIRegister_TDialogOpen(CL: TPSPascalCompiler);
procedure SIRegister_DialogList(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TDialogSave(CL: TPSRuntimeClassImporter);
procedure RIRegister_TDialogOpen(CL: TPSRuntimeClassImporter);
procedure RIRegister_DialogList(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   DialogList
  ;


procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_DialogList]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TDialogSave(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TDialogSave') do
  with CL.AddClassN(CL.FindClass('TObject'),'TDialogSave') do
  begin
    RegisterMethod('Constructor Create');
    RegisterMethod('Function Execute( ) : Boolean');
    RegisterProperty('Files', 'TStrings', iptr);
    RegisterProperty('FileName', 'string', iptrw);
    RegisterProperty('InitialDir', 'string', iptrw);
    RegisterProperty('Title', 'string', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TDialogOpen(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TDialogOpen') do
  with CL.AddClassN(CL.FindClass('TObject'),'TDialogOpen') do
  begin
    RegisterMethod('Constructor Create');
    RegisterMethod('Function Execute( ) : Boolean');
    RegisterProperty('Files', 'TStrings', iptr);
    RegisterProperty('FileName', 'string', iptrw);
    RegisterProperty('InitialDir', 'string', iptrw);
    RegisterProperty('Title', 'string', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_DialogList(CL: TPSPascalCompiler);
begin
  SIRegister_TDialogOpen(CL);
  SIRegister_TDialogSave(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TDialogSaveTitle_W(Self: TDialogSave; const T: string);
begin Self.Title := T; end;

(*----------------------------------------------------------------------------*)
procedure TDialogSaveTitle_R(Self: TDialogSave; var T: string);
begin T := Self.Title; end;

(*----------------------------------------------------------------------------*)
procedure TDialogSaveInitialDir_W(Self: TDialogSave; const T: string);
begin Self.InitialDir := T; end;

(*----------------------------------------------------------------------------*)
procedure TDialogSaveInitialDir_R(Self: TDialogSave; var T: string);
begin T := Self.InitialDir; end;

(*----------------------------------------------------------------------------*)
procedure TDialogSaveFileName_W(Self: TDialogSave; const T: string);
begin Self.FileName := T; end;

(*----------------------------------------------------------------------------*)
procedure TDialogSaveFileName_R(Self: TDialogSave; var T: string);
begin T := Self.FileName; end;

(*----------------------------------------------------------------------------*)
procedure TDialogSaveFiles_R(Self: TDialogSave; var T: TStrings);
begin T := Self.Files; end;

(*----------------------------------------------------------------------------*)
procedure TDialogOpenTitle_W(Self: TDialogOpen; const T: string);
begin Self.Title := T; end;

(*----------------------------------------------------------------------------*)
procedure TDialogOpenTitle_R(Self: TDialogOpen; var T: string);
begin T := Self.Title; end;

(*----------------------------------------------------------------------------*)
procedure TDialogOpenInitialDir_W(Self: TDialogOpen; const T: string);
begin Self.InitialDir := T; end;

(*----------------------------------------------------------------------------*)
procedure TDialogOpenInitialDir_R(Self: TDialogOpen; var T: string);
begin T := Self.InitialDir; end;

(*----------------------------------------------------------------------------*)
procedure TDialogOpenFileName_W(Self: TDialogOpen; const T: string);
begin Self.FileName := T; end;

(*----------------------------------------------------------------------------*)
procedure TDialogOpenFileName_R(Self: TDialogOpen; var T: string);
begin T := Self.FileName; end;

(*----------------------------------------------------------------------------*)
procedure TDialogOpenFiles_R(Self: TDialogOpen; var T: TStrings);
begin T := Self.Files; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TDialogSave(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TDialogSave) do
  begin
    RegisterConstructor(@TDialogSave.Create, 'Create');
    RegisterMethod(@TDialogSave.Execute, 'Execute');
    RegisterPropertyHelper(@TDialogSaveFiles_R,nil,'Files');
    RegisterPropertyHelper(@TDialogSaveFileName_R,@TDialogSaveFileName_W,'FileName');
    RegisterPropertyHelper(@TDialogSaveInitialDir_R,@TDialogSaveInitialDir_W,'InitialDir');
    RegisterPropertyHelper(@TDialogSaveTitle_R,@TDialogSaveTitle_W,'Title');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TDialogOpen(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TDialogOpen) do
  begin
    RegisterConstructor(@TDialogOpen.Create, 'Create');
    RegisterMethod(@TDialogOpen.Execute, 'Execute');
    RegisterPropertyHelper(@TDialogOpenFiles_R,nil,'Files');
    RegisterPropertyHelper(@TDialogOpenFileName_R,@TDialogOpenFileName_W,'FileName');
    RegisterPropertyHelper(@TDialogOpenInitialDir_R,@TDialogOpenInitialDir_W,'InitialDir');
    RegisterPropertyHelper(@TDialogOpenTitle_R,@TDialogOpenTitle_W,'Title');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_DialogList(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TDialogOpen(CL);
  RIRegister_TDialogSave(CL);
end;



{ TPSImport_DialogList }
(*----------------------------------------------------------------------------*)
procedure TPSImport_DialogList.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_DialogList(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_DialogList.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_DialogList(ri);
end;
(*----------------------------------------------------------------------------*)


end.