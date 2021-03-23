using {cuid} from '@sap/cds/common';

namespace univSchema;


entity Universidades : cuid {
    nombre   : String(100);
    ciudad   : String(100);
    carreras : Association to many Universidades_carreras
                   on carreras.universidad = $self;
}

entity Carreras : cuid {
    nombre        : String(100);
    aniosEstudio  : Integer;
    arancel       : Integer;
    universidades : Association to many Universidades_carreras
                        on universidades.carrera = $self;
    alumnos       : Association to many Alumnos
                        on alumnos.carrera = $self;
}

entity Alumnos : cuid {
    nombre  : String(100);
    carrera : Association to one Carreras;
};


entity Universidades_carreras : cuid {
    universidad : Association to Universidades;
    carrera     : Association to Carreras;
}
