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



