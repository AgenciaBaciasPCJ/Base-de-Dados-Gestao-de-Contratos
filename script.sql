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



