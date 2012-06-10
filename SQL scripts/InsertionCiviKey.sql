--DBCC CHECKIDENT (tContact, reseed, 0)
--DBCC CHECKIDENT (tContactRelation, reseed, 0)
--DBCC CHECKIDENT (tParticipation, reseed, 0)

--delete from dbo.tContact
--delete from dbo.tContactRelation
--delete from dbo.tParticipation
--delete from dbo.tParticipationFeature

--Creating contacts

insert into dbo.tContact(Name,Description,LogoPath)values('Vlad Sargu','','');--1
insert into dbo.tContact(Name,Description,LogoPath)values('Jean-Loup Kahloun','','');
insert into dbo.tContact(Name,Description,LogoPath)values('Philippe Lepadellec','','');
insert into dbo.tContact(Name,Description,LogoPath)values('Fran�ois Bessaguet','',''); --4

insert into dbo.tContact(Name,Description,LogoPath)values('Invenietis','<p>Invenietis, SSII cr��e en 2006, est impliqu�e dans le projet CiviKey depuis son lancement � INTECH INFO en Septembre de la m�me ann�e.</br>L''entreprise porte ce projet b�n�volement en r�alisant la majorit� des d�veloppements. Elle suit �galement des �tudiants d�sirant d�velopper de nouvelles fonctionnalit�s pour le CiviKey, pour les aider dans leur d�marche.</p>',''); --5
insert into dbo.tContact(Name,Description,LogoPath)values('Fondation Steria','La fondation St�ria',''); --6
insert into dbo.tContact(Name,Description,LogoPath)values('Alcatel-Lucent','Soci�t� Alcatel-Lucent',''); --7
insert into dbo.tContact(Name,Description,LogoPath)values('INTECH INFO','Ecole d''ing�nierie informatique membre du groupe ESIEA.',''); --8
insert into dbo.tContact(Name,Description,LogoPath)values('PFNT','La PlateForme des Nouvelles Technologies de l''h�pital de Garches',''); --9
insert into dbo.tContact(Name,Description,LogoPath)values('Antoine Blanchet','',''); --10
insert into dbo.tContact(Name,Description,LogoPath)values('Isaac Duplan','',''); --11
insert into dbo.tContact(Name,Description,LogoPath)values('Objectif Aide','L''association Objectf Aide',''); --12
insert into dbo.tContact(Name,Description,LogoPath)values('Antoine Raquillet','',''); --13

--Linking contacts to their organization

insert into dbo.tContactRelation(ContactId,EntityId,StartDate,EndDate)values(1,5,GetDate(), DATEADD(year,1,GetDate()));--1 Vlad --> Inv
insert into dbo.tContactRelation(ContactId,EntityId,StartDate,EndDate)values(2,5,GetDate(), DATEADD(year,1,GetDate()));--2 JL --> Inv
insert into dbo.tContactRelation(ContactId,EntityId,StartDate,EndDate)values(4,6,GetDate(), DATEADD(year,1,GetDate()));--3 F.Bessaguet --> Steria
insert into dbo.tContactRelation(ContactId,EntityId,StartDate,EndDate)values(3,7,GetDate(), DATEADD(year,1,GetDate()));--4 P.Lepadellec --> Alcatel

insert into dbo.tContactRelation(ContactId,EntityId,StartDate,EndDate)values(5,5,GetDate(), DATEADD(year,1,GetDate()));--5 Inv
insert into dbo.tContactRelation(ContactId,EntityId,StartDate,EndDate)values(6,6,GetDate(), DATEADD(year,1,GetDate()));--6 Steria
insert into dbo.tContactRelation(ContactId,EntityId,StartDate,EndDate)values(7,7,GetDate(), DATEADD(year,1,GetDate()));--7 Alcatel

