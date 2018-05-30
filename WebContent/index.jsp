<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>index</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <script src="https://threejs.org/examples/js/libs/stats.min.js"></script>
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
    <link rel="stylesheet" href="index.css">
    <script type="text/javascript">
    $(document).ready(function () {
      /* ---- particles.js config ---- */
    particlesJS("particles-js", {
      "particles": {
        "number": {
          "value": 180,
          "density": {
            "enable": true,
            "value_area": 800
          }
        },
        "color": {
          "value": "#ffffff"
        },
        "shape": {
          "type": "circle",
          "stroke": {
            "width": 0,
            "color": "#000000"
          },
          "polygon": {
            "nb_sides": 5
          },
          "image": {
            "src": "img/github.svg",
            "width": 100,
            "height": 100
          }
        },
        "opacity": {
          "value": 0.5,
          "random": false,
          "anim": {
            "enable": false,
            "speed": 1,
            "opacity_min": 0.1,
            "sync": false
          }
        },
        "size": {
          "value": 3,
          "random": true,
          "anim": {
            "enable": false,
            "speed": 40,
            "size_min": 0.1,
            "sync": false
          }
        },
        "line_linked": {
          "enable": true,
          "distance": 150,
          "color": "#ffffff",
          "opacity": 0.4,
          "width": 1
        },
        "move": {
          "enable": true,
          "speed": 6,
          "direction": "none",
          "random": false,
          "straight": false,
          "out_mode": "out",
          "bounce": false,
          "attract": {
            "enable": false,
            "rotateX": 600,
            "rotateY": 1200
          }
        }
      },
      "interactivity": {
        "detect_on": "canvas",
        "events": {
          "onhover": {
            "enable": true,
            "mode": "grab"
          },
          "onclick": {
            "enable": true,
            "mode": "push"
          },
          "resize": true
        },
        "modes": {
          "grab": {
            "distance": 140,
            "line_linked": {
              "opacity": 1
            }
          },
          "bubble": {
            "distance": 400,
            "size": 40,
            "duration": 2,
            "opacity": 8,
            "speed": 3
          },
          "repulse": {
            "distance": 200,
            "duration": 0.4
          },
          "push": {
            "particles_nb": 4
          },
          "remove": {
            "particles_nb": 2
          }
        }
      },
      "retina_detect": true
    });

    /* ---- stats.js config ---- */
    });

    </script>

  </head>
  <body>
    <body>
    <div id="load"></div>
    <div id="contents">
<div id="particles-js"></div>

      <nav class="navbar navbar-expand-lg fixed-top navbar-dark">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon "></span>
      </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
        <div class="menu">
        <div id="menu-center" >
          <a class="navbar-brand" href="#"><span class="logo">Record Management System</span></a>
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0" id="myDiv">
            <li class="nav-item">
              <a class="nav-link active" href="#fpage_home">Home</a>
            </li>
            
            <li class="nav-item">
              <a class="nav-link" href="#fpage_moto">Moto</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#fpage_front">Front</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="#fpage_hippa">Hippa</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#fpage_working">Working</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#fpage_contact">Contact</a>
            </li>
          </ul>
      </div>
      </div>
        </div>
      </nav>

<div class="page_home" id="fpage_home">
<div class="container">
  <div class="row" >
         <div class="col-md-3"></div>
         <div class="col-md-6" >
           <div class="text-center" style="font-weight:bold;">
          <div style="font-family:monospace;">
             <h1 class="display-6 text-info">Record Management System</h1>
             <h5 class="text-info">using</h5>
             <h2 class="text-info">BLOCKCHAIN</h2>
          </div>
              
<div class="row">
  <div class="col-md-3"></div>
  <div class="col-md-6">
    <img src="image/file.png" width="300" height="300" alt="FILE_LOGO" style="opacity:0.5">
  </div>
  <div class="col-md-3"></div> 
