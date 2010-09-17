$(document).ready(function() {

  $('.rounded').corner();

  $("#notices").click(function() {
    $("#notices").slideUp(); 
  });
  
  $("#shared_url").hide();
  $("#shared_button").click(function() {
    $("#shared_url").slideToggle();
  });
  
   $('.tooltip').each(function()
   {
      $(this).qtip({
         content: $(this).attr('tooltip'), // Use the tooltip attribute of the element for the content
         show: 'mouseover',
         hide: 'mouseout',
         position: {
            corner: {
               target: 'topMiddle',
               tooltip: 'bottomMiddle'
            }
         },
         style: {
            border: {
               width: 5,
               radius: 10
            },
            padding: 10, 
            textAlign: 'center',
            tip: true, // Give it a speech bubble tip with automatic corner detection
            name: 'cream' // Style it according to the preset 'cream' style
         }
      });
   });
   
  $('.show').qtip({
   content: 'Show',
   show: 'mouseover',
   hide: 'mouseout',
   position: {
      corner: {
         target: 'topMiddle',
         tooltip: 'bottomMiddle'
      }
   },
   style: {
      border: {
         width: 5,
         radius: 10
      },
      padding: 10, 
      textAlign: 'center',
      tip: true, // Give it a speech bubble tip with automatic corner detection
      name: 'cream' // Style it according to the preset 'cream' style
   }
  });
   
  $('.edit').qtip({
   content: 'Edit',
   show: 'mouseover',
   hide: 'mouseout',
   position: {
      corner: {
         target: 'topMiddle',
         tooltip: 'bottomMiddle'
      }
   },
   style: {
      border: {
         width: 5,
         radius: 10
      },
      padding: 10, 
      textAlign: 'center',
      tip: true, // Give it a speech bubble tip with automatic corner detection
      name: 'cream' // Style it according to the preset 'cream' style
   }
  });
   
  $('.delete').qtip({
   content: 'Delete',
   show: 'mouseover',
   hide: 'mouseout',
   position: {
      corner: {
         target: 'topMiddle',
         tooltip: 'bottomMiddle'
      }
   },
   style: {
      border: {
         width: 5,
         radius: 10
      },
      padding: 10, 
      textAlign: 'center',
      tip: true, // Give it a speech bubble tip with automatic corner detection
      name: 'cream' // Style it according to the preset 'cream' style
   }
  });
   
  $('.status').qtip({
   content: 'Completed?',
   show: 'mouseover',
   hide: 'mouseout',
   position: {
      corner: {
         target: 'topMiddle',
         tooltip: 'bottomMiddle'
      }
   },
   style: {
      border: {
         width: 5,
         radius: 10
      },
      padding: 10, 
      textAlign: 'center',
      tip: true, // Give it a speech bubble tip with automatic corner detection
      name: 'cream' // Style it according to the preset 'cream' style
   }
  });
   
  $('.tasktitle').qtip({
   content: $('.tasktitle').attr('tasklist'),
   show: 'mouseover',
   hide: 'mouseout',
   position: {
      corner: {
         target: 'topMiddle',
         tooltip: 'bottomMiddle'
      }
   },
   style: {
      border: {
         width: 5,
         radius: 10
      },
      padding: 10, 
      textAlign: 'center',
      tip: true, // Give it a speech bubble tip with automatic corner detection
      name: 'cream' // Style it according to the preset 'cream' style
   }
  });
   
  $('#user_username').qtip({
   content: 'Enter your username here.',
   show: 'mouseover',
   hide: 'mouseout',
   position: {
      corner: {
         target: 'topMiddle',
         tooltip: 'bottomMiddle'
      }
   },
   style: {
      border: {
         width: 5,
         radius: 10
      },
      padding: 10, 
      textAlign: 'center',
      tip: true, // Give it a speech bubble tip with automatic corner detection
      name: 'cream' // Style it according to the preset 'cream' style
   }
  });
  
  $('#user_password').qtip({
   content: 'Enter your password here.',
   show: 'mouseover',
   hide: 'mouseout',
   position: {
      corner: {
         target: 'topMiddle',
         tooltip: 'bottomMiddle'
      }
   },
   style: {
      border: {
         width: 5,
         radius: 10
      },
      padding: 10, 
      textAlign: 'center',
      tip: true, // Give it a speech bubble tip with automatic corner detection
      name: 'cream' // Style it according to the preset 'cream' style
   }
  });
  
  $('#user_password_confirmation').qtip({
   content: 'Please enter your password one more time.',
   show: 'mouseover',
   hide: 'mouseout',
   position: {
      corner: {
         target: 'topMiddle',
         tooltip: 'bottomMiddle'
      }
   },
   style: {
      border: {
         width: 5,
         radius: 10
      },
      padding: 10, 
      textAlign: 'center',
      tip: true, // Give it a speech bubble tip with automatic corner detection
      name: 'cream' // Style it according to the preset 'cream' style
   }
  });
  
  $('#user_remember_me').qtip({
   content: 'Not recommended for public computers, such as the library.',
   show: 'mouseover',
   hide: 'mouseout',
   position: {
      corner: {
         target: 'topMiddle',
         tooltip: 'bottomMiddle'
      }
   },
   style: {
      border: {
         width: 5,
         radius: 10
      },
      padding: 10, 
      textAlign: 'center',
      tip: true, // Give it a speech bubble tip with automatic corner detection
      name: 'cream' // Style it according to the preset 'cream' style
   }
  });
  
  $('#user_email').qtip({
   content: 'Please enter your email address, our secret.',
   show: 'mouseover',
   hide: 'mouseout',
   position: {
      corner: {
         target: 'topMiddle',
         tooltip: 'bottomMiddle'
      }
   },
   style: {
      border: {
         width: 5,
         radius: 10
      },
      padding: 10, 
      textAlign: 'center',
      tip: true, // Give it a speech bubble tip with automatic corner detection
      name: 'cream' // Style it according to the preset 'cream' style
   }
  });
  $('#list_title').qtip({
   content: 'Give your new list a name.',
   show: 'mouseover',
   hide: 'mouseout',
   position: {
      corner: {
         target: 'topMiddle',
         tooltip: 'bottomMiddle'
      }
   },
   style: {
      border: {
         width: 5,
         radius: 10
      },
      padding: 10, 
      textAlign: 'center',
      tip: true, // Give it a speech bubble tip with automatic corner detection
      name: 'cream' // Style it according to the preset 'cream' style
   }
  });
  
  $('#listshare').qtip({
   content: 'Sharing your list will allow it to be viewable by other members.',
   show: 'mouseover',
   hide: 'mouseout',
   position: {
      corner: {
         target: 'topLeft',
         tooltip: 'bottomLeft'
      }
   },
   style: {
      border: {
         width: 5,
         radius: 10
      },
      padding: 10, 
      textAlign: 'center',
      tip: true, // Give it a speech bubble tip with automatic corner detection
      name: 'cream' // Style it according to the preset 'cream' style
   }
  });
  
  $('#task_list_id').qtip({
   content: 'Select a list to put this task in.',
   show: 'mouseover',
   hide: 'mouseout',
   position: {
      corner: {
         target: 'topMiddle',
         tooltip: 'bottomMiddle'
      }
   },
   style: {
      border: {
         width: 5,
         radius: 10
      },
      padding: 10, 
      textAlign: 'center',
      tip: true, // Give it a speech bubble tip with automatic corner detection
      name: 'cream' // Style it according to the preset 'cream' style
   }
  });
  
  $('#task_priority_id').qtip({
   content: 'Priorities help you order the importance of your tasks.',
   show: 'mouseover',
   hide: 'mouseout',
   position: {
      corner: {
         target: 'topMiddle',
         tooltip: 'bottomMiddle'
      }
   },
   style: {
      border: {
         width: 5,
         radius: 10
      },
      padding: 10, 
      textAlign: 'center',
      tip: true, // Give it a speech bubble tip with automatic corner detection
      name: 'cream' // Style it according to the preset 'cream' style
   }
  });
  
  $('#task_title').qtip({
   content: 'Give your task a name.',
   show: 'mouseover',
   hide: 'mouseout',
   position: {
      corner: {
         target: 'topMiddle',
         tooltip: 'bottomMiddle'
      }
   },
   style: {
      border: {
         width: 5,
         radius: 10
      },
      padding: 10, 
      textAlign: 'center',
      tip: true, // Give it a speech bubble tip with automatic corner detection
      name: 'cream' // Style it according to the preset 'cream' style
   }
  });
  
  $('#taskstatus').qtip({
   content: 'Have you completed this task yet?',
   show: 'mouseover',
   hide: 'mouseout',
   position: {
      corner: {
         target: 'topLeft',
         tooltip: 'bottomLeft'
      }
   },
   style: {
      border: {
         width: 5,
         radius: 10
      },
      padding: 10, 
      textAlign: 'center',
      tip: true, // Give it a speech bubble tip with automatic corner detection
      name: 'cream' // Style it according to the preset 'cream' style
   }
  });
});
