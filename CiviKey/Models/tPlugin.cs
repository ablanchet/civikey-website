//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

namespace CiviKey.Models
{
    public partial class tPlugin
    {
        public tPlugin()
        {
            this.tSections = new HashSet<tSection>();
        }
    
        public int Id { get; set; }
        public string Title { get; set; }
        public string Descr { get; set; }
        public System.DateTime CreationDate { get; set; }
    
        public virtual ICollection<tSection> tSections { get; set; }
    }
    
}
