@echo off

:: Generar json en un archivo en c#
echo System.IO.File.WriteAllText(@"C:\LogsFlyrs\event.json", Newtonsoft.Json.JsonConvert.SerializeObject(event))| clip
