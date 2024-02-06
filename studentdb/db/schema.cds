namespace com.satinfotech.studentdb;
using {cuid, managed} from '@sap/cds/common';

@assert.unique:{
 stid:[stid]
}

entity Student:cuid, managed{

@title :'studentID'
stid: String(5);
@title :'First Name'
first_name: String(10) @mandatory;
@title :'Last Name'
last_name: String(10) @mandatory;
@title: 'Gender'
virtual gen: String(6) @Core.Computed;
@title :'Email ID'
email_id: String(20) @mandatory;
@title :'PAN No'
pan_no : String(20);
@title :'Date Of Birth'
dob : Date @mandatory;
@title :'Course'
course: Association to Courses;
@title: 'Languages Known'
Languages: Composition of many {
    key ID: UUID;
    lang: Association to Languages;
}
@title :'Age'
virtual age : Integer @Core.Computed;
gender : String(1);
@title:'Is Alumini'
is_alumini:Boolean default false;
}


entity  Books :  cuid, managed{
    @title: 'Code'
    code: String(3);
    @title: 'Books'
    description: String(40);
}
    

@cds.persistence.skip
entity Gender {
@title : 'code'
key code : String(1);
@title :'Description'
description : String(10);
    
}

entity Courses : cuid,managed {
    @title :'code'
    code: String(3);
    @title :'Description'
    description: String(50);
    @title: 'Books'
    Books: Composition of many{
        key ID: UUID;
        books: Association to Books;
    }
}

entity Languages: cuid, managed {
    @title: 'Code'
    code: String(2);
    @title: 'Description'
    description: String(20);
}