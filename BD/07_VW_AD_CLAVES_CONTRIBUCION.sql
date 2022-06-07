--Ejecutar el siguiente script en el ambiente deseado
grant all on mti_facturacion.fe_exportacion to mti_admin with grant option;
grant all on mti_facturacion.fe_objeto_impuesto to mti_admin with grant option;         
         /
Create or replace view MTI_ADMIN.VW_AD_CLAVES_CONTRIBUCION as
SELECT Cc.Contribucion_Key, 
         Cc.Cve_Contribucion ,
         Cc.Descripcion Descripcion_Claves,
         Cc.Tipo_Contribucion_Key,
         Tc.Cve_Tipo_Contribucion,
         Tc.Descripcion Descripcion_Tipos,    
         Cc.Estatus,
         cc.dias_vigencia_inpc,
         cc.contrib_aux,
         cc.leyenda_pase_caja,
         Cc.producto_servicio_key,
         Rps.cve_producto_servicio,
         Rps.descripcion desc_producto,
         Cc.medida_key,
         Fcu.cve_um,
         Fcu.nombre,         
         Fmp.metodopago,
         ex.EXPORTACION_KEY, --aramos EMS-ING-000012-41817
         ex.CLAVE clave_expo, --aramos EMS-ING-000012-41817
         ex.DESCRIPCION desc_expo,
         oi.OBJETO_KEY, --aramos EMS-ING-000012-41817
         oi.CLAVE clave_obj, --aramos EMS-ING-000012-41817
         oi.DESCRIPCION desc_obj, --aramos EMS-ING-000012-41817
         Fmp.descripcion desc_metodopago
    FROM mti_admin.Ad_Claves_Contribucion Cc,
         mti_admin.Ad_Tipos_Contribucion Tc,
         mti_ingresos.ri_producto_servicio Rps,
         mti_facturacion.FE_ClaveUnidad Fcu,
         mti_facturacion.FE_MetodoPago Fmp,
         mti_facturacion.fe_exportacion ex,
         MTI_FACTURACION.fe_objeto_impuesto oi
   WHERE Cc.Tipo_Contribucion_Key = Tc.Tipo_Contribucion_Key
        and Cc.producto_servicio_key = Rps.producto_servicio_key
        and Cc.medida_key = Fcu.um_key
        and Cc.metodopago = Fmp.metodopago
        and ex.exportacion_key = cc.exportacion_key
        and oi.objeto_key = cc.objeto_key                
        ;