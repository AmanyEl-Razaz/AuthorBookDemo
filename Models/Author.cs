//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Demo.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Author
    {
        public int ID { get; set; }
        public string AuthorName { get; set; }
        public Nullable<int> BookID { get; set; }
    
        public virtual Book Book { get; set; }
    }
}
