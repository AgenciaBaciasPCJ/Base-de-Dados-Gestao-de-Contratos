-- o texto "primary key" serve para definir que o campo em questão é uma chave primaria
-- o texto "identity(2,1)" serve para definir que o campo deve ser gerado automaticamente e seguir uma sequencia que no 2 e aumenta sempre 1
-- o texto "foreign key references tabela(campo)" serve para identificar que o campo em questão é uma chave de outra tabela, ou seja, são campos relacionados.
--    Podemos traduzir "campox  foreign key references tabelay(campoX)" para : o campox é uma chave estrangeira e se referencia ao campo campoX da tabela tabelaY
create table tbContratos(
idContrato int not null primary key identity(1,1),
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
idArea int foreign key references tbArea(idArea),
idTipoDemand int foreign key references tbTipoDemand(idTipoDemand),
idFontRecurs int foreign key references tbFontRecurs(idFontRecurs),
idAcaoPAP int foreign key references tbAcaoPAP(idAcaoPAP)
);

create table tbAcaoPAP(
    idAcaoPAP int not null primary key identity(1,1),
    papAcaoPAP varchar(30),
    acaoSubAcaoPAP varchar(30)
)




