﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CiviKey.Models;
using CiviKey.Repositories;

namespace CiviKey.ViewModel
{
    public class FeatureViewModel
    {
        tFeature _model;
        PartnerRepository _partnerRepo;
        ContactRepository _contactRepo;
        ContactRelationRepository _contactRelationRepo;
        public FeatureViewModel( tFeature model, PartnerRepository partnerRepo, ContactRepository contactRepo, ContactRelationRepository contactRelationRepo )
        {
            _contactRelationRepo = contactRelationRepo;
            _partnerRepo = partnerRepo;
            _contactRepo = contactRepo;
            _model = model;
            GenerateViewModels( model );
        }

        private void GenerateViewModels( tFeature model )
        {
            //_model.tParticipations.Where( x => x.PartType == "Developpement" ).ToList();

            _categories = model.tCategories.Select(c => new CategoryViewModel(c)).ToList();

            _sponsors = model.tParticipations.Where(x => x.PartType == ParticipationType.Sponsoring.ToString())
                .Select(p => new ParticipationViewModel(p, _partnerRepo, _contactRepo, _contactRelationRepo))
                .ToList();

            _sections = model.tSections.Select(s => new SectionViewModel(s)).ToList();
            _videos = model.tVideos.Select(v => new VideoViewModel(v)).ToList();

            //_developers = new List<ParticipationViewModel>();
            Participations = new Dictionary<int, IList<ParticipationViewModel>>();
            foreach( var participation in model.tParticipations.Where( x => x.PartType == ParticipationType.Development.ToString() ) )
            {
                ParticipationViewModel vm = new ParticipationViewModel( participation, _partnerRepo, _contactRepo,_contactRelationRepo );
                if( _mainDevelopementParticipation == null ) _mainDevelopementParticipation = vm;
                if( participation.Percentage > _mainDevelopementParticipation.Percentage ) _mainDevelopementParticipation = vm;
                //_developers.Add( vm );
                var existings = FindOrCreateCompany(participation.tContactRelation.EntityId);
                existings.Add(vm);
            }

            //Getting the company of the person that has participated the most in the project.
            //Todo : do it properly - if 2 guys from invenietis dev 20% + 20% of a feature and another guy develops 30%, the last one's company will be set as main developper...
            if( _mainDevelopementParticipation != null )
            {
                if( !_mainDevelopementParticipation.Contact.IsOrganization ) _mainDevelopingCompany = _mainDevelopementParticipation.Contact.Organization;
                else _mainDevelopingCompany = _mainDevelopementParticipation.Contact;
            }
        }

        IList<ParticipationViewModel> FindOrCreateCompany(int companyId)
        {
            IList<ParticipationViewModel> contacts = null;
            if (!Participations.TryGetValue(companyId, out contacts))
            {
                contacts = new List<ParticipationViewModel>();
                Participations.Add(companyId, contacts);
            }
            return contacts;
        }

        ParticipationViewModel _mainDevelopementParticipation;
        ContactViewModel _mainDevelopingCompany;
        public ContactViewModel MainDeveloper { get { return _mainDevelopingCompany; } }

        public DateTime CreationDate { get { return _model.CreationDate; } }
        public int Id { get { return _model.Id; } }
        public int Progress { get { return _model.Progress; } }
        public string Title { get { return _model.Title; } }
        public Version Version { get { return new Version( _model.Version ); } }
        public string Description { get { return _model.Description; } }

        IList<CategoryViewModel> _categories;
        public IList<CategoryViewModel> Categories { get { return _categories; } }

        IList<VideoViewModel> _videos;
        public IList<VideoViewModel> Videos { get { return _videos; } }

        //IList<ParticipationViewModel> _developers;
        //public IList<ParticipationViewModel> Developers { get { return _developers; } }

        public IDictionary<int, IList<ParticipationViewModel>> Participations { get; private set; }

        IList<ParticipationViewModel> _sponsors;
        public IList<ParticipationViewModel> Sponsors { get { return _sponsors; } }

        IList<SectionViewModel> _sections;
        public IList<SectionViewModel> Sections { get { return _sections; } }

    }
}