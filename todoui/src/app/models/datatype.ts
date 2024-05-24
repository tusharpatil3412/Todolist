export interface login{
    mail:"",
    password:""
}
export interface user{
    id: number|undefined;
    name :string;
    email :string;
    password :string;

};
export class Todo{
    id:number|undefined;
    title:string="";
    description:string="";
    status:string="";
    userid:number|undefined
}