insert into dbo.tContactRelation(ContactId,EntityId,StartDate,EndDate)values(8,8,GetDate(), DATEADD(year,1,GetDate()));--8 Intech
insert into dbo.tContactRelation(ContactId,EntityId,StartDate,EndDate)values(9,9,GetDate(), DATEADD(year,1,GetDate()));--9 PFNT
insert into dbo.tContactRelation(ContactId,EntityId,StartDate,EndDate)values(10,5,GetDate(), DATEADD(year,1,GetDate()));--10 Antoine --> Inv
insert into dbo.tContactRelation(ContactId,EntityId,StartDate,EndDate)values(11,8,GetDate(), DATEADD(year,1,GetDate()));--11 Isaac --> Intech
insert into dbo.tContactRelation(ContactId,EntityId,StartDate,EndDate)values(12,12,GetDate(), DATEADD(year,1,GetDate()));--12 Objectif Aide
insert into dbo.tContactRelation(ContactId,EntityId,StartDate,EndDate)values(13,5,GetDate(), DATEADD(year,1,GetDate()));--13 Antoine Raquillet --> Inv

--OK
																									--TODO : handle dates
--- Creating RoadMap
insert into dbo.tRoadMap(Name)values('2.5.1');


--Creating features
insert into dbo.tFeature(Title,Version,Progress,CreationDate,IdRoadMap,Description) values('AutoClick','1.0.0',100,DATEADD(year,-1,GetDate()),1,'<p>Cette fonctionnalit� permet de simuler des clics souris, sans avoir a utiliser de contacteur, l''immobilit� de la souris pendant un temps configurable lance le clic automatiquement. <br/> Un cartouche permet de selectionner le type de clic que l''on veut effectuer : clic gauche, clic droit, double clic ou encore glisser-d�poser.<br/> Pour plus d''informations, regardez le screencast ci-dessous.</p><p>Cette fonctionnalit� permet de simuler des clics souris, sans avoir a utiliser de contacteur, l''immobilit� de la souris pendant un temps configurable lance le clic automatiquement. <br/> Un cartouche permet de selectionner le type de clic que l''on veut effectuer : clic gauche, clic droit, double clic ou encore glisser-d�poser.<br/> Pour plus d''informations, regardez le screencast ci-dessous.</p>')
insert into dbo.tFeature(Title,Version,Progress,CreationDate,IdRoadMap,Description) values('Clavier','1.0.0',100,DATEADD(year,-1,GetDate()),1,'<p>Le clavier de CiviKey, celui-ci affiche un clavier configur� via un fichier xml. En editant ce fichier, on peut ajouter ou modifier des touches, pour leur faire envoyer le texte souhait�. <br/>La couleur des touches est modifiable. <br/> Autre fonctionnalit�s : <br/> le clavier peut �tre configur� pour se minimiser au bout d''un temps d�fini d''inaction, minimisant l''espace pris par le clavier sur l''�cran.</p>')
insert into dbo.tFeature(Title,Version,Progress,CreationDate,IdRoadMap,Description) values('Object Explorer','1.0.0',100,DATEADD(year,-1,GetDate()),1,'<p>Outil de configuration de CiviKey, reserv� aux utilisateurs confirm�s, il permet de d�cider du lancement automatique d''une fonctionnalit�, et de visualiser l''�tat du syst�me.</p>')
insert into dbo.tFeature(Title,Version,Progress,CreationDate,IdRoadMap,Description) values('Automatic update','1.0.0',100,DATEADD(year,-1,GetDate()),1,'<p>Mise � jour automatique de CiviKey.</p>')
--OK
--Creating sections in the features

insert into dbo.tSection(Name,FeatureId) values('Affichage & selection de clic',1); --1
insert into dbo.tSection(Name,FeatureId) values('Logique de clic',1); --2
insert into dbo.tSection(Name,FeatureId) values('Autres',1); --3

insert into dbo.tSection(Name,FeatureId) values('Affichage',2); --4
insert into dbo.tSection(Name,FeatureId) values('Gestionnaire de claviers',2); --5
insert into dbo.tSection(Name,FeatureId) values('Autres',2); --6

insert into dbo.tSection(Name,FeatureId) values('Plugin principal',3); --7

insert into dbo.tSection(Name,FeatureId) values('Plugin principal',4); --8
--OK
--Creating plugins

