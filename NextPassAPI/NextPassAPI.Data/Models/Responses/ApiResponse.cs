using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NextPassAPI.Data.Models.Responses
{
    public class ApiResponse<T>(bool success, string message, T data)
    {
        public bool Success { get; set; } = success;
        public string Message { get; set; } = message;
        public T Data { get; set; } = data;
    }
}
