-- o texto "primary key" serve para definir que o campo em questão é uma chave primaria
-- o texto "identity(2,1)" serve para definir que o campo deve ser gerado automaticamente e seguir uma sequencia que no 2 e aumenta sempre 1
-- o texto " references tabela(campo)" serve para identificar que o campo em questão é uma chave de outra tabela, ou seja, são campos relacionados.
--    Podemos traduzir "campox   references tabelay(campoX)" para : o campox é uma chave estrangeira e se referencia ao campo campoX da tabela tabelaY
create table tbAcaoPAP(
    idAcaoPAP SERIAL PRIMARY KEY,
    papAcaoPAP varchar(30),
    acaoSubAcaoPAP varchar(30)
);
create table tbTipoDemand(
    idTipoDemand SERIAL PRIMARY KEY,
    descricaoTipoDemand varchar(30)
);
CREATE TABLE tbArea (
    idtbArea SERIAL PRIMARY KEY,
    nometbArea VARCHAR(45) NULL
 );
CREATE TABLE tbEndereco (
    idtbEndereco SERIAL PRIMARY KEY,
    enderecotbEndereco VARCHAR(45) NULL,
    cidadetbEndereco VARCHAR(45) NULL,
    ceptbEndereco VARCHAR(45) NULL,
    ibgetbEndereco VARCHAR(45) NULL
 );

CREATE TABLE tbFonteRecurso (
    idtbFonteRecurso SERIAL PRIMARY KEY,
    descricaotbFonteRecurso VARCHAR(45) NULL
 );
CREATE TABLE tbCargo (
    idtbCargo SERIAL PRIMARY KEY,
    descricaotbCargo VARCHAR(45) NULL,
    isOficialtbCargo bool NULL
  );
  CREATE TABLE tbPerfil (
    idtbPerfil SERIAL PRIMARY KEY,
    descricaotbPerfil VARCHAR(45) NULL
 );
 CREATE TABLE tbSituacao (
    idtbSituacao SERIAL PRIMARY KEY,
    descricaotbSituacao VARCHAR(45) NULL
 );
 CREATE TABLE tbContato (
    idtbContato SERIAL PRIMARY KEY,
    SetortbContato VARCHAR(45) NULL,
    EmailtbContato VARCHAR(45) NULL,
    DescricaotbContato VARCHAR(45) NULL
 );

 CREATE TABLE tbEmpresa (
    idtbEmpresa SERIAL PRIMARY KEY,
    razaotbEmpresa VARCHAR(45) NULL,
    nomeFantasiatbEmpresa VARCHAR(45) NULL
 );
CREATE TABLE tbGrupoPermss (
    idtbGrupoPermss SERIAL PRIMARY KEY,
    descricaotbGrupoPermss VARCHAR(45) NULL
 );
CREATE TABLE tbCampo (
    idtbCampo SERIAL PRIMARY KEY,
    descricaotbCampo VARCHAR(45) NULL
 );
create table tbContrato(
    idContrato SERIAL PRIMARY KEY,
    tituloContrato varchar(250),
    objetoContrato varchar(250),
    numeroContrato int,
    valorPCJContrato decimal(30,5),
    valorPCJContrapartida decimal(30,5),
    nrProcessoContrato int,
    dataInicioContrato Date,
    dataFimContrato Date,
    prazoContrato int,
    prazoTipoContrato varchar(5),
    tipoLicitacaoPCJContrato varchar(30),
    idtbArea int  references tbArea(idtbArea),
    idTipoDemand int  references tbTipoDemand(idTipoDemand),
    idFontRecurs int  references tbFonteRecurso(idtbFonteRecurso),
    idAcaoPAP int  references tbAcaoPAP(idAcaoPAP)
);
 CREATE TABLE tbPessoa (
    idtbPessoa SERIAL PRIMARY KEY,
    nometbPessoa VARCHAR(45) NULL,
    sobrenometbPessoa VARCHAR(45) NULL,
    documentotbPessoa VARCHAR(45) NULL,
    isRespnsvlAgenctbPessoa VARCHAR(45) NULL,
    tbCargo_idtbCargo INT NOT NULL references tbCargo(idtbCargo),
    tbArea_idtbArea INT NOT NULL references tbArea(idtbArea)
);

