//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SPS
{
    using System;
    using System.Collections.Generic;
    
    public partial class Payment
    {
        public int Id { get; set; }
        public string Order_id { get; set; }
        public string Name_Of_Card { get; set; }
        public string Card_Number { get; set; }
        public Nullable<int> Exp_Month { get; set; }
        public Nullable<int> Exp_Year { get; set; }
        public Nullable<int> CVV { get; set; }
        public string Order_Details_id { get; set; }
        public string Datetime { get; set; }
    }
}