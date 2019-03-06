using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebEnterprise.Models
{
    public class Post
    {
        //The post ID
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int postId { get; set; }
        public int userId { get; set; }
        public string postBody { get; set; }
        public string postDescription { get; set; }
        public string postCategory { get; set; }

        

    }
}