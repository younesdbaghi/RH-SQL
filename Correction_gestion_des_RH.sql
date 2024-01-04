/*Q1*/
select Num_Emp,Nom_Emp
from EMPLOYE
where Num_Dep=20;

/*Q2*/
select Num_Emp,Nom_Emp,Num_Dep
from EMPLOYE
where Fonction_Emp='ouvrier';

/*Q3*/
select Nom_Emp
from EMPLOYE
where Fonction_Emp='vendeur' and Num_Dep=30 and Salaire_Emp>1500;

/*Q4*/
select Nom_Emp,Fonction_Emp,Salaire_Emp
from EMPLOYE
where Fonction_Emp='President' or Fonction_Emp='Directeur';

/*Q5*/
select Nom_Emp,Fonction_Emp,Salaire_Emp
from EMPLOYE
where (Fonction_Emp='President' or Fonction_Emp='Directeur') and Salaire_Emp>5000;

/*Q6*/
select Nom_Emp,Fonction_Emp
from EMPLOYE
where (Fonction_Emp='Directeur' and Num_Dep=10) or (Fonction_Emp='Ouvrier' and Num_Dep=20);

/*Q7*/
select Nom_Emp,Fonction_Emp,Num_Dep
from EMPLOYE
where Fonction_Emp not in ('ouvrier','directeur');

/*Q8*/
select Nom_Emp,Fonction_Emp,Salaire_Emp
from EMPLOYE
where Salaire_Emp between 2200 and 2800;

/*Q9*/
select Nom_Emp,Fonction_Emp,Num_Dep
from EMPLOYE
where Fonction_Emp in ('ouvrier','directeur','secrétaire');

/*Q10*/
select *
from EMPLOYE
where Sup_Emp is not  null;

/*Q11*/
select *
from EMPLOYE
where Sup_Emp is null;

/*Q12*/
select Salaire_Emp,Fonction_Emp,Nom_Emp
from EMPLOYE
where Num_Dep=20
order by Salaire_Emp;

/*Q13*/
select Salaire_Emp,Fonction_Emp,Nom_Emp
from EMPLOYE
where Num_Dep=20
order by Salaire_Emp desc;

/*Q14*/
select *
from EMPLOYE
order by Fonction_Emp asc,Salaire_Emp desc;

/*Q15*/
select AVG(Salaire_Emp) as "Moyenne des salaires"
from EMPLOYE;

/*Q16*/
select AVG(Salaire_Emp) as "Moyenne des salaires des ouvriers"
from EMPLOYE
where Fonction_Emp='ouvrier';

/*Q17*/
select MAX(Salaire_Emp) as "Salaire Max",MIN(Salaire_Emp) as "Salaire Min"
from EMPLOYE;

/*Q18*/
select COUNT(*) as "Nombre d'Employés du département 10"
from EMPLOYE
where Num_Dep=10;

/*Q19*/
select COUNT(distinct(Fonction_Emp)) as "Nombre de fonctions"
from EMPLOYE
where Num_Dep=10;

/*Q20*/
select Num_Dep,AVG(Salaire_Emp) as "Moyenne de salaires"
from EMPLOYE
group by Num_Dep;

/*Q21*/
select Num_Dep, AVG(Salaire_Emp*12) as "Salaire annuel moyen"
from EMPLOYE
where Fonction_Emp not in ('directeur','president')
group by Num_Dep;

/*Q22*/
select Num_Dep,Fonction_Emp,COUNT(Num_Emp) as "Nombre d'employés",AVG(Salaire_Emp) as "Salaire Moyen"
from EMPLOYE
group by Num_Dep,Fonction_Emp;

/*Q23*/
select Fonction_Emp,AVG(Salaire_Emp) as "Salaire Moyen"
from EMPLOYE
group by Fonction_Emp
having COUNT(Num_Emp)>2;

/*Q24*/
select Num_Dep
from EMPLOYE
where Fonction_Emp='secrétaire'
group by Num_Dep
having COUNT(Nom_Emp)>=2;

/*Q25*/
select e.Nom_Emp,d.site_Dep
from EMPLOYE e inner join DEPARTEMENT d on e.Num_Dep=d.Num_Dep;

