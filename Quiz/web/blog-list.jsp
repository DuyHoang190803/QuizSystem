<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        .blog-list {
            max-width: 600px;
            margin: 0 auto;
        }

        .blog-item {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
        }

        .blog-title {
            font-size: 18px;
            font-weight: bold;
        }

        .blog-author {
            font-style: italic;
            color: #666;
        }

        .blog-description {
            margin-top: 5px;
        }
    </style>
</head>
<body>

    <div class="blog-list">
        <a href="blogdetail?id=1">
        <div class="blog-item">
            <div class="blog-title">Title 1</div>
            <div class="blog-author">Author 1</div>
            <div class="blog-description">Sum 1</div>
        </div>
        </a>

        <div class="blog-item">
            <div class="blog-title">Title 2</div>
            <div class="blog-author">Author 2</div>
            <div class="blog-description">Sum 2</div>
        </div>

        

    </div>

</body>
</html>
