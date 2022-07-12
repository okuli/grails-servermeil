<!doctype html>
<html>
    <head>
        <title>List of Products</title>
    </head>
    <body>
        ${allProducts.name} - ${allProducts.sku} - ${allProducts.price} - ${allProducts.quantity}
        <table border="1">
            <g:each in="${allProducts}" var="thisProduct">
                <tr>
                    <td>${thisProduct.getName()}</td>
                    <td>${thisProduct.getSku()}</td>
                    <td>${thisProduct.getPrice()}</td>
                    <td>${thisProduct.getQuantity()}</td>
                </tr>
            </g:each>
    </table>
    </body>
</html>