create table tbPermissVisulzc(
    idPermissVisulzc SERIAL PRIMARY KEY,
    dataPermissVisulzc Date,
    validadePermissVisulzc Date,
    idtbArea int  references tbArea(idtbArea),
    idContrato int  references tbContrato(idContrato),
    idPessRespnsvl int  references tbPessoa(idtbPessoa)
);
CREATE TABLE tbAditivo (
    idtbAditivo SERIAL PRIMARY KEY,
    valortbAditivo DECIMAL NULL,
    diasMesestbAditivo VARCHAR(45) NULL,
    prazotbAditivo INT NULL,
    motivotbAditivo VARCHAR(45) NULL,
    tbContrato_idtbContrato INT NOT NULL references tbContrato(idContrato),
    tbAcaoPAP_idtbAcaoPAP INT NOT NULL references tbAcaoPAP(idAcaoPAP),
    tbFonteRecurso_idtbFonteRecurso INT NOT NULL references  tbFonteRecurso(idtbFonteRecurso)
  );
create table tbHistrc(
    idHistrc SERIAL PRIMARY KEY,
    dataInclsHistrc date not null,
    textoHistrc text not null,
    tipoHistrc varchar(30),
    idtbAditivo int  references tbAditivo(idtbAditivo),
    idContrato int  references tbContrato(idContrato),
    idPessRespnsvl int  references tbPessoa(idtbPessoa)
);
create table tbParcela(
    idtbParcela SERIAL PRIMARY KEY,
    valortbParcela DECIMAL NULL,
    descricaotbParcela INT NULL,
    liberadatbParcela bool NULL,
    pagatbParcela bool NULL,
    tbContrato_idtbContrato INT NOT NULL references tbContrato(idContrato),
    tbAditivo_idtbAditivo int REFERENCES tbAditivo(idtbAditivo)
);





CREATE TABLE Auditoria (
    idAuditoria SERIAL PRIMARY KEY,
    horaAuditoria DATE NULL,
    usuarioAuditoria VARCHAR(45) NULL,
    tabelaAuditoria VARCHAR(45) NULL,
    id_registroAuditoria INT NULL,
    valorAnterior VARCHAR(45) NULL,
    valorNovoAuditoria VARCHAR(45) NULL
 );

create table tbArqv(
    idArqvs SERIAL PRIMARY KEY,
    descricaoArqvs  text not null,
    linkArqvs  text not null,
    tipoArqvs  varchar(30) null,
    tbContrato_idtbContrato INT NOT NULL references tbContrato(idContrato),
    tbAditivo_idtbAditivo INT NOT NULL references tbAditivo(idtbAditivo),
    idtbPessoa INT NOT NULL references tbPessoa(idtbPessoa),
    tbHistrc_idHistrc INT NOT NULL references tbHistrc(idHistrc),
    tbParcela_idtbParcela     INT NOT NULL references tbParcela(idtbParcela)
);
CREATE TABLE tbProdutos (
    idtbProdutos SERIAL PRIMARY KEY,
    descricaotbProdutos VARCHAR(45) NULL,
    linktbProdutos VARCHAR(45) NULL,
    tipotbProdutos VARCHAR(45) NULL,
    tbContrato_idtbContrato INT NOT NULL references tbContrato(idContrato),
    tbAditivo_idtbAditivo INT NOT NULL references tbAditivo(idtbAditivo),
    tbArqv_idtbArqv INT NOT NULL references tbArqv(idArqvs),
    tbHistrc_idHistrc INT NOT NULL references tbHistrc(idHistrc),
    tbParcela_idtbParcela     INT NOT NULL references tbParcela(idtbParcela)
);



CREATE TABLE tbR_ContrtEmprs (
    idtbR_ContrtEmprs SERIAL PRIMARY KEY,
    tbEndereco_idtbEndereco  INT NOT NULL references tbEndereco(idtbEndereco),
    tbEmpresa_idtbEmpresa  INT NOT NULL references tbEmpresa(idtbEmpresa)
);


CREATE TABLE tbAtributo (
    idtbAtributo SERIAL PRIMARY KEY,
    valortbAtributo VARCHAR(45) NULL,
    datatbAtributo VARCHAR(45) NULL,
    tbSituacao_idtbSituacao INT NOT NULL,
    tbCampo_idtbCampo INT NOT NULL,
    tbContrato_idtbContrato INT NOT NULL references tbContrato(idContrato),
    tbAditivo_idtbAditivo INT NOT NULL references tbAditivo(idtbAditivo)
);
CREATE TABLE tbPermss (
    idtbPermss SERIAL PRIMARY KEY,
    tbPessoa_idtbPessoa INT NOT NULL references  tbPessoa(idtbPessoa),
    tbPerfil_idtbPerfil INT NOT NULL references tbPerfil(idtbPerfil),
    tbGrupoPermss_idtbGrupoPermss INT NOT NULL references tbGrupoPermss(idtbGrupoPermss),
    tbContrato_idtbContrato INT NOT NULL references tbContrato(idContrato)
);
