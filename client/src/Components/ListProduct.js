import React,{ Component } from "react";
import DataServices from "./DataServices";
export default class ListProduct extends Component{
    constructor(props) {
        super(props);
        this.state = {
            products: [],
            message: null
        }
        this.refreshProducts = this.refreshProducts.bind(this);
        this.addToCartClicked = this.addToCartClicked.bind(this);
    }
    componentDidMount(){
        this.refreshProducts();

    }
    refreshProducts(){
        DataServices.retrieveAllProduct().then(
            response => {
                console.log(response);
                this.setState({products: response
                        .data.data})

            }
        )
    }
    addToCartClicked(){
        DataServices.addToCart().then(
           response =>{
               console.log(response);
           }
        )
    }
    render(){
        return (
            <div className="container">
                <h3>
                    All Products
                </h3>
                <div className="container">
                    <table className="table text-white">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>name</th>
                                <th>Description</th>
                                <th>make</th>
                                <th>price</th>
                                <th>category</th>

                            </tr>
                        </thead>
                        <tbody>
                        {
                            this.state.products.map(
                                product =>
                                    <tr key={product.productId}>
                                        <td>{product.productId}</td>
                                        <td>{product.productName}</td>
                                        <td>{product.productDescription}</td>
                                        <td>{product.make}</td>
                                        <td>{product.price}</td>
                                        <td>{product.category}</td>
                                        <td><button className="btn btn-warning" onClick={() => this.addToCartClicked()}>Add to Cart</button></td>
                                    </tr>

                            )

                        }

                        </tbody>
                    </table>
                </div>
            </div>
        )
    }
}