-- o texto "primary key" serve para definir que o campo em questão é uma chave primaria
-- o texto "identity(2,1)" serve para definir que o campo deve ser gerado automaticamente e seguir uma sequencia que no 2 e aumenta sempre 1
-- o texto "foreign key references tabela(campo)" serve para identificar que o campo em questão é uma chave de outra tabela, ou seja, são campos relacionados.
--    Podemos traduzir "campox  foreign key references tabelay(campoX)" para : o campox é uma chave estrangeira e se referencia ao campo campoX da tabela tabelaY
create table tbAcaoPAP(
    idAcaoPAP int not null SERIAL PRIMARY KEY,
    papAcaoPAP varchar(30),
    acaoSubAcaoPAP varchar(30)
);
create table tbTipoDemand(
    idTipoDemand int not null SERIAL PRIMARY KEY,
    descricaoTipoDemand varchar(30),
);
CREATE TABLE tbArea (
    idtbArea int not null SERIAL PRIMARY KEY,
    nometbArea VARCHAR(45) NULL
 );
CREATE TABLE tbEndereco (
    idtbEndereco int not null SERIAL PRIMARY KEY,
    enderecotbEndereco VARCHAR(45) NULL,
    cidadetbEndereco VARCHAR(45) NULL,
    ceptbEndereco VARCHAR(45) NULL,
    ibgetbEndereco VARCHAR(45) NULL
 );

CREATE TABLE tbFonteRecurso (
    idtbFonteRecurso int not null SERIAL PRIMARY KEY,
    descricaotbFonteRecurso VARCHAR(45) NULL
 );
CREATE TABLE tbCargo (
    idtbCargo int not null SERIAL PRIMARY KEY,
    descricaotbCargo VARCHAR(45) NULL,
    isOficialtbCargo TINYINT NULL,
  );
  CREATE TABLE tbPerfil (
    idtbPerfil int not null SERIAL PRIMARY KEY,
    descricaotbPerfil VARCHAR(45) NULL
 );
 CREATE TABLE tbSituacao (
    idtbSituacao int not null SERIAL PRIMARY KEY,
    descricaotbSituacao VARCHAR(45) NULL
 );
 CREATE TABLE tbContato (
    idtbContato int not null SERIAL PRIMARY KEY,
    SetortbContato VARCHAR(45) NULL,
    EmailtbContato VARCHAR(45) NULL,
    DescricaotbContato VARCHAR(45) NULL
 );

 CREATE TABLE tbEmpresa (
    idtbEmpresa int not null SERIAL PRIMARY KEY,
    razaotbEmpresa VARCHAR(45) NULL,
    nomeFantasiatbEmpresa VARCHAR(45) NULL
 );
CREATE TABLE tbGrupoPermss (
    idtbGrupoPermss int not null SERIAL PRIMARY KEY,
    descricaotbGrupoPermss VARCHAR(45) NULL
 );
CREATE TABLE tbCampo (
    idtbCampo int not null SERIAL PRIMARY KEY,
    descricaotbCampo VARCHAR(45) NULL
 );
create table tbContrato(
    idContrato int not null SERIAL PRIMARY KEY,
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
    idtbArea int foreign key references tbArea(idtbArea),
    idTipoDemand int foreign key references tbTipoDemand(idTipoDemand),
    idFontRecurs int foreign key references tbFontRecurs(idFontRecurs),
    idAcaoPAP int foreign key references tbAcaoPAP(idAcaoPAP)
);

create table tbPermissVisulzc(
    idPermissVisulzc int not null SERIAL PRIMARY KEY,
    dataPermissVisulzc Date,
    validadePermissVisulzc Date,
    idtbArea int foreign key references tbArea(idtbArea),
    idContratos int foreign key references tbContrato(idContratos),
    idPessRespnsvl int foreign key references tbPessRespnsvl(idPessRespnsvl),
);
create table tbHistrc(
    idHistrc int not null SERIAL PRIMARY KEY,
    dataInclsHistrc date not null,
    textoHistrc varchar(max) not null,
    tipoHistrc varchar(30),
    idAditivo int foreign key references tbAditivo(idAditivo),
    idContratos int foreign key references tbContrato(idContratos),
    idPessRespnsvl int foreign key references tbPessRespnsvl(idPessRespnsvl)
);
create table tbArqv(
    idArqvs int not null SERIAL PRIMARY KEY,
    descricaoArqvs  date not null,
    linkArqvs  varchar(max) not null,
    tipoArqvs  varchar(30),
    idAditivo int foreign key references tbAditivo(idAditivo),
    idContratos int foreign key references tbContrato(idContratos),
    idPessRespnsvl int foreign key references tbPessRespnsvl(idPessRespnsvl),
    idParcel int foreign key references tbParcela(idParcel),
    idHistrc int foreign key references tbHistrc(idHistrc)
);
create table tbParcela(
    idtbParcela int not null SERIAL PRIMARY KEY,
    valortbParcela DECIMAL NULL,
    descricaotbParcela INT NULL,
    liberadatbParcela TINYINT NULL,
    pagatbParcela TINYINT NULL,
    tbContrato_idtbContrato INT NOT NULL references tbContrato(idContrato),
    tbAditivo_idAditivo int REFERENCES tbAditivo(idAditivo)
);




