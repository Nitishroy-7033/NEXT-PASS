using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NextPassAPI.Data.Models
{
    public class JwtSettings
    {
        public string Subject { get; set; }       
        public string Issuer { get; set; }        
        public string Audience { get; set; }      
        public string Key { get; set; }           
        public int ExpireMinutes { get; set; }    
    }
}
