@echo off

:: Comando generar Xml en C#
echo System.IO.File.WriteAllText(@"C:\\LogsFlyrs\\event.xml", new System.Xml.Serialization.XmlSerializer(typeof(event)).Serialize(new System.IO.StringWriter(), event).ToString())| clip