insert into dbo.tPlugin(Title,Version,Description,CreationDate) values('AutoClick','1.0.0','Plugin permettant de simuler des clics souris', DateAdd(year,-1,GetDate())) --1
insert into dbo.tPlugin(Title,Version,Description,CreationDate) values('MouseWatcher','1.0.0','Plugin permettant de compter le temps d''inaction de la souris', DateAdd(year,-1,GetDate())) --2
insert into dbo.tPlugin(Title,Version,Description,CreationDate) values('PointerDeviceDriver','1.0.0','Plugin permettant d''�couter les evenements souris', DateAdd(year,-1,GetDate())) --3

insert into dbo.tPlugin(Title,Version,Description,CreationDate) values('CK.KeyboardContext','1.0.0','Le mod�le de claviers', DateAdd(year,-1,GetDate())) --4
insert into dbo.tPlugin(Title,Version,Description,CreationDate) values('Simple skin','1.0.0','Le plugin d''affichage basique de CiviKey', DateAdd(year,-1,GetDate())) --5
insert into dbo.tPlugin(Title,Version,Description,CreationDate) values('Simple skin editor','1.0.0','Edition des styles de touches du clavier', DateAdd(year,-1,GetDate())) --6

insert into dbo.tPlugin(Title,Version,Description,CreationDate) values('Object Explorer','1.0.0','Plugin principal de la fonctionnalit� Object Explorer', DateAdd(year,-1,GetDate())) --7
insert into dbo.tPlugin(Title,Version,Description,CreationDate) values('Update Checker','1.0.0','Plugin principal de la fonctionnalit� Automatic update', DateAdd(year,-1,GetDate())) --8
--OK
--Linking plugins and features

insert into dbo.tSectionPlugin(SectionId,PluginId) values(1,1) --AutoClick
insert into dbo.tSectionPlugin(SectionId,PluginId) values(2,2) --MouseWatcher
insert into dbo.tSectionPlugin(SectionId,PluginId) values(2,3) --PointerDeviceDriver used by the autoclick plugin

insert into dbo.tSectionPlugin(SectionId,PluginId) values(4,5) --CK.KeyboardContext --> Gestionnaire de clavier
insert into dbo.tSectionPlugin(SectionId,PluginId) values(5,4) --Simple skin --> Affichage
insert into dbo.tSectionPlugin(SectionId,PluginId) values(5,5) --Simple skin editor --> Affichage

insert into dbo.tSectionPlugin(SectionId,PluginId) values(6,7) --Object Explorer --> Plugin principal

insert into dbo.tSectionPlugin(SectionId,PluginId) values(7,8) --Update checker --> plugin principal
--OK
--Creating Participations

insert into dbo.tParticipation(ContactRelationId,PartType,Percentage,ParticipationDate) values(2,'Development', 100, DateAdd(month,-5,GetDate()))
insert into dbo.tParticipationFeature(ParticipationId,FeatureId) values(1,1) --Jean-Loup has developped 100% of the AutoClick feature 

insert into dbo.tParticipation(ContactRelationId,PartType,Percentage,ParticipationDate) values(5,'Sponsoring', 100, DateAdd(month,-5,GetDate()))
insert into dbo.tParticipationFeature(ParticipationId,FeatureId) values(2,1) --Invenietis has sponsored 100% of the AutoClick Feature 

insert into dbo.tParticipation(ContactRelationId,PartType,Percentage,ParticipationDate) values(10,'Development', 100, DateAdd(month,-5,GetDate()))
insert into dbo.tParticipationFeature(ParticipationId,FeatureId) values(3,2) --Antoine has developped 100% of the Clavier

insert into dbo.tParticipation(ContactRelationId,PartType,Percentage,ParticipationDate) values(7,'Sponsoring', 50, DateAdd(month,-5,GetDate()))
insert into dbo.tParticipationFeature(ParticipationId,FeatureId) values(4,2) --Alcatel has sponsored 50% of the Clavier