</div><br>

            
            
           <a href="#fpage_moto" class="btn btn-danger btn-lg" aria-label="Left Align"> <span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>EXPLORE</a>


           <!-- Button trigger modal -->
   <button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#exampleModalCenter" aria-label="Left Align">
      <span class="glyphicon glyphicon-triangle-bottom " aria-hidden="true"></span>LOG-IN
   </button>

   <!-- Modal -->
   <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
     <div class="modal-dialog modal-dialog-centered" role="document">
       <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="exampleModalLongTitle">Log-In</h5>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
           </button>
         </div>
         <div class="modal-body">
          <form id="form1">
            <div class="form-group">
              <input type="text" name="username" placeholder="Username" class="form-control" required>
            </div>
            <div class="form-group">
              <input type="password" name="password" placeholder="Password" class="form-control" required>
            </div>
            <br>
            <div class="row">
             <div class="col-md-12">
                
               <div class="form-group">
              <input type="submit" name="submit" value="submit" class="form-control btn btn-danger">
            </div>
             </div>
            </div>
          </form>
         </div>
         <div class="modal-footer">
           <a href="forgot.jsp" target="_blank" class="text-light">Forgot-Password?</a><br>
           <div class="bg-danger text-center" id="result_authentication"></div>
           <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
           <button type="button" class="btn btn-primary">Save changes</button> -->

               </div>
             </div>
           </div>
         </div>

       </div>
     </div>
     <div class="col-md-3"></div>

   </div>
     </div>
  </div>
  
  
  <div class="page_moto" id="fpage_moto">
    <div class="container-fluid">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
        <div class="text-light" style="height:600px; width:100%; background:black;">
        <div class=" container text-center" style="padding:100px;">
        <h1 class="display-3">OUR MOTO</h1>
        <h4 class="text-info" style="text-align:justify;">
        <ul>
        <li>To preserve CIA (Confidentiality, Integrity & Availability) of records in organizations.</li><br>
        <li>A web application for Hospital records management (Patient's record).</li>
        <br><li><strong>HIPPA</strong> states rules & law to protect patients health information from getting unauthorized access.</li>
        <br><li><strong>BLOCKCHAIN</strong> is the new technology which will be the key part of this project.</li>
        </ul>    
        </h4>
      </div>
      </div>
        </div>
        </div>
      </div>
    </div>
  </div>
  
  <div class="page_front" id="fpage_front">
    <div class="container-fluid">
    <div class="container-fluid">
       <div class="row">
         <div class="col-md-12">
         <!-- SLIDE SHOW-<input type="checkbox" checked data-toggle="toggle" value="yes" id="toggleSlide"> -->
           <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel"  data-interval="false">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>

  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <div class="text-light" style="height:600px; width:100%; background:black;">
      <div class=" container text-center" style="padding:100px;">
        <h1 class="display-3">WHAT IS BLOCKCHAIN ?</h1>
        <img src="image/blocklogo.png" alt="logo" width="100%" height="220px;">
        <blockquote class="blockquote">
        <h4 class="text-light">The blockchain is an incorruptible digital ledger of economic transactions that can be programmed to record not just financial transactions but virtually everything of value.</h4>
      </blockquote>
      </div>
      </div>
    </div>
    <div class="carousel-item ">
      <div class="text-light" style="height:600px; width:100%; background:black;">
      <div class="text-center" style="padding-top:50px;">
        <h1 class="display-5">A distributed database</h1>
       <div class="row" style="padding:60px;">
           <div class="col-md-6">
             <img src="image/db.png" alt="DB" width="500px" height="300px;">
           </div>
           <div class="col-md-5" style="padding-top:75px;">
             <h4>Picture a spreadsheet that is duplicated thousands of times across a network of computers. Then imagine that this network is designed to regularly update this spreadsheet and you have a basic understanding of the blockchain.</h4>
           </div>
           <div class="col-md-1"></div>
         </div>
      </div>
      </div>

    </div>
    <div class="carousel-item">
      <div class="text-light" style="height:600px; width:100%; background:black;">
      <div class="text-center" style="padding-top:50px;">
        <h1 class="display-5">Blockchain as Google Docs</h1>
       <div class="row" style="padding:60px;">
           <div class="col-md-6">
             <img src="image/db.png" alt="DB" width="300px" height="200px;">
           </div>
           <div class="col-md-6">
            <img src="image/googledoc.png" alt="GoogleDoc" width="300px" height="200px;">
          </div>
         </div>
         <h4>With Google Docs (or Google Sheets), both parties have access to the same document at the same time, and the single version of that document is always visible to both of them. It is like a shared ledger, but it is a shared document. The distributed part comes into play when sharing involves a number of people.</h4>
      </div>
      </div>
    </div>
    <div class="carousel-item">
      <div class="text-light bg-dark" style="height:600px; width:100%; ">
      <div class="text-center" style="padding-top:50px;">
        <h1 class="display-5">Structures</h1>
       <div class="row" style="padding:10px;">
           <div class="col-md-12">
             <img src="image/image1.png" alt="IMAGE" width="100%" >
          </div>
         </div>
      </div>
      </div>
    </div>
    
    
      <div class="carousel-item">
      <div class="text-light bg-dark" style="height:600px; width:100%;">
      <div class="text-center" style="padding-top:50px;">
        <h1 class="display-5">Structures</h1>
       <div class="row" style="padding:10px;">
           <div class="col-md-12">
             <iframe width="800" height="400" src="https://www.youtube.com/embed/6WG7D47tGb0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
          </div>
         </div>
        </div>
      </div>
    </div>
    
    
    
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
         </div>
       </div>
     </div>
 
</div>
  </div>



  <div class="page_profile" id="fpage_hippa">
        <div class="container-fluid">
        <div class="container-fluid">
       <div class="row">
         <div class="col-md-12">
         <!-- SLIDE SHOW-<input type="checkbox" checked data-toggle="toggle" value="yes" id="toggleSlide"> -->
           <div id="carouselExampleIndicators1" class="carousel slide" data-ride="carousel"  data-interval="false">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators1" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators1" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators1" data-slide-to="2"></li>
    <li data-target="#carouselExampleIndicators1" data-slide-to="3"></li>

  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <div class="text-light" style="height:600px; width:100%; background:black;">
      <div class=" container text-center" style="padding:100px;">
        <h1 class="display-3">WHAT DOES HIPPA SAY ?</h1>
        <img src="image/hippa.png" alt="logo" width="40%" height="220px;">
        <blockquote class="blockquote">
        <h4 class="text-light">
        HIPPA stands for "Health Insurance Portability and Accountability Act". It is a regulation designed to protect personal information and data collected and stored in medical records.
      </blockquote>
      </div>
      </div>
    </div>
    <div class="carousel-item ">
      <div class="text-light" style="height:600px; width:100%; background:black;">
      <div class="text-center" style="padding-top:50px;">
        <h1 class="display-5">Its an ACT, not a STANDARD</h1>
       <div class="row" style="padding:60px;">
           <div class="col-md-12">
           <h4 style="text-align:justify;">
           The Health Insurance Portability and Accountability Act of 1996, which is United States legislation that sets data privacy and security provisions for safeguarding medical information, such as medical records and other identifiable health information. <br> <br>
            <ul>             
             <li>The Privacy Rule covers the use and disclosure of protected health information (PHI) and the standards that must be upheld for individuals to understand and control how their individually identifiable health information is used by an organization.</li>
             
             <li>The Security Rule sets out what security standards must be in place to protect electronic protected health information (ePHI), which is health information or health records that are held or transferred in electronic form. This includes defining technical safeguards, physical safeguards and administrative safeguards.</li>
             <li>The Enforcement Rule sets out how HIPAA will be enforced and what will happen if non-compliance is discovered.</li>
             </ul>
             </h4>
           </div>
       
         </div>
      </div>
      </div>

    </div>
    <div class="carousel-item">
      <div class="text-light" style="height:600px; width:100%; background:black;">
      <div class="text-center" style="padding-top:50px;">
        <h1 class="display-5">Who does HIPAA apply to?</h1>
       <div class="row" style="padding:60px;">
           <div class="col-md-12">
                <h4 style="text-align:justify;">
                
                HIPAA regulations apply to Covered Entities and their Business Associates. A covered entity is defined as:<br><br>
                <ul>
                <li>A health care provider such as doctors, clinics, or pharmacies.</li>
                <li>A health plan such as health insurance companies, HMOs, and company health plans.</li>
                <li>A health care clearinghouse who process nonstandard health information they receive from another entity into a standard.</li>
                <li>A third party administrator that assists a health insurer with claims processing</li>
                <li>An attorney whose services involve access to PHI</li>
                <li>An email encryption provider like Paubox</li>
                </ul>                
                </h4>      
           </div>
         </div>
      </div>
      </div>
    </div>
    
    <div class="carousel-item">
      <div class="text-light bg-dark" style="height:600px; width:100%;">
      <div class="text-center" style="padding-top:50px;">
        <h1 class="display-5">Structures</h1>
       <div class="row" style="padding:10px;">
           <div class="col-md-12">
          <iframe width="560" height="315" src="https://www.youtube.com/embed/z21nBB2_Lf4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>          </div>
         </div>
        </div>
      </div>
    </div>
    
    
    
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators1" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators1" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
         </div>
       </div>
     </div>
 
    </div>
  </div>
  
  
  
  
  
  <div class="page_profile" id="fpage_working">
        <div class="container-fluid">
        <div class="container-fluid">
       <div class="row">
         <div class="col-md-12">
         <!-- SLIDE SHOW-<input type="checkbox" checked data-toggle="toggle" value="yes" id="toggleSlide"> -->
           <div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel"  data-interval="false">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators2" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators2" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators2" data-slide-to="2"></li>
    <li data-target="#carouselExampleIndicators2" data-slide-to="3"></li>
    <li data-target="#carouselExampleIndicators2" data-slide-to="4"></li>
    <li data-target="#carouselExampleIndicators2" data-slide-to="5"></li>

  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <div class="text-light" style="height:600px; width:100%; background:black;">
      <div class=" container text-center" style="padding:100px;">
        <h1 class="display-3">WHAT ARE WE DOING ?</h1>
        
        <h4 class="text-light" style="text-align:justify;"> We are ensuring the Integrity, Confidentiality & Availability of data by using BLOCKCHAIN technology.
        <br><br>
        <ul>
        <li>Blockchain has hashing (SHA-256) concept included which verify the integrity of data. It reduces the chances of tampering almost 100%. </li><br>
        <li>Only authorize person can access the data which assure the confidentiality. </li><br>
        <li>Distributed database concept makes data available all the time. </li><br>
        <li>We can also say it as a Archiving of data. </li>
        
        </ul>
        </h4>
        <div class="row">
        <div class="col-md-6">
        </div>
         <div class="col-md-6">
        </div>
        </div>
         
      </div>
      </div>
    </div>
    <div class="carousel-item ">
      <div class="text-light" style="height:600px; width:100%; background:black;">
      <div class="text-center" style="padding-top:50px;">
        <h1 class="display-5">What are We Using ?</h1>
       <div class="row" style="padding:60px;">
           <div class="col-md-12">
           <h4 style="text-align:justify;">
           
            <ul>             
             <li>For Blockchain: A ETHEREUM VIRTUAL MACHINE, WEB3.JS Framework, Remix IDE for Smart Contract.</li><br>
             
             <li>Server: Apache, Tomcat, Ethereum Server</li><br>
             <li>Database: MySQL</li><br>
             <li>FrontEnd: HTML, BOOTSTRAP, JQUERY, JAVASRIPT, CSS, JQUERY-CONFIRM-UI, PARTICLE-JS, JSP </li><br>
             <li>BackEnd: JAVA SERVLET, SOLIDITY, AJAX, JSP, WEB3.JS</li>
             </ul>
             </h4>
           </div>
       
         </div>
      </div>
      </div>

    </div>
    
    <div class="carousel-item">
      <div class="text-light" style="height:600px; width:100%; background:black;">
      <div class="text-center" style="padding-top:50px;">
        <h1 class="display-5">Steps Involved :-</h1>
       <div class="row" style="padding:60px;">
           <div class="col-md-12">
                <h4 style="text-align:justify;">
                
                
                <ul>
                <li>Starting Apache server, Tomcat Server, and Ethereum Server.</li><br>
                <li>Creating node (server) into diferent systems available in network.</li><br>
                <li>Deploying Smart Contract.</li><br>
                <li>Admin: Create and manage operators with appropriate roles and info. Manage DB.</li><br>
                <li>Operator: User Entries & Management, Blockchain Entries, Statistics. </li><br>
                <li>Employee: Can view the some data like patient's data (from DB & Blockchain) and Users queries.</li><br>
                <li>Miners: Mine data.</li>
                
                
               
                
                </ul>                
                </h4>      
           </div>
         </div>
      </div>
      </div>
    </div>
    
    <div class="carousel-item">
      <div class="text-light" style="height:600px; width:100%; background:black;">
      <div class="text-center" style="padding-top:50px;">
        <h1 class="display-5">Why are we Using DataBase?</h1>
       <div class="row" style="padding:60px;">
           <div class="col-md-12">
                <h4 style="text-align:justify;">
                
                
                <ul>
                <li>DataBase is used for storing Operators, Employees and Admin Credentials (Authentication Purpose).</li><br>
                <li>DataBase has logs generated for operator's every activity and for multiple queries asked by user. </li><br>
                
                <li>We can directly push data of patients to Blockchain but we are using DB for future update purpose and a backup source.</li><br>
                <li>We can't update records in blocks. We have to create a new block for any new entries.</li>
                
                </ul>                
                </h4>      
           </div>
         </div>
      </div>
      </div>
    </div>
    
    
        <div class="carousel-item">
      <div class="text-light" style="height:600px; width:100%; background:black;">
      <div class="text-center" style="padding-top:50px;">
        <h1 class="display-5">Challenges in the process :-</h1>
       <div class="row" style="padding:60px;">
           <div class="col-md-12">
                <h4 style="text-align:justify;">
                
                
                <ul>
                <li>Web3.js stability. (Its a new framework and going through many changes and updation.)</li><br>
                <li>Networking through multiple systems. (Connecting Nodes)</li><br>
                
                <li>Compatibility of Apache + Tomcat + Ethereum (eth) Servers. </li><br>
                <li>Mining Process. (Need medium to high computational power.)</li>
                
                </ul>                
                </h4>      
           </div>
         </div>
      </div>
      </div>
    </div>
    
    <div class="carousel-item">
      <div class="text-light bg-dark" style="height:600px; width:100%;">
      <div class="text-center" style="padding-top:50px;">
        <h1 class="display-5">Web3j-Ethereum Network</h1>
       <div class="row" style="padding:10px;">
           <div class="col-md-12">
           <img src="image/web3.png" alt="network" width:"500" height:"500">
         </div>
        </div>
      </div>
    </div>
    
    
    
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators2" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators2" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
         </div>
       </div>
     </div>
 
    </div>
  </div>
  

  <div class="page_contact" id="fpage_contact">
    <div class="container"><br><br>
      <div class="row">
        <div class="col-md-3">
          <h1>Contact-US @</h1>
          <h2>email:abc@gmail.com</h2>
          <h3>+91-111522554</h3>
        </div>
        <div class="col-md-2"></div>
        <div class="col-md-7">
          <form  id="contact_form">
            <div class="form-group">
              <input type="text" name="name" placeholder="name" class="form-control" required style="background:white; color:black;">

            </div>
            <div class="form-group">
              <input type="email" name="email" placeholder="email" class="form-control" required>
            </div>
            <div class="form-group">
              <input type="number" name="phone" placeholder="Phone No:" class="form-control" required>
            </div>
            <div class="form-group">
              <textarea name="query" rows="8" cols="80" class="form-control" placeholder="Enter Your query" required></textarea>
            </div>
            <div class="form-group">
              <input type="submit" value="submit" class="btn btn-danger">
            </div>
          </form>
        </div>

      </div>
    </div>

  </div>

  <div class="footer text-center" style="background:black; padding:20px; color:#f1f1f1;">
    <p>Copyright (c) 2017 Copyright Holder All Rights Reserved.</p>
  </div>
<!-- End Of Loading div -->
  </div>

  <script type="text/javascript">

    



// -------------------------------------------------
 



$(document).ready(function () {
$("#form1").on("submit",function(e){
	e.preventDefault();
    $.ajax({
      type:'POST',
      url: 'AuthenticateOperator',
      data: $('#form1').serialize(),
      success: function (result) {
    		if(result=="error"){
				$.alert("Wrong Credentials !!");
			}else{
				window.location.assign(result);
			}
      }
    });

  });
  
$("#contact_form").on("submit",function(e){
	e.preventDefault();
    $.ajax({
      type:'POST',
      url: 'ContactForm',
      data: $('#contact_form').serialize(),
      success: function (result) {
    		$.alert(result);
      }
    });

  });
});
    
    
    
    


    $(document).ready(function () {
        $(document).on("scroll", onScroll);
        
        //smoothscroll
        $('a[href^="#f"]').on('click', function (e) {
            e.preventDefault();
            $(document).off("scroll");
            
            $('.nav-link').each(function () {
                $(this).removeClass('active');
            })
            $(this).addClass('active');
            var target = this.hash,
                menu = target;
            $target = $(target);
            $('html, body').stop().animate({
                'scrollTop': $target.offset().top+2
            }, 500, 'swing', function () {
                window.location.hash = target;
                $(document).on("scroll", onScroll);
            });
        });
    });

    function onScroll(event){
        var scrollPos = $(document).scrollTop();
        $('.nav-link').each(function () {
            var currLink = $(this);
            var refElement = $(currLink.attr("href"));
            if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
                $('.nav-link').removeClass("active");
                currLink.addClass("active");
            }
            else{
                currLink.removeClass("active");
            }
        });
    }



//------------------------------------------------------------

  document.onreadystatechange = function () {
  var state = document.readyState
  if (state == 'interactive') {
       document.getElementById('contents').style.visibility="hidden";
  } else if (state == 'complete') {
      setTimeout(function(){
         document.getElementById('interactive');
         document.getElementById('load').style.visibility="hidden";
         document.getElementById('contents').style.visibility="visible";
      },300);
  }
}
  </script>

  </body>
 </html>