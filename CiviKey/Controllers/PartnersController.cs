﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CiviKey.Models;
using CiviKey.ViewModel;
using CiviKey.Repositories;
using System.IO;

namespace CiviKey.Controllers
{
    public class PartnersController : Controller
    {
        private ContactRelationRepository _entities;

        PartnerRepository _partnerRepo;
        ContactRepository _contactRepo;
        ContactRelationRepository _contactRelationRepo;


        public PartnersController( ContactRelationRepository c, PartnerRepository partnerRepo, ContactRepository contactRepo, ContactRelationRepository contactRelationRepo )
        {
            _entities = c;
            _partnerRepo = partnerRepo;
            _contactRepo = contactRepo;
            _contactRelationRepo = contactRelationRepo;
        }

        public ActionResult Index()
        {
            IList<tContact> contactList;
            IList<ContactViewModel> contactViewModel = new List<ContactViewModel>();
            ViewBag.Section = Sections.Partners;


            contactList = _entities.GetContactList();

            foreach( tContact contact in contactList )
            {
                contactViewModel.Add( new ContactViewModel( contact, _partnerRepo, _contactRepo, _contactRelationRepo ) );
            }

            Random rng = new Random();
            int n = contactViewModel.Count;
            while( n > 1 )
            {
                n--;
                int k = rng.Next( n + 1 );
                ContactViewModel value = contactViewModel[k];
                contactViewModel[k] = contactViewModel[n];
                contactViewModel[n] = value;
            }

            ViewBag.Title = "CiviKey - Partenaires";
            return View( contactViewModel );
        }

        public ActionResult GetPartnerPage( string name )
        {
            ViewEngineResult result = ViewEngines.Engines.FindView( ControllerContext, Path.Combine("Views", name), null );
            if( result.View == null ) return RedirectToAction("Index");

            return View( result.View );
        }

    }
}