insert into dbo.tParticipation(ContactRelationId,PartType,Percentage,ParticipationDate) values(5,'Sponsoring', 50, DateAdd(month,-5,GetDate()))
insert into dbo.tParticipationFeature(ParticipationId,FeatureId) values(5,2) --Invenietis has sponsored 50% of the Clavier

insert into dbo.tParticipation(ContactRelationId,PartType,Percentage,ParticipationDate) values(10,'Development', 60, DateAdd(month,-5,GetDate()))
insert into dbo.tParticipationFeature(ParticipationId,FeatureId) values(6,3) --Antoine has developed 60% of the OE 

insert into dbo.tParticipation(ContactRelationId,PartType,Percentage,ParticipationDate) values(2,'Development', 40, DateAdd(month,-5,GetDate()))
insert into dbo.tParticipationFeature(ParticipationId,FeatureId) values(7,3) --Jean-Loup has developed 40% of the OE

insert into dbo.tParticipation(ContactRelationId,PartType,Percentage,ParticipationDate) values(2,'Development', 50, DateAdd(month,-5,GetDate()))
insert into dbo.tParticipationFeature(ParticipationId,FeatureId) values(8,4) --Jean-Loup has developed 50% of the Automatic update

insert into dbo.tParticipation(ContactRelationId,PartType,Percentage,ParticipationDate) values(13,'Development', 50, DateAdd(month,-5,GetDate()))
insert into dbo.tParticipationFeature(ParticipationId,FeatureId) values(9,4) --Antoine Raquillet has developed 50% of the Automatic Update
--OK
--Creating categories
insert into dbo.tCategory(Name) values ('Aide au clic') --1
insert into dbo.tCategory(Name) values ('Aide � la saisie') --2
insert into dbo.tCategory(Name) values ('Aide au d�placement du pointeur') --3
insert into dbo.tCategory(Name) values ('Aide visuelle') --4
insert into dbo.tCategory(Name) values ('Noyau') --5
--OK
--Linking feature to categories
insert into dbo.tCategoryFeature (IdCategory, IdFeature) values (1,1) --Autoclick - clic
insert into dbo.tCategoryFeature (IdCategory, IdFeature) values (2,2) --Clavier - saisie
insert into dbo.tCategoryFeature (IdCategory, IdFeature) values (4,2) --Clavier - aide visuelle
insert into dbo.tCategoryFeature (IdCategory, IdFeature) values (5,3) --OE - noyau
insert into dbo.tCategoryFeature (IdCategory, IdFeature) values (5,4) --Update checker - noyau
--OK
insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial',1,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/fzzjgBAaWZw?rel=0')
insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial2',1,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/7VSR4_tAYvw?rel=0')

insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial',2,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/fzzjgBAaWZw?rel=0')
insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial2',2,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/7VSR4_tAYvw?rel=0')

insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial',3,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/fzzjgBAaWZw?rel=0')
insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial2',3,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/7VSR4_tAYvw?rel=0')

insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial',4,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/fzzjgBAaWZw?rel=0')
insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial2',4,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/7VSR4_tAYvw?rel=0')
--OK
insert into dbo.tRoadMap(Name)values('2.5.2'); ---------------------------------------------------------------------------------------------------------------------------------------2nd roadmap

