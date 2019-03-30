﻿using System;
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
        public string Id { get; set; }
        public string Email { get; set; }
        public string commentBody { get; set; }
        public bool commentAnonymous { get; set; }
        public DateTime commentDate { get; set; }

    }
}