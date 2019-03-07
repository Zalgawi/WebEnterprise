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
        // Foreign key to Post
        [ForeignKey("Post")]
        public int postId { get; set; }
        public virtual Post Post { get; set; }
        // Foreign key to User
        [ForeignKey("ApplicationUser")]
        public string Id { get; set; }
        public virtual ApplicationUser ApplicationUser { get; set; }
        public string commentBody { get; set; }
    }
}