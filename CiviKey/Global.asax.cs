﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Microsoft.Practices.Unity;
using CK.Web.Mvc.Unity;
using CK.Web.Unity;
using CiviKey.Models;
using CiviKey.Repositories;

namespace CiviKey
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters( GlobalFilterCollection filters )
        {
            filters.Add( new HandleErrorAttribute() );
        }

        public static void RegisterRoutes( RouteCollection routes )
        {
            routes.IgnoreRoute( "{resource}.axd/{*pathInfo}" );

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters( GlobalFilters.Filters );
            RegisterRoutes( RouteTable.Routes );

            UnityContainer c = new UnityContainer();
            c.RegisterType<IControllerActivator, UnityControllerActivator>( new ContainerControlledLifetimeManager() );
            c.RegisterType<CiviKeyEntities>( new UnityPerWebRequestLifetimeManager() );
            c.RegisterType<ContactRepository>( new UnityPerWebRequestLifetimeManager() );
            c.RegisterType<FeatureRepository>( new UnityPerWebRequestLifetimeManager() );
            c.RegisterType<ParticipationRepository>( new UnityPerWebRequestLifetimeManager() );
            c.RegisterType<PartnerRepository>( new UnityPerWebRequestLifetimeManager() );
            DependencyResolver.SetResolver( new UnityDependencyResolver( c ) );
        }
    }
}