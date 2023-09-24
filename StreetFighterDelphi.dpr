program StreetFighterDelphi;

uses
  Forms,
  MainView in 'MainView.pas' {viewMain},
  ConfigControlesView in 'ConfigControlesView.pas' {viewConfigControles},
  Game01view in 'Game01view.pas' {viewGame01};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TviewMain, viewMain);
  Application.CreateForm(TviewConfigControles, viewConfigControles);
  Application.CreateForm(TviewGame01, viewGame01);
  Application.Run;
end.
