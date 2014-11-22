<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Stretch Projects - SQL injection example</title>
        <style>
            * {
                font-family: 'Verdana';
                font-size: 20px;
                border-collapse: collapse;
                margin: 1em;
            }
            table, td, th {
                border: 1px solid black;
                margin: 0px;
            }
        </style>
    </head>
    <body>
        <?php
        $user_value = '';
        if (isset($_POST['sql'])) {
            $user_value = $_POST['sql'];
        }
        ?>

        <form action="." method="post">
            <label>Staff number:
            <input type="text" name="sql" value="<?php echo $user_value; ?>"/>
            </label>
            <input type="submit" value="Submit"/>
        </form>
        <hr/>
        <?php
        /*
         *                                           CAUTION
         *
         *  This is a demonstration of SQL injection - Don't write your SQL queries like this!!!
         *
         */
        $dbh = new PDO('mysql:host=localhost:3306;dbname=restaurant', 'root', 'mypassword');
        $query = $dbh->prepare('select * from staff where staff_number=' . $user_value);
        $query->execute();
        $out = $query->fetchAll(PDO::FETCH_ASSOC);

        $header = [];
        $body = '';
        foreach ($out as $row) {
            $body .= '<tr>';
            foreach ($row as $key => $value) {
                array_push($header, $key);
                $body .= '<td>' . $value . '</td>';
            }
            $body .= '</tr>';
        }
        ?>
        <table>
            <tr>
                <th>
                    <?php
                    echo implode('</th><th>', array_unique($header));
                    ?>
                </th>
                <?php
                echo $body;
                ?>
        </table>
    </body>
</html>
