use af;

create table usuario(
    usuario varchar(20) not null,
    senha varchar(20) not null,
    
    primary key(usuario)
);

create table maquina(
	idMaquina int not null,
    processador varchar(80) not null,
    memoriaram varchar(80) not null,
    memoriacache varchar(80) not null,
    
    primary key(idMaquina)
);

create table software(
    nome varchar(80) not null,
    livre boolean not null,
	SO boolean not null,
    nomeSO varchar(80),
    idMaquina int,
    dataLicenca date,
    licencaId varchar(80),
    
    
    primary key(nome),
    foreign key(nomeSO) references so(nome),
    foreign key(idMaquina) references maquina(idMaquina)
);

create table SO(
    idMaquina int not null,
    nome varchar(80) not null,
    
    primary key(nome,idMaquina),
    foreign key(idMaquina) references  maquina(idMaquina) on delete cascade
);