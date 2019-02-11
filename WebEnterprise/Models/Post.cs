using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebEnterprise.Models
{
    public class Post
    {
        [Key]
        public string postId { get; set; }
        public string userId { get; set; }
        

    }
}