--Creating features
--Old features
--5
insert into dbo.tFeature(Title,Version,Progress,CreationDate,IdRoadMap,Description) values('AutoClick','1.0.0',100,DATEADD(year,-1,GetDate()),2,'<p>Cette fonctionnalit� permet de simuler des clics souris, sans avoir a utiliser de contacteur, l''immobilit� de la souris pendant un temps configurable lance le clic automatiquement. <br/> Un cartouche permet de selectionner le type de clic que l''on veut effectuer : clic gauche, clic droit, double clic ou encore glisser-d�poser.<br/> Pour plus d''informations, regardez le screencast ci-dessous.</p><p>Cette fonctionnalit� permet de simuler des clics souris, sans avoir a utiliser de contacteur, l''immobilit� de la souris pendant un temps configurable lance le clic automatiquement. <br/> Un cartouche permet de selectionner le type de clic que l''on veut effectuer : clic gauche, clic droit, double clic ou encore glisser-d�poser.<br/> Pour plus d''informations, regardez le screencast ci-dessous.</p>')
--6
insert into dbo.tFeature(Title,Version,Progress,CreationDate,IdRoadMap,Description) values('Clavier','1.0.0',50,DATEADD(year,-1,GetDate()),2,'<p>Le clavier de CiviKey, celui-ci affiche un clavier configur� via un fichier xml. En editant ce fichier, on peut ajouter ou modifier des touches, pour leur faire envoyer le texte souhait�. <br/>La couleur des touches est modifiable. <br/> Autre fonctionnalit�s : <br/> le clavier peut �tre configur� pour se minimiser au bout d''un temps d�fini d''inaction, minimisant l''espace pris par le clavier sur l''�cran.</p>')
--7
insert into dbo.tFeature(Title,Version,Progress,CreationDate,IdRoadMap,Description) values('Object Explorer','1.0.0',50,DATEADD(year,-1,GetDate()),2,'<p>Outil de configuration de CiviKey, reserv� aux utilisateurs confirm�s, il permet de d�cider du lancement automatique d''une fonctionnalit�, et de visualiser l''�tat du syst�me.</p>')
--8
insert into dbo.tFeature(Title,Version,Progress,CreationDate,IdRoadMap,Description) values('Automatic update','1.0.0',50,DATEADD(year,-1,GetDate()),2,'<p>Mise � jour automatique de CiviKey.</p>')

--New features
--9
insert into dbo.tFeature(Title,Version,Progress,CreationDate,IdRoadMap,Description) values('Pr�diction','1.0.0',100,DATEADD(year,-1,GetDate()),2,'<p>Cette fonctionnalit� affiche les mots les plus probables consid�rant les touches selectionn�es pr�c�demment via le clavier CiviKey. Cette pr�diction s''adapte � l''utilisateur, en permettant d''enregistrer d''autres mots. Elle augmente automatiquement la pond�ration des mots les plus utilis�s.</p>')
--10
insert into dbo.tFeature(Title,Version,Progress,CreationDate,IdRoadMap,Description) values('D�filement clavier','1.0.0',50,DATEADD(year,-1,GetDate()),2,'<p>Les touches du clavier sont ''allum�s'' l''une apr�s l''autre, pour permettre � un utilsiateur �quip� d''un simple contacteur d''activer des touches du clavier CiviKey. Permet de d�filer sur la panel contenant la pr�diction de mots.</p>')
--11
insert into dbo.tFeature(Title,Version,Progress,CreationDate,IdRoadMap,Description) values('D�filement souris','1.0.0',50,DATEADD(year,-1,GetDate()),2,'<p>Permet � un utilisateur �quip� d''un simple contacteur de d�placer la souris, via un syst�me de d�filement sur les diff�rentes zones de l''�cran. Peut-�tre associ� � l''auto clic pour lancer diff�rents types de clics.</p>')
--12
insert into dbo.tFeature(Title,Version,Progress,CreationDate,IdRoadMap,Description) values('Assistant cr�ation','1.0.0',50,DATEADD(year,-1,GetDate()),2,'<p>Permet de cr�er de nouveaux claviers, en choisissant les touches, leur taille et leur disposition.</p>')

--Creating sections in the features
--Old features
insert into dbo.tSection(Name,FeatureId) values('Affichage & selection de clic',5); --9
insert into dbo.tSection(Name,FeatureId) values('Logique de clic',5); --10
insert into dbo.tSection(Name,FeatureId) values('Autres',5); --11

insert into dbo.tSection(Name,FeatureId) values('Affichage',6); --12
insert into dbo.tSection(Name,FeatureId) values('Gestionnaire de claviers',6); --13
insert into dbo.tSection(Name,FeatureId) values('Autres',6); --14

insert into dbo.tSection(Name,FeatureId) values('Plugin principal',7); --15

insert into dbo.tSection(Name,FeatureId) values('Plugin principal',8); --16

