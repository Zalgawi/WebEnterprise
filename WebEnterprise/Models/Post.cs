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
        // Foreign key to customer
        
        public string Id { get; set; }
        public string Email { get; set; }
        public string postTitle { get; set; }
        public string postBody { get; set; }
        public string postDepartment { get; set; }
        public string postCategory { get; set; }
        public bool postAnonymous { get; set; }
        public int postLikes { get; set; }
        public int postDislikes { get; set; }
        public DateTime postDate { get; set; }
   
       public void totalLikes()
        {
            if (postLikes != 0 || postDislikes != 0)
            {
                var likesORdislikesTotal = postLikes - postDislikes;
            }
        }


    }
}