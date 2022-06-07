--Ejecutar los siguientes scripts en el ambiente deseado
Begin
Insert into mti_sys.sys_qryfrms_h 
(ID,QUERY,TITLE,ORDER_BY,CASESENSITIVE,TIPO) values 
('fe_objeto','select objeto_key,clave,descripcion from MTI_FACTURACION.FE_OBJETO_IMPUESTO','Lista Objeto Impuesto',2,'N','NA');

Insert into MTI_SYS.SYS_QRYFRMS_R (ID,ID_COL,FIELD_NAME,COLUMN_NAME,DATA_TYPE,WIDTH,ALIGNMENT,TEXT_EDITOR,TOOL_TIP) values 
('fe_objeto',1,'objeto_key','objeto_key','N',0,'R','N','KEY Dato');
Insert into MTI_SYS.SYS_QRYFRMS_R (ID,ID_COL,FIELD_NAME,COLUMN_NAME,DATA_TYPE,WIDTH,ALIGNMENT,TEXT_EDITOR,TOOL_TIP) values 
('fe_objeto',2,'CLAVE','Clave','C',100,'L','N','Clave');
Insert into MTI_SYS.SYS_QRYFRMS_R (ID,ID_COL,FIELD_NAME,COLUMN_NAME,DATA_TYPE,WIDTH,ALIGNMENT,TEXT_EDITOR,TOOL_TIP) values 
('fe_objeto',3,'descripcion','Descripción','C',200,'L','Y','Descripción');
Commit;

Exception
   When Others Then
      Rollback;
      raise_application_error(-20001,sqlerrm);
End;

/



