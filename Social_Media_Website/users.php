<?php

    include("includes/header.php");

?>


        <div class="users_column">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-body">

                        <h4>Find any friends registered to Brainstorm Social below</h4>

                            <hr>


                            <table class="table table-hover table-striped" id="dataTable">

                                <thead>
                                    <th><a href="users.php?sortF=fname" id="userdetails"> First Name &nbsp  <i class="fas fa-sort"></i></a></th>
                                    <th><a href="users.php?sortL=lname" id="userdetails"> Last Name &nbsp   <i class="fas fa-sort"></i></a></th>
                                    <th><a href="users.php?sortE=email" id="userdetails"> Email &nbsp       <i class="fas fa-sort"></i></a></th>
                                    <th><a href="users.php?sortD=date"  id="userdetails"> Profile Picture &nbsp <i class="fas fa-sort"></i></a></th>
                                    <th><a href="users.php"             id="userdetails"> Number of Posts &nbsp      <i class="fas fa-sort"></i></a></th>
                                    <th><a href="users.php"             id="userdetails"> Number of likes &nbsp      <i class="fas fa-sort"></i></a></th>
                                    <th><a href="users.php"             id="userdetails"> Add Friend &nbsp      <i class="fas fa-sort"></i></a></th>
                                </thead>

                                
                                <?php
                                    //Loads all users from the users table
                                    $post = new Post($con, $userLoggedIn);
                                    $post->loadUsers(); 
                                ?>

                                
                                
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</div>
</body>
</html