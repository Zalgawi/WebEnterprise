using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebEnterprise.Models
{
    public class Comment
    {
        //The Comment ID
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int commentId { get; set; }
        public int postId { get; set; }
        public int userId { get; set; }
    }
}