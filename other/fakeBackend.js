var express = require("express")
var bodyParser = require("body-parser")

var app  = express()

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

var productsBackend = {
  productsCategory: {
    success: "../app/stubs/products/prod-category/stubGetProductsCategory-success.json",
    error: "../app/stubs/products/prod-category/stubGetProductsCategory-success.json"
  }
}


app.get('/be/productsCategories.php', function(rq, rp){
  rp.json(require(productsBackend.productsCategory.success));
});



module.exports = app;
