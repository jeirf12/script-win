@echo off

:: Comando generar Xml en C#
echo "System.IO.File.WriteAllText(@"C:\LogsFlyrs\event.xml", new System.Func<string>(() => { var stringWriter = new System.IO.StringWriter(); new System.Xml.Serialization.XmlSerializer(typeof(EVENT)).Serialize(stringWriter, EVENT); return stringWriter.ToString(); })() );" | clip
