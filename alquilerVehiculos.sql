/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     13/11/2021 21:50:49                          */
/*==============================================================*/

/*==============================================================*/
/* Table: ALQUILER                                              */
/*==============================================================*/
create table ALQUILER (
   ID_ALQUILER          SERIAL               not null,
   ID_VEHICULO          INT4                 not null,
   ID_EMPLEADO          INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   ID_SEGURO            INT4                 null,
   DIAS_ALQUILER        INT4                 not null,
   PRECIO_DIARIO        MONEY                not null,
   ALQUILER_TERMINADO   BOOL                 not null,
   FECHA_INICIO_ALQUILER DATE                 not null,
   FECHA_FIN_ALQUILER   DATE                 not null,
   PENALIZACION_VALOR   MONEY                not null,
   OBSERVACIONES_VEHICULO CHAR(100)            not null,
   TOTAL_ALQUILER       MONEY                not null,
   constraint PK_ALQUILER primary key (ID_ALQUILER)
);

/*==============================================================*/
/* Index: ALQUILER_PK                                           */
/*==============================================================*/
create unique index ALQUILER_PK on ALQUILER (
ID_ALQUILER
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on ALQUILER (
ID_VEHICULO
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_15_FK on ALQUILER (
ID_EMPLEADO
);

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_17_FK on ALQUILER (
ID_SEGURO
);

/*==============================================================*/
/* Index: RELATIONSHIP_28_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_28_FK on ALQUILER (
ID_CLIENTE
);

/*==============================================================*/
/* Table: AUSPICIANTE_CREDITICIO                                */
/*==============================================================*/
create table AUSPICIANTE_CREDITICIO (
   ID_CREDITICIO        SERIAL               not null,
   NOMBRE_AUSPICIANTE   VARCHAR(30)          not null,
   constraint PK_AUSPICIANTE_CREDITICIO primary key (ID_CREDITICIO)
);

/*==============================================================*/
/* Index: AUSPICIANTE_CREDITICIO_PK                             */
/*==============================================================*/
create unique index AUSPICIANTE_CREDITICIO_PK on AUSPICIANTE_CREDITICIO (
ID_CREDITICIO
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID_CIUDAD            SERIAL               not null,
   NOMBRE_CIUDAD        VARCHAR(30)          not null,
   constraint PK_CIUDAD primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Index: CIUDAD_PK                                             */
/*==============================================================*/
create unique index CIUDAD_PK on CIUDAD (
ID_CIUDAD
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           SERIAL               not null,
   ID_CIUDAD            INT4                 not null,
   ID_GENERO            INT4                 not null,
   ID_CREDITICIO        INT4                 not null,
   NOMBRES_CLIENTE      VARCHAR(30)          not null,
   APELLIDOS_CLIENTE    VARCHAR(30)          not null,
   CEDULA_CLIENTE       VARCHAR(10)          not null,
   FECHA_NACIMIENTO_CLIENTE DATE                 not null,
   TIPO_DE_SANGRE       VARCHAR(3)           not null,
   TELEFONO_CLIENTE     VARCHAR(10)          not null,
   DIRECCION_CLIENTE    VARCHAR(60)          not null,
   EMAIL_CLIENTE        VARCHAR(30)          not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on CLIENTE (
ID_CIUDAD
);

/*==============================================================*/
/* Index: RELATIONSHIP_19_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_19_FK on CLIENTE (
ID_GENERO
);

/*==============================================================*/
/* Index: RELATIONSHIP_23_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_23_FK on CLIENTE (
ID_CREDITICIO
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   ID_EMPLEADO          SERIAL               not null,
   ID_TITULO            INT4                 not null,
   ID_TIPO_DE_EMPLEADO  INT4                 not null,
   ID_GENERO            INT4                 not null,
   CEDULA_EMPLEADO      VARCHAR(10)          not null,
   NOMBRES_EMPLEADO     VARCHAR(30)          not null,
   APELLIDOS_EMPLEADO   VARCHAR(30)          not null,
   FECHA_NACIMIENTO_EMPLEADO DATE                 not null,
   FECHA_CONTRATACION_EMPLEADO DATE                 not null,
   TELEFONO_EMPLEADO    VARCHAR(10)          not null,
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
);

/*==============================================================*/
/* Index: EMPLEADO_PK                                           */
/*==============================================================*/
create unique index EMPLEADO_PK on EMPLEADO (
ID_EMPLEADO
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_14_FK on EMPLEADO (
ID_TIPO_DE_EMPLEADO
);

/*==============================================================*/
/* Index: RELATIONSHIP_20_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_20_FK on EMPLEADO (
ID_GENERO
);

/*==============================================================*/
/* Table: GENERO                                                */
/*==============================================================*/
create table GENERO (
   ID_GENERO            SERIAL               not null,
   TIPO_GENERO          VARCHAR(15)          not null,
   constraint PK_GENERO primary key (ID_GENERO)
);

/*==============================================================*/
/* Index: GENERO_PK                                             */
/*==============================================================*/
create unique index GENERO_PK on GENERO (
ID_GENERO
);

/*==============================================================*/
/* Table: LUGAR_DE_MANTENIMIENTO                                */
/*==============================================================*/
create table LUGAR_DE_MANTENIMIENTO (
   ID_LUGAR_MANTENIMIENTO SERIAL               not null,
   ID_CIUDAD            INT4                 not null,
   NOMBRE_LUGAR_MANTENIMIENTO VARCHAR(30)          not null,
   DIRECCION_MANTENIMIENTO VARCHAR(60)          not null,
   constraint PK_LUGAR_DE_MANTENIMIENTO primary key (ID_LUGAR_MANTENIMIENTO)
);

/*==============================================================*/
/* Index: LUGAR_DE_MANTENIMIENTO_PK                             */
/*==============================================================*/
create unique index LUGAR_DE_MANTENIMIENTO_PK on LUGAR_DE_MANTENIMIENTO (
ID_LUGAR_MANTENIMIENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_18_FK on LUGAR_DE_MANTENIMIENTO (
ID_CIUDAD
);

/*==============================================================*/
/* Table: MANTENIMIENTO                                         */
/*==============================================================*/
create table MANTENIMIENTO (
   ID_MANTENIMIENTO     SERIAL               not null,
   ID_LUGAR_MANTENIMIENTO INT4                 not null,
   ID_VEHICULO          INT4                 not null,
   ID_EMPLEADO          INT4                 not null,
   FECHA_MANTENIMIENTO  DATE                 not null,
   COSTO_MANTENIMIENTO  MONEY                not null,
   OBSERVACIONES_MANTENIMIENTO VARCHAR(100)         not null,
   constraint PK_MANTENIMIENTO primary key (ID_MANTENIMIENTO)
);

/*==============================================================*/
/* Index: MANTENIMIENTO_PK                                      */
/*==============================================================*/
create unique index MANTENIMIENTO_PK on MANTENIMIENTO (
ID_MANTENIMIENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on MANTENIMIENTO (
ID_LUGAR_MANTENIMIENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on MANTENIMIENTO (
ID_VEHICULO
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_16_FK on MANTENIMIENTO (
ID_EMPLEADO
);

/*==============================================================*/
/* Table: MARCA_VEHICULO                                        */
/*==============================================================*/
create table MARCA_VEHICULO (
   ID_MARCA             SERIAL               not null,
   NOMBRE_MARCA         VARCHAR(30)          not null,
   constraint PK_MARCA_VEHICULO primary key (ID_MARCA)
);

/*==============================================================*/
/* Index: MARCA_VEHICULO_PK                                     */
/*==============================================================*/
create unique index MARCA_VEHICULO_PK on MARCA_VEHICULO (
ID_MARCA
);

/*==============================================================*/
/* Table: MODELO_VEHICULO                                       */
/*==============================================================*/
create table MODELO_VEHICULO (
   ID_MODELO            SERIAL               not null,
   NOMBRE_MODELO        VARCHAR(30)          not null,
   constraint PK_MODELO_VEHICULO primary key (ID_MODELO)
);

/*==============================================================*/
/* Index: MODELO_VEHICULO_PK                                    */
/*==============================================================*/
create unique index MODELO_VEHICULO_PK on MODELO_VEHICULO (
ID_MODELO
);

/*==============================================================*/
/* Table: REVISIONES_VEHICULOS                                  */
/*==============================================================*/
create table REVISIONES_VEHICULOS (
   ID_REVISION          INT4                 not null,
   ID_VEHICULO          INT4                 not null,
   constraint PK_REVISIONES_VEHICULOS primary key (ID_REVISION, ID_VEHICULO)
);

/*==============================================================*/
/* Index: REVISIONES_VEHICULOS_PK                               */
/*==============================================================*/
create unique index REVISIONES_VEHICULOS_PK on REVISIONES_VEHICULOS (
ID_REVISION,
ID_VEHICULO
);

/*==============================================================*/
/* Index: REVISIONES_VEHICULOS2_FK                              */
/*==============================================================*/
create  index REVISIONES_VEHICULOS2_FK on REVISIONES_VEHICULOS (
ID_VEHICULO
);

/*==============================================================*/
/* Index: REVISIONES_VEHICULOS_FK                               */
/*==============================================================*/
create  index REVISIONES_VEHICULOS_FK on REVISIONES_VEHICULOS (
ID_REVISION
);

/*==============================================================*/
/* Table: REVISION_VEHICULO                                     */
/*==============================================================*/
create table REVISION_VEHICULO (
   ID_REVISION          SERIAL               not null,
   FECHA_REVISION       DATE                 not null,
   OBSERVACIONES_REVISION VARCHAR(100)         not null,
   constraint PK_REVISION_VEHICULO primary key (ID_REVISION)
);

/*==============================================================*/
/* Index: REVISION_VEHICULO_PK                                  */
/*==============================================================*/
create unique index REVISION_VEHICULO_PK on REVISION_VEHICULO (
ID_REVISION
);

/*==============================================================*/
/* Table: SEGURO                                                */
/*==============================================================*/
create table SEGURO (
   ID_SEGURO            SERIAL               not null,
   NOMBRE_SEGURO        VARCHAR(30)          not null,
   constraint PK_SEGURO primary key (ID_SEGURO)
);

/*==============================================================*/
/* Index: SEGURO_PK                                             */
/*==============================================================*/
create unique index SEGURO_PK on SEGURO (
ID_SEGURO
);

/*==============================================================*/
/* Table: TIPO_DE_EMPLEADO                                      */
/*==============================================================*/
create table TIPO_DE_EMPLEADO (
   ID_TIPO_DE_EMPLEADO  SERIAL               not null,
   NOMBRE_TIPO_DE_EMPLEADO VARCHAR(20)          not null,
   constraint PK_TIPO_DE_EMPLEADO primary key (ID_TIPO_DE_EMPLEADO)
);

/*==============================================================*/
/* Index: TIPO_DE_EMPLEADO_PK                                   */
/*==============================================================*/
create unique index TIPO_DE_EMPLEADO_PK on TIPO_DE_EMPLEADO (
ID_TIPO_DE_EMPLEADO
);

/*==============================================================*/
/* Table: TITULO                                                */
/*==============================================================*/
create table TITULO (
   ID_TITULO            SERIAL               not null,
   NOMBRE_TITULO        VARCHAR(30)          not null,
   constraint PK_TITULO primary key (ID_TITULO)
);

/*==============================================================*/
/* Index: TITULO_PK                                             */
/*==============================================================*/
create unique index TITULO_PK on TITULO (
ID_TITULO
);

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO (
   ID_VEHICULO          SERIAL               not null,
   ID_MARCA             INT4                 not null,
   ID_MODELO            INT4                 not null,
   NUMERO_DE_PUERTAS_VEHICULO VARCHAR(10)          not null,
   CAPACIDAD_MALETERO_VEHICULO INT2                 not null,
   PLACA_VEHICULO       VARCHAR(7)           not null,
   COLOR_VEHICULO       VARCHAR(15)          not null,
   constraint PK_VEHICULO primary key (ID_VEHICULO)
);

/*==============================================================*/
/* Index: VEHICULO_PK                                           */
/*==============================================================*/
create unique index VEHICULO_PK on VEHICULO (
ID_VEHICULO
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on VEHICULO (
ID_MARCA
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on VEHICULO (
ID_MODELO
);

alter table ALQUILER
   add constraint FK_ALQUILER_RELATIONS_VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO)
      on delete restrict on update restrict;

alter table ALQUILER
   add constraint FK_ALQUILER_RELATIONS_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on delete restrict on update restrict;

alter table ALQUILER
   add constraint FK_ALQUILER_RELATIONS_SEGURO foreign key (ID_SEGURO)
      references SEGURO (ID_SEGURO)
      on delete restrict on update restrict;

alter table ALQUILER
   add constraint FK_ALQUILER_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table CLIENTE
   add constraint FK_CLIENTE_RELATIONS_GENERO foreign key (ID_GENERO)
      references GENERO (ID_GENERO)
      on delete restrict on update restrict;

alter table CLIENTE
   add constraint FK_CLIENTE_RELATIONS_AUSPICIA foreign key (ID_CREDITICIO)
      references AUSPICIANTE_CREDITICIO (ID_CREDITICIO)
      on delete restrict on update restrict;

alter table CLIENTE
   add constraint FK_CLIENTE_RELATIONS_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_TIPO_DE_ foreign key (ID_TIPO_DE_EMPLEADO)
      references TIPO_DE_EMPLEADO (ID_TIPO_DE_EMPLEADO)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_GENERO foreign key (ID_GENERO)
      references GENERO (ID_GENERO)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_TITULO foreign key (ID_TITULO)
      references TITULO (ID_TITULO)
      on delete restrict on update restrict;

alter table LUGAR_DE_MANTENIMIENTO
   add constraint FK_LUGAR_DE_RELATIONS_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on delete restrict on update restrict;

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_RELATIONS_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on delete restrict on update restrict;

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_RELATIONS_LUGAR_DE foreign key (ID_LUGAR_MANTENIMIENTO)
      references LUGAR_DE_MANTENIMIENTO (ID_LUGAR_MANTENIMIENTO)
      on delete restrict on update restrict;

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_RELATIONS_VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO)
      on delete restrict on update restrict;

alter table REVISIONES_VEHICULOS
   add constraint FK_REVISION_REVISIONE_REVISION foreign key (ID_REVISION)
      references REVISION_VEHICULO (ID_REVISION)
      on delete restrict on update restrict;

alter table REVISIONES_VEHICULOS
   add constraint FK_REVISION_REVISIONE_VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO)
      on delete restrict on update restrict;

alter table VEHICULO
   add constraint FK_VEHICULO_RELATIONS_MARCA_VE foreign key (ID_MARCA)
      references MARCA_VEHICULO (ID_MARCA)
      on delete restrict on update restrict;

alter table VEHICULO
   add constraint FK_VEHICULO_RELATIONS_MODELO_V foreign key (ID_MODELO)
      references MODELO_VEHICULO (ID_MODELO)
      on delete restrict on update restrict;

