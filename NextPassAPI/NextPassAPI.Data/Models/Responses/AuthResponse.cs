using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NextPassAPI.Data.Models.Responses
{
    public class AuthResponse
    {
        public string Token { get; set; }
        public string RefreshToken { get; set; }
        public DateTime Expires { get; set; }
        public string Role { get; set; }
        public DateTime IssuedAt { get; set; }

    }
}
