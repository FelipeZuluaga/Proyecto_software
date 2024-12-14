<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <style>
            /* Fondo oscuro igual al login.jsp */
            body {
                background-color: #2a2e3f;
                color: #ffffff; /* Texto blanco */
                font-family: 'Arial', sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                height: 100vh;
            }
            .container {
                width: 80%;
                margin: auto;
                padding: 20px;
                background-color: #3c3f51;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            }
            .table {
                background-color: #2a2e3f;
                color: #ffffff;
                border-radius: 10px;
            }
            thead {
                background-color: #4b67a1;
                color: #ffffff;
            }
            .btn-primary {
                background-color: #4b67a1;
                border: none;
                border-radius: 20px;
            }
            .btn-primary:hover {
                background-color: #375283;
            }
            .btn-outline-info,
            .btn-outline-danger {
                border-radius: 20px;
            }
            .modal-content {
                background-color: #3c3f51;
                color: #ffffff;
            }
            /* Estilo para el banner superior */
            .banner {
                width: 100%;
                background-color: #4b67a1;
                padding: 10px 0;
                text-align: center;
                margin-bottom: 20px;
            }
            .banner .btn {
                margin-left: 10px;
                margin-right: 10px;
            }
            /* Navbar */
            nav {
                width: 100%;
                background-color: #4b67a1;
                padding: 10px 0;
            }
            nav a {
                color: white;
                margin: 0 15px;
                text-decoration: none;
                font-weight: bold;
            }
            nav a:hover {
                text-decoration: underline;
            }
        </style>     

        <title>Compras</title>

    </head>

    <body >


        <div  ng-app="pagin1" ng-controller="comprasController as c">
            <!-- Sidebar -->
            <jsp:include page="menu.jsp"/>
            <!-- Page Content -->
            <div class="container-fluid">
                <div  class="row">
                    <div class="col-8">

                        <div class="row">
                            <div class="col-12 mt-5">
                                <table class="table table-striped">
                                    <thead>
                                        <tr class="barra">
                                            <th scope="col" colspan="7"> <h3 class="text-center mb-4">Compras de la Compañia</h3></th>
                                            <th scope="col">
                                                <a data-toggle="modal" data-target="#modalGuardar">
                                                    <button class="btn btn-info">Ingresar</button>
                                                </a>

                                            </th>
                                        </tr>
                                        <tr>
                                            <th scope="col">Factura</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Precio Producto</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">Cantidad Comprada</th>
                                            <th scope="col">Total de Compra</th>
                                            <th scope="col">Acciones</th>

                                        </tr>
                                    </thead >
                                    <tbody>
                                        <tr ng-repeat="co in c.Compras">

                                            <td>{{co.numFactura}}</td>
                                            <td>{{co.fecha| date:'dd-MM-yyyy'}}</td>
                                            <td>{{co.producto.nombreProducto}}</td>
                                            <td>{{co.producto.precioProducto}}</td>
                                            <td>{{co.producto.descripcion}}</td>
                                            <td>{{co.cantidad}}</td>
                                            <td>{{co.cantidad * co.producto.precioProducto}}</td>

                                            <td>
                                                <a  ng-click="c.editar(co.numFactura)" data-toggle="modal" data-target="#modalEditar">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                    </svg>
                                                </a>    
                                            </td>    
                                        </tr>         
                                    </tbody>    
                                </table>
                            </div>
                        </div>
                        <!-- Modal editar-->
                        <div class="modal fade" id="modalEditar" tabindex="-1" aria-labelledby="editarModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editarModalLabel">ACTUALIZAR /// ELIMINAR </h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body" >
                                        <div class="row">
                                            <div class="col-12">
                                                <label><h6>Fecha</h6></label>
                                                <input class="form-control" type="date"  placeholder="DD/MM/AAA"  ng-model="c.fecha">
                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class="col-12">
                                                <label><h6>Numero Factura</h6></label>
                                                <input class="form-control" type="text"  disabled="" value="{{c.numFactura}}">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <label>nombre Producto</label>
                                                <select class="form-control" ng-model="c.nomProducto">      
                                                    <option  ng-repeat="p in c.Productos"  value="{{p.idProducto}}">{{p.nombreProducto}}</option>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <label><h6>Cantidad </h6></label>
                                                <input class="form-control" type="Number" placeholder="Cantidad" ng-model="c.cantidad">
                                            </div>

                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#modalEliminar" >eliminar</button>
                                        <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#modalActualizar">Actualizar</button>
                                    </div>
                                </div>  
                            </div>
                        </div>   
                        <!-- Modal guardar-->
                        <div class="modal fade" id="modalGuardar" tabindex="-1" aria-labelledby="guardarModalLabel" aria-hidden="true" >
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-center " id="guardarModalLabel">INGRESE FACTURA DE COMPRA</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">

                                        <div class="row">
                                            <div class="col-12">
                                                <label><h6>Fecha</h6></label>
                                                <input class="form-control" type="date"  placeholder="DD/MM/AAA"  ng-model="c.fecha">
                                            </div>

                                        </div>
                                        <div class="row">


                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <label>nombre Producto</label>
                                                <select class="form-control" ng-model="c.nomProducto">      
                                                    <option  ng-repeat="p in c.Productos"  value="{{p.idProducto}}">{{p.nombreProducto}}</option>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <label><h6>Cantidad </h6></label>
                                                <input class="form-control" type="Number" placeholder="Cantidad" ng-model="c.cantidad">
                                            </div>

                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                        <button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="c.guardar()">Comprar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal Actualizar-->
                        <div class="modal fade" id="modalActualizar" tabindex="-1" aria-labelledby="actualizarModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="actualizarModalLabel">¿Está seguro de Actualizar este registro?</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        El registro será Actualizado completamente de la base de datos
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                        <button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="c.actualizar()">Si</button>
                                    </div>
                                </div>
                            </div>
                        </div>      
                        <!-- Modal eliminar-->
                        <div class="modal fade" id="modalEliminar" tabindex="-1" aria-labelledby="eliminarModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="eliminarModalLabel">¿Está seguro de eliminar este registro?</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        El registro será eliminado completamente de la base de datos
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                        <button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="c.eliminar()">Si</button>
                                    </div>
                                </div>
                            </div>
                        </div>      
                    </div>    
                </div>    
                <script>
                            var app = angular.module('pagin1', []);
                            app.controller('comprasController', ['$http', controladorCompras]);
                            function controladorCompras($http) {
                                var c = this;

                                validar = function (tipoDeValidacion) {
                                    var numFactura = c.numFactura ? true : false;
                                    var fecha = c.fecha ? true : false;
                                    var nomProducto = c.nomProducto ? true : false;
                                    var cantidad = c.cantidad ? true : false;

                                    if (tipoDeValidacion === 'todosLosCampos') {
                                        if (numFactura && fecha && nomProducto && cantidad) {
                                            return true;
                                        } else {
                                            return false;
                                        }
                                    } else if (tipoDeValidacion === 'todosLosCamposSinFactura') {
                                        if (fecha && nomProducto && cantidad) {
                                            return true;
                                        } else {
                                            return false;
                                        }
                                    } else if (tipoDeValidacion === 'numFactura') {
                                        if (numFactura) {
                                            return true;
                                        } else {
                                            return false;
                                        }
                                    } else {
                                        return false;
                                    }

                                };
                                consultarProductos = function () {
                                    var parametros = {
                                        proceso: 'listar'
                                    };
                                    $http({
                                        method: 'POST',
                                        url: 'Peticiones/peticionesProducto.jsp',
                                        params: parametros
                                    }).then(function (res) {
                                        c.Productos = res.data.Productos;
                                    });
                                };
                                consultarProductos();
                                c.listar = function () {
                                    var parametros = {
                                        proceso: 'listar'
                                    };
                                    $http({
                                        method: 'POST',
                                        url: 'Peticiones/peticionesCompras.jsp',
                                        params: parametros

                                    }).then(function (res) {
                                        c.Compras = res.data.Compras;
                                    });
                                };
                                c.editar = function (numf) {
                                    var parametros = {
                                        proceso: 'consultarIndividual',
                                        numFactura: numf
                                    };
                                    $http({
                                        method: 'POST',
                                        url: 'Peticiones/peticionesCompras.jsp',
                                        params: parametros
                                    }).then(function (res) {


                                        c.fecha = res.data.Compra.fecha;
                                        c.numFactura = res.data.Compra.numFactura;
                                        c.nomProducto = res.data.Compra.nomProducto;
                                        c.cantidad = res.data.Compra.cantidad;


                                    });
                                    c.listar();
                                };
                                c.guardar = function () {
                                    if (validar('todosLosCamposSinFactura')) {
                                        var parametros = {

                                            proceso: 'guardar',

                                            numFactura: c.numFactura,
                                            fecha: c.fecha,
                                            nomProducto: c.nomProducto,
                                            cantidad: c.cantidad

                                        };
                                        $http({
                                            method: 'POST',
                                            url: 'Peticiones/peticionesCompras.jsp',
                                            params: parametros
                                        }).then(function (res) {
                                            if (res.data.ok === true) {
                                                if (res.data.guardar === true) {
                                                    swal({
                                                        title: "Guardo Exitosamente La Compra!",
                                                        text: "!Exitoso!",
                                                        icon: "success"
                                                    });
                                                    c.listar();
                                                } else {
                                                    swal({
                                                        title: "Fallo la Compra !",
                                                        text: "!Fallo Valide los datos !",
                                                        icon: "error"
                                                    });
                                                }
                                            } else {
                                                alert(res.data.errorMsg);
                                            }
                                        });
                                    } else {
                                        swal({
                                            title: "RELLENE LOS COMPOS!",
                                            text: "!ALGO TE FALTA!",
                                            icon: "info"
                                        });
                                    }
                                };
                                c.eliminar = function () {
                                    if (validar('numFactura')) {
                                        var parametros = {
                                            proceso: 'eliminar',
                                            numFactura: c.numFactura
                                        };
                                        $http({
                                            method: 'POST',
                                            url: 'Peticiones/peticionesCompras.jsp',
                                            params: parametros

                                        }).then(function (res) {
                                            if (res.data.ok === true) {
                                                if (res.data.eliminar === true) {
                                                    swal({
                                                        title: "elimino Exitosamente La Compra!",
                                                        text: "!Exitoso!",
                                                        icon: "success"
                                                    });
                                                    c.listar();
                                                } else {
                                                    swal({
                                                        title: "Fallo en la eliminacion!",
                                                        text: "!Fallo Valide los datos !",
                                                        icon: "error"
                                                    });
                                                }
                                            } else {
                                                alert(res.data.errorMsg);
                                            }

                                        });
                                    } else {
                                        swal({
                                            title: "RELLENE NUMERO DE FACTURA!",
                                            text: "!ALGO TE FALTA!",
                                            icon: "info"
                                        });
                                    }
                                };
                                c.actualizar = function () {

                                    var parametros = {
                                        proceso: 'actualizar',
                                        numFactura: c.numFactura,
                                        fecha: c.fecha,
                                        nomProducto: c.nomProducto,
                                        cantidad: c.cantidad
                                    };
                                    $http({
                                        method: 'POST',
                                        url: 'Peticiones/peticionesCompras.jsp',
                                        params: parametros

                                    }).then(function (res) {
                                        if (res.data.ok === true) {
                                            if (res.data.actualizar === true) {
                                                swal({
                                                    title: "Actualizacion  Exitosamente de  La Compra!",
                                                    text: "!Exitoso!",
                                                    icon: "success"
                                                });
                                                c.listar();
                                            } else {
                                                swal({
                                                    title: "Fallo La actualizacion!",
                                                    text: "!Fallo Valide los datos !",
                                                    icon: "error"
                                                });
                                            }
                                        } else {
                                            alert(res.data.errorMsg);
                                        }

                                    });


                                };
                                c.cerrarSesion = function () {
                                    var parametros = {
                                        proceso: 'cerrarSesion'
                                    };
                                    $http({
                                        method: 'POST',
                                        url: 'Peticiones/peticionesLogin.jsp',
                                        params: parametros

                                    }).then(function (res) {
                                        if (res.data.ok === true) {
                                            window.location.href = "Login.html";
                                        } else {
                                            alert(res.data.errorMsg);
                                        }

                                    });
                                };
                                c.listar();
                            }
                </script>

                </body>    
                </html>
