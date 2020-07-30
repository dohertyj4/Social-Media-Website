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
                                    <th><a href="users.php" id="userdetails"> First Name &nbsp</a></th>
                                    <th><a href="users.php" id="userdetails"> Last Name &nbsp</a></th>
                                    <th><a href="users.php" id="userdetails"> Email &nbsp</a></th>
                                    <th><a href="users.php"  id="userdetails"> Profile Picture &nbsp</a></th>
                                    <th><a href="users.php"             id="userdetails"> Number of Posts &nbsp</i></a></th>
                                    <th><a href="users.php"             id="userdetails"> Number of likes &nbsp</i></a></th>
                                    <th><a href="users.php"             id="userdetails"> Add Friend &nbsp</a></th>
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