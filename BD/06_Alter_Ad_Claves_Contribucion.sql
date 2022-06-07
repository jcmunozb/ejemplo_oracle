--Ejecutar el siguiente script en el ambiente deseado

 alter table MTI_ADMIN.ad_claves_contribucion
  add EXPORTACION_KEY number;

 alter table MTI_ADMIN.ad_claves_contribucion
  add OBJETO_KEY number;  
  
  COMMENT ON COLUMN MTI_ADMIN.ad_claves_contribucion.EXPORTACION_KEY IS 'Llave primaria de la tabla mti_facturacion.fe_exportacion.';
  COMMENT ON COLUMN MTI_ADMIN.ad_claves_contribucion.OBJETO_KEY IS 'Llave primaria de la tabla mti_facturacion.FE_OBJETO_IMPUESTO.';
/

Declare
lnExportacion_key number;
lnObjeto_key number;  
Begin

Select OBJETO_KEY
  into lnObjeto_key
  from mti_facturacion.FE_OBJETO_IMPUESTO
 where clave = mti_ingresos.dbp_parametros.get_in_parameter_v('P_FAC_OBJETO_IMP');

Select EXPORTACION_KEY
  into lnExportacion_key
  from mti_facturacion.FE_EXPORTACION
 where clave = mti_ingresos.dbp_parametros.get_in_parameter_v('P_FAC_EXPORTACION');

 update MTI_ADMIN.ad_claves_contribucion
    set EXPORTACION_KEY = lnExportacion_key,
	    OBJETO_KEY = lnObjeto_key
       ;
 Commit;	  
Exception
   When Others Then
      Rollback;
      raise_application_error(-20001,sqlerrm);
End;	  
/  
  
  