CREATE TABLE Auditoria (
    idAuditoria int not null SERIAL PRIMARY KEY,
    horaAuditoria DATE NULL,
    usuarioAuditoria VARCHAR(45) NULL,
    tabelaAuditoria VARCHAR(45) NULL,
    id_registroAuditoria INT NULL,
    valorAnterior VARCHAR(45) NULL,
    valorNovoAuditoria VARCHAR(45) NULL
 );
CREATE TABLE tbAditivo (
    idtbAditivo int not null SERIAL PRIMARY KEY,
    valortbAditivo DECIMAL NULL,
    diasMesestbAditivo VARCHAR(45) NULL,
    prazotbAditivo INT NULL,
    motivotbAditivo VARCHAR(45) NULL,
    tbContrato_idtbContrato INT NOT NULL references tbContrato(idContrato),
    tbAcaoPAP_idtbAcaoPAP INT NOT NULL references tbAcaoPAP(idAcaoPAP),
    tbFonteRecurso_idtbFonteRecurso INT NOT NULL references  tbFonteRecurso(idFontRecurs)
  );

CREATE TABLE tbProdutos (
    idtbProdutos int not null primary key identity(1,1),
    descricaotbProdutos VARCHAR(45) NULL,
    linktbProdutos VARCHAR(45) NULL,
    tipotbProdutos VARCHAR(45) NULL,
    tbContrato_idtbContrato INT NOT NULL references tbContrato(idContrato),
    tbAditivo_idtbAditivo INT NOT NULL references tbAditivo(idAditivo),
    tbArqv_idtbArqv INT NOT NULL references tbArqv(idAditivo),
    tbHistrc_idHistrc INT NOT NULL references tbHistrc(idHistrc),
    tbParcela_idtbParcela     INT NOT NULL references tbParcela(idParcela)
);

CREATE TABLE tbArqv (
    idtbArquivo int not null SERIAL PRIMARY KEY,
    descricaotbArquivo VARCHAR(45) NULL,
    linktbArquivo VARCHAR(45) NULL,
    tipotbArquivo VARCHAR(45) NULL,
    tbContrato_idtbContrato INT NOT NULL references tbContrato(idContrato),
    tbAditivo_idtbAditivo INT NOT NULL references tbAditivo(idAditivo),
    tbHistrc_idHistrc INT NOT NULL references tbHistrc(idHistrc),
    tbParcela_idtbParcela     INT NOT NULL references tbParcela(idParcela)
);
CREATE TABLE tbR_ContrtEmprs (
    idtbR_ContrtEmprs int not null SERIAL PRIMARY KEY,
    tbEndereco_idtbEndereco  INT NOT NULL references tbEndereco(idtbEndereco),
    tbEmpresa_idtbEmpresa  INT NOT NULL references tbEmpresa(idtbEmpresa)
);


CREATE TABLE tbAtributo (
    idtbAtributo int not null SERIAL PRIMARY KEY,
    valortbAtributo VARCHAR(45) NULL,
    datatbAtributo VARCHAR(45) NULL,
    tbSituacao_idtbSituacao INT NOT NULL,
    tbCampo_idtbCampo INT NOT NULL,
    tbContrato_idtbContrato INT NOT NULL references tbContrato(idContrato),
    tbAditivo_idtbAditivo INT NOT NULL references tbAditivo(idAditivo)
);
CREATE TABLE tbPermss (
    idtbPermss int not null SERIAL PRIMARY KEY,
    tbPessoa_idtbPessoa INT NOT NULL references  tbPessoa(idtbPessoa),
    tbPerfil_idtbPerfil INT NOT NULL references tbPerfil(idtbPerfil),
    tbGrupoPermss_idtbGrupoPermss INT NOT NULL references tbGrupoPermss(idtbGrupoPermss),
    tbContrato_idtbContrato INT NOT NULL references tbContrato(idContrato)
);
 CREATE TABLE tbPessoa (
    idtbPessoa int not null SERIAL PRIMARY KEY,
    nometbPessoa VARCHAR(45) NULL,
    sobrenometbPessoa VARCHAR(45) NULL,
    documentotbPessoa VARCHAR(45) NULL,
    isRespnsvlAgenctbPessoa VARCHAR(45) NULL,
    tbCargo_idtbCargo INT NOT NULL references tbCargo(idtbCargo),
    tbArea_idtbArea INT NOT NULL references tbArea(idtbArea)
);