--New features
insert into dbo.tSection(Name,FeatureId) values('Affichage',9); --17
insert into dbo.tSection(Name,FeatureId) values('Moteur de pr�diction',9); --18
insert into dbo.tSection(Name,FeatureId) values('Autres',9); --19

insert into dbo.tSection(Name,FeatureId) values('Affichage',10); --20
insert into dbo.tSection(Name,FeatureId) values('Logique de d�filement',10); --21
insert into dbo.tSection(Name,FeatureId) values('Autres',10); --22

insert into dbo.tSection(Name,FeatureId) values('Affichage',11); --23
insert into dbo.tSection(Name,FeatureId) values('Logique de d�filement',11); --24
insert into dbo.tSection(Name,FeatureId) values('Autres',11); --25

insert into dbo.tSection(Name,FeatureId) values('Affichage',12); --26
insert into dbo.tSection(Name,FeatureId) values('Autres',12); --27
--OK
--Creating plugins  --WTF.............................................................................................dunno what to do

--insert into dbo.tPlugin(Title,Version,Description,CreationDate) values('AutoClick','1.0.0','Plugin permettant de simuler des clics souris', DateAdd(year,-1,GetDate())) --1
--insert into dbo.tPlugin(Title,Version,Description,CreationDate) values('MouseWatcher','1.0.0','Plugin permettant de compter le temps d''inaction de la souris', DateAdd(year,-1,GetDate())) --2
--insert into dbo.tPlugin(Title,Version,Description,CreationDate) values('PointerDeviceDriver','1.0.0','Plugin permettant d''�couter les evenements souris', DateAdd(year,-1,GetDate())) --3

--insert into dbo.tPlugin(Title,Version,Description,CreationDate) values('CK.KeyboardContext','1.0.0','Le mod�le de claviers', DateAdd(year,-1,GetDate())) --4
--insert into dbo.tPlugin(Title,Version,Description,CreationDate) values('Simple skin','1.0.0','Le plugin d''affichage basique de CiviKey', DateAdd(year,-1,GetDate())) --5
--insert into dbo.tPlugin(Title,Version,Description,CreationDate) values('Simple skin editor','1.0.0','Edition des styles de touches du clavier', DateAdd(year,-1,GetDate())) --6

--insert into dbo.tPlugin(Title,Version,Description,CreationDate) values('Object Explorer','1.0.0','Plugin principal de la fonctionnalit� Object Explorer', DateAdd(year,-1,GetDate())) --7
--insert into dbo.tPlugin(Title,Version,Description,CreationDate) values('Update Checker','1.0.0','Plugin principal de la fonctionnalit� Automatic update', DateAdd(year,-1,GetDate())) --8

--Linking plugins and features

--insert into dbo.tSectionPlugin(SectionId,PluginId) values(1,1) --AutoClick
--insert into dbo.tSectionPlugin(SectionId,PluginId) values(2,2) --MouseWatcher
--insert into dbo.tSectionPlugin(SectionId,PluginId) values(2,3) --PointerDeviceDriver used by the autoclick plugin

--insert into dbo.tSectionPlugin(SectionId,PluginId) values(4,5) --CK.KeyboardContext --> Gestionnaire de clavier
--insert into dbo.tSectionPlugin(SectionId,PluginId) values(5,4) --Simple skin --> Affichage
--insert into dbo.tSectionPlugin(SectionId,PluginId) values(5,4) --Simple skin editor --> Affichage

--insert into dbo.tSectionPlugin(SectionId,PluginId) values(6,7) --Object Explorer --> Plugin principal

--insert into dbo.tSectionPlugin(SectionId,PluginId) values(7,8) --Update checker --> plugin principal

--Creating Participations

--10
insert into dbo.tParticipation(ContactRelationId,PartType,Percentage,ParticipationDate) values(5,'Sponsoring', 50, DateAdd(month,-5,GetDate()))
insert into dbo.tParticipationFeature(ParticipationId,FeatureId) values(10,9) --Invenietis has sponsored 50% of the Pr�diction Feature 

