using {univSchema as my} from '../db/schema';
using {cuid} from '@sap/cds/common';


service AdminService @(_requires : 'authenticated-user') {
    entity Universidades          as projection on my.Universidades;
    entity Carreras               as projection on my.Carreras;
    entity Alumnos                as projection on my.Alumnos;
    entity Universidades_carreras as projection on my.Universidades_carreras;

    entity Universidades_alumnos  as

        select
            a.universidad.nombre as NombreUniversidad,
            count(
                b.ID
            )                    as cantidadAlumnos : Integer
        from my.Universidades_carreras as a
        inner join my.Alumnos as b
            on b.carrera.ID = a.carrera.ID
        group by
            a.universidad.nombre;


}