/*Q26*/
select d.site_Dep as "Ville"
from EMPLOYE e inner join DEPARTEMENT d on e.Num_Dep=d.Num_Dep
where e.Num_Emp=1035;

/*Q27*/
select e.Nom_Emp,e.Fonction_Emp,d.Nom_Dep
from EMPLOYE e inner join DEPARTEMENT d on e.Num_Dep=d.Num_Dep
where d.Num_Dep=20 or d.Num_Dep=30;

/*Q28*/
select e1.Nom_Emp, e2.Nom_Emp as "CHEF"
from EMPLOYE e1 inner join EMPLOYE e2 on e1.Sup_Emp=e2.Num_Emp;

/*Q29*/
select e1.Nom_Emp,e1.Salaire_Emp,e2.Nom_Emp
from EMPLOYE e1 inner join EMPLOYE e2 on e1.Sup_Emp=e2.Num_Emp
where e1.Salaire_Emp>=e2.Salaire_Emp;

/*Q30*/
select Nom_Emp,Salaire_Emp,Fonction_Emp
from EMPLOYE
where Salaire_Emp> (select Salaire_Emp from EMPLOYE where Num_Emp=1);

/*Q31*/
select e1.Nom_Emp, e2.Nom_Emp as "CHEF"
from EMPLOYE e1 left outer join EMPLOYE e2 on e1.Sup_Emp=e2.Num_Emp;

/*Q32*/
select e.Nom_Emp,p.Nom_Proj
from EMPLOYE e inner join TRAVAILLER t on e.Num_Emp=t.Num_Emp inner join PROJET p on t.Code_Proj=p.Code_Proj;

/*Q33*/
select p.*
from TRAVAILLER t inner join PROJET p on t.Code_Proj=p.Code_Proj
where t.Num_Emp=1035;

/*Q34*/
select e.Nom_Emp
from EMPLOYE e inner join TRAVAILLER t on e.Num_Emp=t.Num_Emp inner join PROJET p on t.Code_Proj=p.Code_Proj
where e.Fonction_Emp='Ingénieur' and p.Nom_Proj='EAST_MARKETS';

/*Q35*/
select e.Nom_Emp
from EMPLOYE e left outer join TRAVAILLER t on e.Num_Emp=t.Num_Emp left outer join PROJET p on t.Code_Proj=p.Code_Proj;

/*Q36*/
select e.Nom_Emp
from EMPLOYE e left outer join TRAVAILLER t on e.Num_Emp=t.Num_Emp left outer join PROJET p on t.Code_Proj=p.Code_Proj
where e.Fonction_Emp='directeur';

/*Q37*/
select Nom_Emp,Fonction_Emp
from EMPLOYE
where Salaire_Emp>ALL(select Salaire_Emp from EMPLOYE where Nom_Emp='Mahmoudi');

/*Q38*/
select distinct(d.Nom_Dep)
from EMPLOYE e inner join DEPARTEMENT d on e.Num_Dep=d.Num_Dep
where e.Salaire_Emp>3000;

/*Q39*/
select Fonction_Emp
from EMPLOYE
group by Fonction_Emp
having AVG(Salaire_Emp)< (select AVG(Salaire_Emp) from EMPLOYE where Fonction_Emp='Ingénieur');

/*Q40*/
select e.*
from EMPLOYE e inner join HISTORIQUE h on e.Num_Emp=h.Num_Emp
where h.Fonction_Emp='vendeur';

select e.*
from EMPLOYE e inner join HISTORIQUE h on e.Num_Emp=h.Num_Emp
where h.Fonction_Emp='ouvrier';

/*Q41*/
select *
from EMPLOYE
where Num_Emp not in (select Num_Emp from HISTORIQUE where Fonction_Emp='vendeur');

/*Q42*/
select distinct p.*
from PROJET p inner join TRAVAILLER t on p.Code_Proj=t.Code_Proj
where t.Code_Proj not in
(
select distinct p.Code_Proj
from PROJET p inner join TRAVAILLER t on p.Code_Proj=t.Code_Proj inner join EMPLOYE e on t.Num_Emp=e.Num_Emp
where e.Fonction_Emp !='Ingénieur'
);