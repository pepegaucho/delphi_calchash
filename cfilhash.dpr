program cfilhash;

{$APPTYPE CONSOLE}

uses
  Windows,
  SysUtils,
  Hashes;

var
  Proceso,
  NombreArch,
  NuevaExt   : String;
  Mayusc     : Boolean;

  function _Agregar(aFN, aNExt: String; aMayusc: Boolean): Integer;
  var
     HASH,
     Ext,
     NFN : String;
  begin
     Result := 0;
     try
       if aMayusc then
          HASH := UpperCase(CalcHash(aFN, haMD5))
       else
          HASH := LowerCase(CalcHash(aFN, haMD5));
       Ext := ExtractFileExt(aFN);
       NFN := Copy(aFN, 1, Length(aFN) - Length(Ext)) + HASH + aNExt;
       if not RenameFile(aFN, NFN) then
          Result := 2;
     except
        Result := 2;
     end;
  end;

  function _Reemplazar(aFN, aNExt: String; aMayusc: Boolean): Integer;
  var
     HASH,
     Ext,
     NFN : String;
  begin
     Result := 0;
     try
       if aMayusc then
          HASH := UpperCase(CalcHash(aFN, haMD5))
       else
          HASH := LowerCase(CalcHash(aFN, haMD5));
       Ext := ExtractFileExt(aFN);
       NFN := HASH + aNExt;
       if not RenameFile(aFN, NFN) then
          Result := 2;
     except
        Result := 2;
     end;
  end;

  procedure _Mostrar_Ayuda;
  begin
     WriteLn('CFILHASH: Herramienta para agregar HASH al nombre de archivo.');
     WriteLn('');
     WriteLn('Sintaxis: cfilhash {-a|-r} archivo-fuente [{-m|-M}]');
     WriteLn('');
     WriteLn('La opción -a Agrega al nombre y la opción -r Reemplaza;');
     WriteLn('en ambos casos no se modifica la extensión.');
     WriteLn('La tercera opción indica si el Hash se escribe en mayúsculas (default) o minúsculas.');
     WriteLn('Si existe un archivo con el mismo nombre en la ubicación, lo reemplazará');
     WriteLn('');
     WriteLn('José Palumbo Sistemas - Chivilcoy, Buenos Aires, HECHO EN ARGENTINA');
  end;

var
   Error : Integer;
begin
  try
    Mayusc := True;
    if (ParamCount >= 2) then begin
       Proceso    := ParamStr(1);
       NombreArch := ParamStr(2);

       if ParamCount >= 3 then
          if ParamStr(3) = 'm' then Mayusc := False;

       if ParamCount >= 4 then
          NuevaExt := ParamStr(4)
       else
          NuevaExt := ExtractFileExt(NombreArch);

       if not FileExists(NombreArch) then begin
         Error := 1;
       end
       else begin
         if LowerCase(Proceso) = '-a' then begin
            //Agrega al nombre del archivo
            Error := _Agregar(NombreArch, NuevaExt, Mayusc);
         end
         else if LowerCase(Proceso) = '-r' then begin
            //Reemplaza el nombre del archivo por el Hash del contenido
            Error := _Reemplazar(NombreArch, NuevaExt, Mayusc);
         end
         else
            Error := 3;
       end;
    end
    else
       Error := 3;

    if Error = 1 then
       WriteLn('Archivo ' + NombreArch + ' no encontrado')
    else if Error = 2 then
       WriteLn('El archivo ' + NombreArch + ' no se pudo procesar')
    else if Error <> 0 then begin
      _Mostrar_Ayuda;
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
