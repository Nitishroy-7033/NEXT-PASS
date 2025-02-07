using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace NextPassAPI.Data.Models
{
    public class User
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; } 
        public string Email { get; set; } 
        public string HashedPassword { get; set; } 
        public string Salt { get; set; } 
        public DateTime CreatedAt { get; set; } 
        public DateTime LastLogin { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string PhoneNumber { get; set; }
        public string PasswordHash { get; set; }
        public bool IsVerified { get; set; }
        public DateTime? VerificationDate { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public string? ProfilePicture { get; set; }
        public DateTime UpdatedAt { get; set; }
        public string Role { get; set; }
        public bool IsDeleted { get; set; }
    }
}
