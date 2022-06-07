--Ejecutar el siguiente script en el ambiente deseado
BEGIN

Insert into MTI_INGRESOS.IN_PARAMETERS(CVE_PARAMETER,VALUE,DESCRIPTION) 
    Values ('P_FAC_PRODSERV', '01010101', 'Parametro para el valor default del producto/servicio');
Insert into MTI_INGRESOS.IN_PARAMETERS(CVE_PARAMETER,VALUE,DESCRIPTION) 
    Values ('P_FAC_UNIDAD_M', 'ACT', 'Parametro para el valor default de la unidad de medida');
Insert into MTI_INGRESOS.IN_PARAMETERS(CVE_PARAMETER,VALUE,DESCRIPTION) 
    Values ('P_FAC_OBJETO_IMP', '01', 'Parametro para el valor default del objeto impuesto');    
Insert into MTI_INGRESOS.IN_PARAMETERS(CVE_PARAMETER,VALUE,DESCRIPTION) 
    Values ('P_FAC_EXPORTACION', '01', 'Parametro para el valor default de Exportacion');    
Commit;

Exception
   When Others Then
      Rollback;
      raise_application_error(-20001,sqlerrm);
End;
/