--11
insert into dbo.tParticipation(ContactRelationId,PartType,Percentage,ParticipationDate) values(7,'Sponsoring', 50, DateAdd(month,-5,GetDate()))
insert into dbo.tParticipationFeature(ParticipationId,FeatureId) values(11,9) --Alcatel has sponsored 50% of the Pr�diction Feature

--12
insert into dbo.tParticipation(ContactRelationId,PartType,Percentage,ParticipationDate) values(7,'Sponsoring', 100, DateAdd(month,-5,GetDate()))
insert into dbo.tParticipationFeature(ParticipationId,FeatureId) values(12,10) --Alcatel has sponsored 100% of the Defilement clavier

--13
insert into dbo.tParticipation(ContactRelationId,PartType,Percentage,ParticipationDate) values(7,'Sponsoring', 100, DateAdd(month,-5,GetDate()))
insert into dbo.tParticipationFeature(ParticipationId,FeatureId) values(13,11) --Alcatel has sponsored 100% of the Defilement souris

--14
insert into dbo.tParticipation(ContactRelationId,PartType,Percentage,ParticipationDate) values(5,'Sponsoring', 50, DateAdd(month,-5,GetDate()))
insert into dbo.tParticipationFeature(ParticipationId,FeatureId) values(14,12) --Invenietis has sponsored 50% of the Creation assistant

--15
insert into dbo.tParticipation(ContactRelationId,PartType,Percentage,ParticipationDate) values(7,'Sponsoring', 50, DateAdd(month,-5,GetDate()))
insert into dbo.tParticipationFeature(ParticipationId,FeatureId) values(15,12) --Alcatel has sponsored 50% of the Creation assistant

--OK
--Linking feature to categories
insert into dbo.tCategoryFeature (IdCategory, IdFeature) values (1,5) --Autoclick - clic
insert into dbo.tCategoryFeature (IdCategory, IdFeature) values (2,6) --Clavier - saisie
insert into dbo.tCategoryFeature (IdCategory, IdFeature) values (4,6) --Clavier - aide visuelle
insert into dbo.tCategoryFeature (IdCategory, IdFeature) values (5,7) --OE - noyau
insert into dbo.tCategoryFeature (IdCategory, IdFeature) values (5,8) --Update checker - noyau

insert into dbo.tCategoryFeature (IdCategory, IdFeature) values (2,9) --Prediction
insert into dbo.tCategoryFeature (IdCategory, IdFeature) values (2,10) --D�filement clavier 
insert into dbo.tCategoryFeature (IdCategory, IdFeature) values (3,11) --D�filement souris
insert into dbo.tCategoryFeature (IdCategory, IdFeature) values (5,12) --Assistant cr�ation
--OK
--Old features
insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial',5,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/fzzjgBAaWZw?rel=0')
insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial2',5,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/7VSR4_tAYvw?rel=0')

insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial',6,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/fzzjgBAaWZw?rel=0')
insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial2',6,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/7VSR4_tAYvw?rel=0')

insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial',7,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/fzzjgBAaWZw?rel=0')
insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial2',7,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/7VSR4_tAYvw?rel=0')

insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial',8,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/fzzjgBAaWZw?rel=0')
insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial2',8,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/7VSR4_tAYvw?rel=0')


--New features
insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial',9,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/fzzjgBAaWZw?rel=0')
insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial2',9,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/7VSR4_tAYvw?rel=0')

insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial',10,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/fzzjgBAaWZw?rel=0')
insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial2',10,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/7VSR4_tAYvw?rel=0')

insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial',11,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/fzzjgBAaWZw?rel=0')
insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial2',11,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/7VSR4_tAYvw?rel=0')

insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial',12,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/fzzjgBAaWZw?rel=0')
insert into dbo.tVideo (Name,FeatureId, CreationDate, VideoSource) values ('Tutorial2',12,DateAdd(month,-5,GetDate()),'http://www.youtube.com/embed/7VSR4_tAYvw?rel=0')



